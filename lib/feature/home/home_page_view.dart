import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/model/home/movies.dart';
import 'package:domain/model/home/popular_movies.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_page.dart';
import 'package:flutter_base/feature/extended_details/extended_details_dialog.dart';
import 'package:flutter_base/feature/extended_details/extended_details_page.dart';
import 'package:flutter_base/feature/home/home_page_view_model.dart';
import 'package:flutter_base/feature/movie_details/movie_details_page.dart';
import 'package:flutter_base/main/navigation/route_paths.dart';
import 'package:flutter_base/ui/extended_details_dialog_page.dart';
import 'package:flutter_base/ui/molecule/cached_network_image.dart';
import 'package:flutter_base/ui/molecule/stream_builder/app_stream_builder.dart';
import 'package:flutter_base/ui/molecule/widgets/widget.dart';
import 'package:flutter_base/utils/color_utils.dart';
import 'package:flutter_base/utils/resource.dart';
import 'package:flutter_base/utils/status.dart';
import 'package:flutter_base/utils/string_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Movie categories page ui
class HomePageView extends BasePageViewWidget<HomePageViewModel> {
  HomePageView(ProviderBase model) : super(model);

  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Home Page',
                  style: TextStyle(
                      color: AppColor.grass,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      fontSize: 31.0),
                ),
              ),
            ),
            Container(
                height: 150,
                child: AppStreamBuilder<Resource<List<PopularMovies>>>(
                  initialData: Resource.none(),
                  stream: model.latestMoviesResponseStream,
                  dataBuilder: (context, latestMovieResponse) {
                    return (latestMovieResponse.status == Status.LOADING)
                          ? circularProgressIndicator()
                          : (latestMovieResponse.data != null && latestMovieResponse.data.length > 0)
                           ? CarouselSlider(
                              items: _trending(context, latestMovieResponse.data),
                              options: CarouselOptions(
                              scrollPhysics: ClampingScrollPhysics(),
                              height: 150,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: Duration(milliseconds: 500),
                              viewportFraction: 0.7),
                           ): SizedBox.shrink();
                  },
                )),
            Expanded(
              child: AppStreamBuilder<List<Movies>>(
                initialData: [],
                stream: model.movieResponseStream,
                dataBuilder: (context, movies) {
                  return DragAndDropLists(


                    contentsWhenEmpty: Text(
                      'No data',
                      style: TextStyle(color: AppColor.black),
                    ),
                    axis: Axis.vertical,
                    itemGhostOpacity: 1,
                    listDividerOnLastChild: true,
                    children: List.generate(movies.length, (index) {
                      return DragAndDropList(
                        contentsWhenEmpty: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'No data',
                            style: TextStyle(color: AppColor.black),
                          ),
                        ),
                        header: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    '${movies[index].header}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: AppColor.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        children: innerListItems(context, movies[index].movieList),
                      );
                    }),
                    onItemReorder: (oldItemIndex, oldListIndex, newItemIndex, newListIndex) {
                      model.onItemReorder(oldItemIndex, oldListIndex, newItemIndex, newListIndex);
                    },
                    onListReorder: (oldListIndex, newListIndex) {
                      model.onListReorder(oldListIndex, newListIndex);
                    },
                    listPadding: EdgeInsets.symmetric(vertical: 10),
                    itemDivider: Divider(
                      thickness: 5,
                      height: 5,
                      color: AppColor.white,
                    ),
                    itemDecorationWhileDragging: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    listDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Colors.deepPurple.withOpacity(0.1)),
                      color: Colors.deepPurple.withOpacity(0.1),
                    ),
                    listInnerDecoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    lastItemTargetHeight: 8,
                    addLastItemTargetHeightToTop: true,
                    lastListTargetSize: 40,
                    listDragHandle: DragHandle(
                      verticalAlignment: DragHandleVerticalAlignment.top,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.drag_handle,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    itemDragHandle: DragHandle(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.drag_handle,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _trending(context, List<PopularMovies> data) {
    List<Widget> wList = [];

    if (data.length > 0) {
      for (int i = 0; i < data.length; i++) {
        Widget c = InkWell(
          onTap: () {
            // Navigator.pushNamed(context, RoutePaths.MovieDetails,
            //     arguments: MovieDetailsPageArguments(popularMovies: data[i]));
            Navigator.pushNamed(context, RoutePaths.ExtendedDetails,
                arguments: ExtendedDetailsPageArguments());

            ExtendedDetailsDialog.show(
              context,
              isScrollControlled: false,
              builder: (context) => ExtendedDetailsDialogPage(),
            );
          },
          child: Hero(
            tag: data[i].id,
            child: Card(
              shadowColor: Colors.grey,
              elevation: 0,
              child: Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        StringUtil.getImageUrl500(data[i].posterPath)),
                    fit: BoxFit.cover,
                  ),
                ),

              ),
            ),
          ),
        );
        wList.add(c);
      }
    }
    return wList;
  }

  List<DragAndDropItem> innerListItems(context, List<PopularMovies> data) {
    return List.generate(data.length, (index) {
      return DragAndDropItem(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutePaths.MovieDetails,
                arguments:
                    MovieDetailsPageArguments(popularMovies: data[index]));
          },
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 60,
                width: 60,
                child: Hero(
                  tag: data[index].id,
                  child: CatchNetworkImage(
                    isImageCircular: true,
                    iconUrl: StringUtil.getImageUrl500(data[index].posterPath),
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 30),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    '${data[index].title}',
                    style: TextStyle(color: AppColor.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

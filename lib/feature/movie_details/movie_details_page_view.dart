import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/model/home/popular_movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_page.dart';
import 'package:flutter_base/feature/movie_details/movie_details_page_viewmodel.dart';
import 'package:flutter_base/ui/molecule/cached_network_image.dart';
import 'package:flutter_base/ui/molecule/horizontal_scroll.dart';
import 'package:flutter_base/ui/molecule/stream_builder/app_stream_builder.dart';
import 'package:flutter_base/ui/molecule/widgets/widget.dart';
import 'package:flutter_base/utils/color_utils.dart';
import 'package:flutter_base/utils/resource.dart';
import 'package:flutter_base/utils/status.dart';
import 'package:flutter_base/utils/string_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailsPageView
    extends BasePageViewWidget<MovieDetailsPageViewModel> {
  MovieDetailsPageView(ProviderBase model) : super(model);

  @override
  Widget build(BuildContext context, MovieDetailsPageViewModel model) {
    double orjWidth = MediaQuery.of(context).size.width;
    double cameraWidth = orjWidth / 24;
    double yourWidth = (orjWidth - cameraWidth) / 5;

    return CustomScrollView(
      primary: true,
      slivers: [
        SliverAppBar(
          backgroundColor: AppColor.white,
          expandedHeight: 300.0,
          floating: true,
          pinned: true,
          primary: true,
          actions: [
            Container(
                child: Icon(Icons.favorite, color: AppColor.white,),
              padding: EdgeInsets.all(10),
            ),
            Container(
              child: Icon(Icons.share_rounded, color: AppColor.white,),
              padding: EdgeInsets.all(10),
            ),
          ],
          actionsIconTheme: IconThemeData(opacity: 1),
          flexibleSpace: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Hero(
                    tag: model.movieDetailsArguments.popularMovies.id,
                    child: CachedNetworkImage(
                      imageUrl: StringUtil.getImageUrl500(
                          model.movieDetailsArguments.popularMovies.posterPath),
                      fit: BoxFit.cover,
                    ),

              )),
            ],
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                // take the theme of current context and copy with => white so it will act as accent color for this
                child: Container(
                  height: 48.0,
                  color: AppColor.white,
                  alignment: Alignment.center,
                  child: TabBar(
                    labelStyle: TextStyle(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                    physics: ClampingScrollPhysics(),
                    controller: model.tabController,
                    labelColor: Colors.black,
                    isScrollable: true,
                    labelPadding: EdgeInsets.symmetric(
                        horizontal: (orjWidth - (cameraWidth + yourWidth * 3)) / 8),
                    indicatorColor: AppColor.grass,
                    unselectedLabelColor: Colors.grey,
                    tabs: <Widget>[
                      Container(width: yourWidth, child: Tab(text: "DETAILS")),
                      Container(
                        width: yourWidth,
                        child: Tab(
                          text: "TOP RATED",
                        ),
                      ),
                      Container(
                        width: yourWidth,
                        child: Tab(
                          text: "UPCOMING",
                        ),
                      ),
                      Container(
                          width: cameraWidth,
                          alignment: Alignment.center,
                          color: AppColor.white,
                          child: Tab(icon: Icon(Icons.camera_alt))),
                    ],
                  ),
                ),
              )),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                    physics: ClampingScrollPhysics(),
                    controller: model.tabController,
                    children: <Widget>[
                      ListView(
                        primary: false,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${model.movieDetailsArguments.popularMovies.title}'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.black),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Adventure. Family. Fantasy',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.0,
                                ),
                                rattingBar(),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, top: 20.0, right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Year',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            '2019',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Country',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            'USA',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Length',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          SizedBox(height: 2.0),
                                          Text(
                                            '125 min',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 30),
                            child: Text(
                              '${model.movieDetailsArguments.popularMovies.overview}',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                              softWrap: true,
                            ),
                          ),
                          AppStreamBuilder<Resource<List<PopularMovies>>>(
                            initialData: Resource.none(),
                            stream: model.similarMoviesResponseStream,
                            dataBuilder: (context, similarMovies) {
                              return (similarMovies.status == Status.LOADING)
                                  ? circularProgressIndicator()
                                  : (similarMovies.data == null ||
                                          similarMovies.data.length == 0)
                                      ? Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                              'No data found',
                                              style: const TextStyle(
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        )
                                      : HorizontalScrollView(
                                          images: model.getImageList(similarMovies.data),
                                          title: 'Similar Category',
                                          imageHeight: 200.0,
                                          imageWidth: 230.0,
                                        );
                            },
                          ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 4),
                        child: AppStreamBuilder<Resource<List<PopularMovies>>>(
                          initialData: Resource.none(),
                          stream: model.similarMoviesResponseStream,
                          dataBuilder: (context, data) {
                            return data.status == Status.LOADING
                                ? circularProgressIndicator()
                                : Container(
                                    padding: EdgeInsets.only(bottom: 20),
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      physics: ClampingScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 18,
                                        mainAxisSpacing: 18,
                                        childAspectRatio: (2 / 1.7),
                                      ),
                                      itemCount: data.data.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(vertical: 0,),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black54,
                                                offset: Offset(0.0, 4.0),
                                                blurRadius: 6.0,
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10.0),
                                              child: CatchNetworkImage(
                                                iconUrl: StringUtil.getImageUrl500(data.data[index].posterPath),
                                              )),
                                        );
                                      },
                                    ),
                                  );
                          },
                          onData: (data) {},
                        ),
                      ),
                      Container(
                        width: yourWidth,
                        child: Tab(
                          text: "UPCOMING",
                        ),
                      ),
                      Container(
                          width: cameraWidth,
                          alignment: Alignment.center,
                          color: AppColor.white,
                          child: Tab(icon: Icon(Icons.camera_alt))),
                    ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row rattingBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Icon(
          Icons.star,
          color: Colors.black,
        ),
      ],
    );
  }
}

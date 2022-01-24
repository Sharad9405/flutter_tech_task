import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/model/home/popular_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_page.dart';
import 'package:flutter_base/feature/extended_details/extended_details_page_viewmodel.dart';
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

class ExtendedDetailsPageView
    extends BasePageViewWidget<ExtendedDetailsPageViewModel> {
  ExtendedDetailsPageView(ProviderBase model) : super(model);

  @override
  Widget build(BuildContext context, ExtendedDetailsPageViewModel model) {
    double orjWidth = MediaQuery.of(context).size.width;
    double cameraWidth = orjWidth / 24;
    double yourWidth = (orjWidth - cameraWidth) / 5;

    return CustomScrollView(
      primary: true,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[

            ],
          ),
        ),
      ],
    );
  }

}

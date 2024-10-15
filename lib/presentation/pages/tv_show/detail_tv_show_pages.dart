import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/presentation/provider/tv_show/detail_tv_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailTvPages extends StatefulWidget {
  static const ROUTE_NAME = '/tv-detail';
  const DetailTvPages({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<DetailTvPages> createState() => _DetailTvPagesState();
}

class _DetailTvPagesState extends State<DetailTvPages> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() {
      Provider.of<DetailTvController>(context, listen: false)
          .getDetailData(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailTvController>(
        builder: (context, controller, child) {
          if (controller.detailState == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.detailState == RequestState.Loaded) {
            final data = controller.tvDetailResponse;
            return DetailContent(
              tvDetailResponse: data ?? TvDetailResponse(),
            );
          } else {
            return Text(controller.message);
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({Key? key, required this.tvDetailResponse})
      : super(key: key);

  final TvDetailResponse tvDetailResponse;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$BASE_IMAGE_URL${tvDetailResponse.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ],
    );
  }
}

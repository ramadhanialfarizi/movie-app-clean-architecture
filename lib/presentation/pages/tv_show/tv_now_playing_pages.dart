import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/tv_show/detail_tv_show_pages.dart';
import 'package:ditonton/presentation/provider/tv_show/tv_now_playing_controller.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvNowPlayingPages extends StatefulWidget {
  const TvNowPlayingPages({super.key});

  static const ROUTE_NAME = '/tv-now-playing';

  @override
  State<TvNowPlayingPages> createState() => _TvNowPlayingPagesState();
}

class _TvNowPlayingPagesState extends State<TvNowPlayingPages> {
  @override
  void initState() {
    Future.microtask(
      () => Provider.of<TvNowPlayingController>(context, listen: false)
        ..loadTVShowOnAir(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TvNowPlayingController>(
          builder: (context, controller, child) {
            if (controller.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final data =
                      (controller.tvOnAirListResponse?.results ?? [])[index];
                  return TvListCard(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        DetailTvPages.ROUTE_NAME,
                        arguments: data.id,
                      );
                    },
                    title: data.name ?? "",
                    overview: data.overview ?? "",
                    imageLink: data.posterPath ?? "",
                  );
                },
                itemCount: controller.tvOnAirListResponse?.results?.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(controller.message),
              );
            }
          },
        ),
      ),
    );
  }
}

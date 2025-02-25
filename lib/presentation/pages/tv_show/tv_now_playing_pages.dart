import 'package:ditonton/presentation/bloc/tv_show/now_playing_tv/now_playing_tv_bloc.dart';
import 'package:ditonton/presentation/pages/tv_show/detail_tv_show_pages.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvNowPlayingPages extends StatefulWidget {
  const TvNowPlayingPages({super.key});

  static const ROUTE_NAME = '/tv-now-playing';

  @override
  State<TvNowPlayingPages> createState() => _TvNowPlayingPagesState();
}

class _TvNowPlayingPagesState extends State<TvNowPlayingPages> {
  @override
  void initState() {
    // Future.microtask(
    //   () => Provider.of<TvNowPlayingController>(context, listen: false)
    //     ..loadTVShowOnAir(),
    // );

    context.read<NowPlayingTvBloc>().add(OnLoadNowPlayingTv());
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
        // child: Consumer<TvNowPlayingController>(
        //   builder: (context, controller, child) {
        //     if (controller.state == RequestState.Loading) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (controller.state == RequestState.Loaded) {
        //       return ListView.builder(
        //         itemBuilder: (context, index) {
        //           final data =
        //               (controller.tvOnAirListResponse?.results ?? [])[index];
        //           return TvListCard(
        //             onPressed: () {
        //               Navigator.pushNamed(
        //                 context,
        //                 DetailTvPages.ROUTE_NAME,
        //                 arguments: data.id,
        //               );
        //             },
        //             title: data.name ?? "",
        //             overview: data.overview ?? "",
        //             imageLink: data.posterPath ?? "",
        //           );
        //         },
        //         itemCount: controller.tvOnAirListResponse?.results?.length,
        //       );
        //     } else {
        //       return Center(
        //         key: Key('error_message'),
        //         child: Text(controller.message),
        //       );
        //     }
        //   },
        // ),
        child: BlocBuilder<NowPlayingTvBloc, NowPlayingTvState>(
          builder: (context, state) {
            if (state is NowPlayingTvLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NowPlayingTvHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final data = (state.result.results ?? [])[index];
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
                itemCount: state.result.results?.length,
              );
            } else if (state is NowPlayingTvError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text("No data"),
              );
            }
          },
        ),
      ),
    );
  }
}

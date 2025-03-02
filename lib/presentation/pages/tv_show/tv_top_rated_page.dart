import 'package:ditonton/presentation/bloc/tv_show/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:ditonton/presentation/pages/tv_show/detail_tv_show_pages.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvTopRatedPage extends StatefulWidget {
  const TvTopRatedPage({Key? key}) : super(key: key);

  static const ROUTE_NAME = '/tv-top-rated';

  @override
  State<TvTopRatedPage> createState() => _TvTopRatedPageState();
}

class _TvTopRatedPageState extends State<TvTopRatedPage> {
  @override
  void initState() {
    // Future.microtask(
    //   () => Provider.of<TvTopRatedController>(context, listen: false)
    //     ..loadTvShowTopRated(),
    // );

    Future.microtask(
      () {
        context.read<TopRatedTvBloc>().add(OnLoadTopRatedTv());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: Consumer<TvTopRatedController>(
        //   builder: (context, controller, child) {
        //     if (controller.state == RequestState.Loading) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (controller.state == RequestState.Loaded) {
        //       return ListView.builder(
        //         itemBuilder: (context, index) {
        //           final data = (controller.tvTopRated?.results ?? [])[index];
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
        //         itemCount: controller.tvTopRated?.results?.length,
        //       );
        //     } else {
        //       return Center(
        //         key: Key('error_message'),
        //         child: Text(controller.message),
        //       );
        //     }
        //   },
        // ),
        child: BlocBuilder<TopRatedTvBloc, TopRatedTvState>(
          builder: (context, state) {
            if (state is TopRatedTvLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedTvHasData) {
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
            } else if (state is TopRatedTvError) {
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

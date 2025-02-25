import 'package:ditonton/presentation/bloc/tv_show/popular_tv/popular_tv_bloc.dart';
import 'package:ditonton/presentation/pages/tv_show/detail_tv_show_pages.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvPopularPage extends StatefulWidget {
  const TvPopularPage({Key? key}) : super(key: key);

  static const ROUTE_NAME = '/tv-popular';

  @override
  State<TvPopularPage> createState() => _TvPopularPageState();
}

class _TvPopularPageState extends State<TvPopularPage> {
  @override
  void initState() {
    // Future.microtask(
    //   () => Provider.of<TvPopularController>(context, listen: false)
    //     ..loadTvPopularData(),
    // );

    Future.microtask(
      () {
        context.read<PopularTvBloc>().add(OnLoadPopularTv());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular TV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: Consumer<TvPopularController>(
        //   builder: (context, controller, child) {
        //     if (controller.popularState == RequestState.Loading) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (controller.popularState == RequestState.Loaded) {
        //       return ListView.builder(
        //         itemBuilder: (context, index) {
        //           final data =
        //               (controller.tvPopularListResponse?.results ?? [])[index];
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
        //         itemCount: controller.tvPopularListResponse?.results?.length,
        //       );
        //     } else {
        //       return Center(
        //         key: Key('error_message'),
        //         child: Text(controller.message),
        //       );
        //     }
        //   },
        // ),
        child: BlocBuilder<PopularTvBloc, PopularTvState>(
          builder: (context, state) {
            if (state is PopularTvLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvHasData) {
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
            } else if (state is PopularTvError) {
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

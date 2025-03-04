import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/bloc/tv_show/watchlist_tv/watchlist_tv_bloc.dart';
import 'package:ditonton/presentation/pages/tv_show/detail_tv_show_pages.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistTvPages extends StatefulWidget {
  const WatchlistTvPages({super.key});

  @override
  State<WatchlistTvPages> createState() => _WatchlistTvPagesState();
}

class _WatchlistTvPagesState extends State<WatchlistTvPages> with RouteAware {
  @override
  void initState() {
    // Future.microtask(() =>
    //     Provider.of<WatchlistTvController>(context, listen: false)
    //         .fetchWatchlistTV());

    Future.microtask(
      () => context.read<WatchlistTvBloc>().add(OnloadWatchlistTv()),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    // Provider.of<WatchlistTvController>(context, listen: false)
    //     .fetchWatchlistTV();
    context.read<WatchlistTvBloc>().add(OnloadWatchlistTv());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // child: Consumer<WatchlistTvController>(
      //   builder: (context, data, child) {
      //     if (data.watchlistState == RequestState.Loading) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (data.watchlistState == RequestState.Loaded) {
      //       if (data.watchlistTV.isNotEmpty) {
      //         return ListView.builder(
      //           itemBuilder: (context, index) {
      //             final dataTv = data.watchlistTV[index];
      //             return TvListCard(
      //               onPressed: () {
      //                 Navigator.pushNamed(
      //                   context,
      //                   DetailTvPages.ROUTE_NAME,
      //                   arguments: dataTv.id,
      //                 );
      //               },
      //               title: dataTv.title ?? "",
      //               overview: dataTv.overview ?? "",
      //               imageLink: dataTv.posterPath ?? "",
      //             );
      //           },
      //           itemCount: data.watchlistTV.length,
      //         );
      //       } else {
      //         return Center(
      //           child: Text("You don't have any TV watchlist"),
      //         );
      //       }
      //     } else {
      //       return Center(
      //         key: Key('error_message'),
      //         child: Text(data.message),
      //       );
      //     }
      //   },
      // ),
      child: BlocBuilder<WatchlistTvBloc, WatchlistTvState>(
        builder: (context, state) {
          if (state is WatchlistTvLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WatchlistTvHasData) {
            if (state.result.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final dataTv = state.result[index];
                  return TvListCard(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        DetailTvPages.ROUTE_NAME,
                        arguments: dataTv.id,
                      );
                    },
                    title: dataTv.title ?? "",
                    overview: dataTv.overview ?? "",
                    imageLink: dataTv.posterPath ?? "",
                  );
                },
                itemCount: state.result.length,
              );
            } else {
              return Center(
                child: Text("You don't have any TV watchlist"),
              );
            }
          } else {
            String message = "";
            if (state is WatchlistTvError) {
              message = state.message;
            }
            return Center(
              key: Key('error_message'),
              child: Text(message),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

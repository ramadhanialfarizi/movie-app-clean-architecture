import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class WatchlistMoviesPage extends StatefulWidget {
  // static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() =>
    //     Provider.of<WatchlistMovieNotifier>(context, listen: false)
    //         .fetchWatchlistMovies());

    context.read<WatchlistMovieBloc>().add(OnLoadWatchlistMovie());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    Provider.of<WatchlistMovieNotifier>(context, listen: false)
        .fetchWatchlistMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // child: Consumer<WatchlistMovieNotifier>(
      //   builder: (context, data, child) {
      //     if (data.watchlistState == RequestState.Loading) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (data.watchlistState == RequestState.Loaded) {
      //       if (data.watchlistMovies.isNotEmpty) {
      //         return ListView.builder(
      //           itemBuilder: (context, index) {
      //             final movie = data.watchlistMovies[index];
      //             return MovieCard(movie);
      //           },
      //           itemCount: data.watchlistMovies.length,
      //         );
      //       } else {
      //         return Center(
      //           child: Text("You don't have any movie watchlist"),
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
      child: BlocBuilder<WatchlistMovieBloc, WatchlistMovieState>(
        builder: (context, state) {
          if (state is WatchlistMovieLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WatchlistMovieHasData) {
            if (state.result.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.result[index];
                  return MovieCard(movie);
                },
                itemCount: state.result.length,
              );
            } else {
              return Center(
                child: Text("You don't have any movie watchlist"),
              );
            }
          } else if (state is WatchlistMovieError) {
            return Center(
              key: Key('error_message'),
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text("can't get data please try again"),
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

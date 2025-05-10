import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:ditonton/presentation/bloc/movie/detail_movie/load_detail_bloc/detail_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/detail_movie/watchlist_bloc/watchlist_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing_movie/now_playing_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/popular_movie/popular_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/search/search_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated_movie/top_rated_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist_movie/watchlist_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_show/detail_tv/add_watchlist_tv/add_watchlist_tv_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_show/detail_tv/load_detail_tv/load_detail_tv_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_show/now_playing_tv/now_playing_tv_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_show/popular_tv/popular_tv_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_show/search_tv/search_tv_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_show/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_show/watchlist_tv/watchlist_tv_bloc.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/pages/top_rated_movies_page.dart';
import 'package:ditonton/presentation/pages/tv_show/detail_tv_show_pages.dart';
import 'package:ditonton/presentation/pages/tv_show/search_tv_pages.dart';
import 'package:ditonton/presentation/pages/tv_show/tv_now_playing_pages.dart';
import 'package:ditonton/presentation/pages/tv_show/tv_popular_page.dart';
import 'package:ditonton/presentation/pages/tv_show/tv_show_page.dart';
import 'package:ditonton/presentation/pages/tv_show/tv_top_rated_page.dart';
import 'package:ditonton/presentation/pages/watchlist_main_page.dart';
// import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
// import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
// import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
// import 'package:ditonton/presentation/provider/popular_movies_notifier.dart';
// import 'package:ditonton/presentation/provider/top_rated_movies_notifier.dart';
// import 'package:ditonton/presentation/provider/tv_show/detail_tv_controller.dart';
// import 'package:ditonton/presentation/provider/tv_show/search_tv_controller.dart';
// import 'package:ditonton/presentation/provider/tv_show/tv_now_playing_controller.dart';
// import 'package:ditonton/presentation/provider/tv_show/tv_popular_controller.dart';
// import 'package:ditonton/presentation/provider/tv_show/tv_show_controller.dart';
// import 'package:ditonton/presentation/provider/tv_show/tv_top_rated_controller.dart';
// import 'package:ditonton/presentation/provider/tv_show/watchlist_tv_controller.dart';
// import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ditonton/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieListNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieDetailNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<MovieSearchNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TopRatedMoviesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<PopularMoviesNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<WatchlistMovieNotifier>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvShowController>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvPopularController>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvTopRatedController>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<SearchTvController>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<DetailTvController>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<TvNowPlayingController>(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => di.locator<WatchlistTvController>(),
        // ),

        // BLOC State management
        BlocProvider(
          create: (_) => di.locator<SearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<LoadDetailTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<AddWatchlistTvBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          drawerTheme: kDrawerTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          LogUtility.writeLog("ROUTE NOW: ${settings.name}");
          switch (settings.name) {
            case HomeMoviePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMainPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMainPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            case TvShowPage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (context) => TvShowPage(),
              );
            case TvPopularPage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (context) => TvPopularPage(),
              );
            case TvTopRatedPage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (context) => TvTopRatedPage(),
              );
            case SearchTvPages.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (context) => SearchTvPages(),
              );
            case TvNowPlayingPages.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (context) => TvNowPlayingPages(),
              );
            case DetailTvPages.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (context) => DetailTvPages(id: id),
              );
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}

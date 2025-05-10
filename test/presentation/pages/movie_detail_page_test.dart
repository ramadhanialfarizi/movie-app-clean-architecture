import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movie/detail_movie/load_detail_bloc/detail_movie_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/detail_movie/watchlist_bloc/watchlist_bloc.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/provider/movie_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_page_test.mocks.dart';

@GenerateMocks([DetailMovieBloc, WatchlistBloc])
void main() {
  late MockDetailMovieBloc mockDetailMovieBloc;
  late MockWatchlistBloc mockWatchlistBloc;

  setUp(() {
    mockDetailMovieBloc = MockDetailMovieBloc();
    mockWatchlistBloc = MockWatchlistBloc();

    when(mockDetailMovieBloc.state).thenReturn(DetailMovieEmpty());
    when(mockDetailMovieBloc.stream)
        .thenAnswer((_) => Stream.value(DetailMovieEmpty()));

    when(mockWatchlistBloc.stream)
        .thenAnswer((_) => Stream.value(WatchlistInitial()));
    when(mockWatchlistBloc.state).thenReturn(WatchlistInitial());
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<DetailMovieBloc>.value(
      value: mockDetailMovieBloc,
      child: BlocProvider<WatchlistBloc>.value(
        value: mockWatchlistBloc,
        child: MaterialApp(
          home: body,
        ),
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(mockDetailMovieBloc.state)
        .thenReturn(DetailMovieHasData(testMovieDetail, []));
    when(mockWatchlistBloc.state).thenReturn(WatchlistLoaded(false));
    when(mockWatchlistBloc.state)
        .thenReturn(WatchlistUpdated(false, 'Removed from Watchlist'));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    // when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
    // when(mockNotifier.movie).thenReturn(testMovieDetail);
    // when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    // when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
    // when(mockNotifier.isAddedToWatchlist).thenReturn(true);

    when(mockDetailMovieBloc.state)
        .thenReturn(DetailMovieHasData(testMovieDetail, []));
    when(mockWatchlistBloc.state).thenReturn(WatchlistLoaded(false));
    when(mockWatchlistBloc.state)
        .thenReturn(WatchlistUpdated(true, 'Added to Watchlist'));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    // when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
    // when(mockNotifier.movie).thenReturn(testMovieDetail);
    // when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
    // when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
    // when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    // when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist');

    when(mockDetailMovieBloc.state)
        .thenReturn(DetailMovieHasData(testMovieDetail, []));
    when(mockWatchlistBloc.state).thenReturn(WatchlistLoaded(false));
    when(mockWatchlistBloc.state)
        .thenReturn(WatchlistUpdated(false, 'Added to Watchlist'));

    final watchlistButton = find.byType(FilledButton);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  // testWidgets(
  //     'Watchlist button should display AlertDialog when add to watchlist failed',
  //     (WidgetTester tester) async {
  //   // when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
  //   // when(mockNotifier.movie).thenReturn(testMovieDetail);
  //   // when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
  //   // when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
  //   // when(mockNotifier.isAddedToWatchlist).thenReturn(false);
  //   // when(mockNotifier.watchlistMessage).thenReturn('Failed');

  //   when(mockDetailMovieBloc.state)
  //       .thenReturn(DetailMovieHasData(testMovieDetail, []));
  //   when(mockWatchlistBloc.state).thenReturn(WatchlistLoaded(false));
  //   when(mockWatchlistBloc.state).thenReturn(WatchlistUpdated(false, 'Failed'));

  //   final watchlistButton = find.byType(FilledButton);

  //   await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

  //   expect(find.byIcon(Icons.add), findsOneWidget);

  //   await tester.tap(watchlistButton);
  //   await tester.pump();

  //   expect(find.byType(AlertDialog), findsOneWidget);
  //   expect(find.text('Failed'), findsOneWidget);
  // });
}

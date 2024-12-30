import 'package:ditonton/presentation/pages/tv_show/watchlist_tv_pages.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WatchlistMainPage extends StatelessWidget {
  static const ROUTE_NAME = '/watchlist';

  const WatchlistMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Movies"),
              Tab(text: "TV Show"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WatchlistMoviesPage(),
            WatchlistTvPages(),
          ],
        ),
      ),
    );
  }
}

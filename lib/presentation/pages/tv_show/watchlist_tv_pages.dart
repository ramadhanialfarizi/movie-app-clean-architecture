import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/tv_show/detail_tv_show_pages.dart';
import 'package:ditonton/presentation/provider/tv_show/watchlist_tv_controller.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistTvPages extends StatefulWidget {
  const WatchlistTvPages({super.key});

  @override
  State<WatchlistTvPages> createState() => _WatchlistTvPagesState();
}

class _WatchlistTvPagesState extends State<WatchlistTvPages> {
  @override
  void initState() {
    Future.microtask(() =>
        Provider.of<WatchlistTvController>(context, listen: false)
            .fetchWatchlistTV());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<WatchlistTvController>(
        builder: (context, data, child) {
          if (data.watchlistState == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.watchlistState == RequestState.Loaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final dataTv = data.watchlistTV[index];
                return TvListCard(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      DetailTvPages.ROUTE_NAME,
                      arguments: dataTv.id,
                    );
                  },
                  title: dataTv.name ?? "",
                  overview: dataTv.overview ?? "",
                  imageLink: dataTv.posterPath ?? "",
                );
              },
              itemCount: data.watchlistTV.length,
            );
          } else {
            return Center(
              key: Key('error_message'),
              child: Text(data.message),
            );
          }
        },
      ),
    );
  }
}

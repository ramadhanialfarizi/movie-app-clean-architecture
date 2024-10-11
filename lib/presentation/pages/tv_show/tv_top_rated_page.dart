import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_show/tv_top_rated_controller.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvTopRatedPage extends StatefulWidget {
  const TvTopRatedPage({Key? key}) : super(key: key);

  static const ROUTE_NAME = '/tv-top-rated';

  @override
  State<TvTopRatedPage> createState() => _TvTopRatedPageState();
}

class _TvTopRatedPageState extends State<TvTopRatedPage> {
  @override
  void initState() {
    Future.microtask(
      () => Provider.of<TvTopRatedController>(context, listen: false)
        ..loadTvShowTopRated(),
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
        child: Consumer<TvTopRatedController>(
          builder: (context, controller, child) {
            if (controller.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final data = (controller.tvTopRated?.results ?? [])[index];
                  return TvDetailListCard(
                    onPressed: () {},
                    title: data.name ?? "",
                    overview: data.overview ?? "",
                    imageLink: data.posterPath ?? "",
                  );
                },
                itemCount: controller.tvTopRated?.results?.length,
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

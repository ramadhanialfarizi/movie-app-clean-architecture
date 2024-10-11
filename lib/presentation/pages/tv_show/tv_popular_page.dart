import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_show/tv_popular_controller.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvPopularPage extends StatefulWidget {
  const TvPopularPage({Key? key}) : super(key: key);

  static const ROUTE_NAME = '/tv-popular';

  @override
  State<TvPopularPage> createState() => _TvPopularPageState();
}

class _TvPopularPageState extends State<TvPopularPage> {
  @override
  void initState() {
    Future.microtask(
      () => Provider.of<TvPopularController>(context, listen: false)
        ..loadTvPopularData(),
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
        child: Consumer<TvPopularController>(
          builder: (context, controller, child) {
            if (controller.popularState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.popularState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final data =
                      (controller.tvPopularListResponse?.results ?? [])[index];
                  return TvDetailListCard(
                    onPressed: () {},
                    title: data.name ?? "",
                    overview: data.overview ?? "",
                    imageLink: data.posterPath ?? "",
                  );
                },
                itemCount: controller.tvPopularListResponse?.results?.length,
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

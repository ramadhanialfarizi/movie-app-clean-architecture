import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_show/search_tv_controller.dart';
import 'package:ditonton/presentation/widgets/tv_show_widget/tv_detail_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTvPages extends StatefulWidget {
  const SearchTvPages({Key? key}) : super(key: key);

  static const ROUTE_NAME = '/search-tv';

  @override
  State<SearchTvPages> createState() => _SearchTvPagesState();
}

class _SearchTvPagesState extends State<SearchTvPages> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<SearchTvController>(context, listen: false)
            .resetStateData();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                Provider.of<SearchTvController>(context, listen: false)
                    .searchData(query);
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              // controller:
              //     Provider.of<SearchTvController>(context, listen: false)
              //         .textController,
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            Consumer<SearchTvController>(
              builder: (context, controller, child) {
                if (controller.state == RequestState.Loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.state == RequestState.Loaded) {
                  final result = controller.resultData?.results;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final data = (result ?? [])[index];
                        return TvListCard(
                          onPressed: () {},
                          title: data.name ?? "",
                          overview: data.overview ?? "",
                          imageLink: data.posterPath ?? "",
                        );
                      },
                      itemCount: result?.length,
                    ),
                  );
                } else if (controller.state == RequestState.Error) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Constant.getFullHeight(context) * 0.25),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.error,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Data not found",
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

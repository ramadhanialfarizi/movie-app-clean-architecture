import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/data/models/tv_response/detail/genre_response.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/presentation/provider/tv_show/detail_tv_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class DetailTvPages extends StatefulWidget {
  static const ROUTE_NAME = '/tv-detail';
  const DetailTvPages({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<DetailTvPages> createState() => _DetailTvPagesState();
}

class _DetailTvPagesState extends State<DetailTvPages> {
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() {
      Provider.of<DetailTvController>(context, listen: false)
          .getDetailData(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailTvController>(
        builder: (context, controller, child) {
          if (controller.detailState == RequestState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.detailState == RequestState.Loaded) {
            final data = controller.tvDetailResponse;
            return DetailContent(
              tvDetailResponse: data ?? TvDetailResponse(),
            );
          } else {
            return Text(controller.message);
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({Key? key, required this.tvDetailResponse})
      : super(key: key);

  final TvDetailResponse tvDetailResponse;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$BASE_IMAGE_URL${tvDetailResponse.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: Constant.getFullHeight(context) * 0.07, left: 20),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvDetailResponse.name ?? "",
                              style: kHeading5,
                            ),
                            FilledButton(
                              onPressed: () async {
                                // if (!isAddedWatchlist) {
                                //   await Provider.of<MovieDetailNotifier>(
                                //           context,
                                //           listen: false)
                                //       .addWatchlist(movie);
                                // } else {
                                //   await Provider.of<MovieDetailNotifier>(
                                //           context,
                                //           listen: false)
                                //       .removeFromWatchlist(movie);
                                // }

                                // final message =
                                //     Provider.of<MovieDetailNotifier>(context,
                                //             listen: false)
                                //         .watchlistMessage;

                                // if (message ==
                                //         MovieDetailNotifier
                                //             .watchlistAddSuccessMessage ||
                                //     message ==
                                //         MovieDetailNotifier
                                //             .watchlistRemoveSuccessMessage) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       SnackBar(content: Text(message)));
                                // } else {
                                //   showDialog(
                                //       context: context,
                                //       builder: (context) {
                                //         return AlertDialog(
                                //           content: Text(message),
                                //         );
                                //       });
                                // }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // isAddedWatchlist
                                  //     ? Icon(Icons.check)
                                  //     :
                                  Icon(Icons.add),
                                  Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(tvDetailResponse.genres ?? []),
                            ),
                            // Text(
                            //   _showDuration(tvDetailResponse.runtime),
                            // ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tvDetailResponse.voteAverage ?? 0 / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tvDetailResponse.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tvDetailResponse.overview ?? "",
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            // Consumer<MovieDetailNotifier>(
                            //   builder: (context, data, child) {
                            //     if (data.recommendationState ==
                            //         RequestState.Loading) {
                            //       return Center(
                            //         child: CircularProgressIndicator(),
                            //       );
                            //     } else if (data.recommendationState ==
                            //         RequestState.Error) {
                            //       return Text(data.message);
                            //     } else if (data.recommendationState ==
                            //         RequestState.Loaded) {
                            //       return Container(
                            //         height: 150,
                            //         child: ListView.builder(
                            //           scrollDirection: Axis.horizontal,
                            //           itemBuilder: (context, index) {
                            //             final movie = recommendations[index];
                            //             return Padding(
                            //               padding: const EdgeInsets.all(4.0),
                            //               child: InkWell(
                            //                 onTap: () {
                            //                   Navigator.pushReplacementNamed(
                            //                     context,
                            //                     MovieDetailPage.ROUTE_NAME,
                            //                     arguments: movie.id,
                            //                   );
                            //                 },
                            //                 child: ClipRRect(
                            //                   borderRadius: BorderRadius.all(
                            //                     Radius.circular(8),
                            //                   ),
                            //                   child: CachedNetworkImage(
                            //                     imageUrl:
                            //                         'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            //                     placeholder: (context, url) =>
                            //                         Center(
                            //                       child:
                            //                           CircularProgressIndicator(),
                            //                     ),
                            //                     errorWidget:
                            //                         (context, url, error) =>
                            //                             Icon(Icons.error),
                            //                   ),
                            //                 ),
                            //               ),
                            //             );
                            //           },
                            //           itemCount: recommendations.length,
                            //         ),
                            //       );
                            //     } else {
                            //       return Container();
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.40,
            maxChildSize: 1.0,
          ),
        ),
      ],
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  String _showGenres(List<GenreResponse> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name ?? "" + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}

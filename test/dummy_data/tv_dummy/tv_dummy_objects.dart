import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';

var tvDummyDetail = TvDetailResponse(
  adult: false,
  backdropPath: "/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg",
  id: 1396,
  name: 'Breaking Bad',
  posterPath: "/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg",
  overview:
      "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
);

final testTvShowJson = {
  'id': 1396,
  'title': 'Breaking Bad',
  'overview':
      "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
  'posterPath': "/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg",
};

final testMovieTvTable = MovieTable(
  id: 1396,
  title: 'Breaking Bad',
  posterPath: "/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg",
  overview:
      "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
);

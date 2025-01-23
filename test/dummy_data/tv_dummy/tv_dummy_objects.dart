import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_response/detail/created_by_response.dart';
import 'package:ditonton/data/models/tv_response/detail/genre_response.dart';
import 'package:ditonton/data/models/tv_response/detail/network_response.dart';
import 'package:ditonton/data/models/tv_response/detail/production_company_response.dart';
import 'package:ditonton/data/models/tv_response/detail/production_country_response.dart';
import 'package:ditonton/data/models/tv_response/detail/season_response.dart';
import 'package:ditonton/data/models/tv_response/detail/spoken_language_response.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_detail_response.dart';
import 'package:ditonton/data/models/tv_response/detail/tv_episode_to_air_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_data_response.dart';
import 'package:ditonton/data/models/tv_response/on_the_air/tv_on_air_list_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_data_response.dart';
import 'package:ditonton/data/models/tv_response/popular/tv_popular_list_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_data_response.dart';
import 'package:ditonton/data/models/tv_response/recomendation/tv_recomendation_list_response.dart';
import 'package:ditonton/data/models/tv_response/search/search_tv_data_response.dart';
import 'package:ditonton/data/models/tv_response/search/search_tv_list_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_data_response.dart';
import 'package:ditonton/data/models/tv_response/top_rated/tv_top_rated_list_response.dart';
import 'package:ditonton/data/models/tv_response/watchlist/tv_table_data.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_detail_model.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_item_model.dart';
import 'package:ditonton/domain/entities/tv_entities/tv_list_model.dart';

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

// TV Detail Response
var tvDummyDetail = TvDetailResponse(
    adult: false,
    backdropPath: "/9faGSFi5jam6pDWGNd0p8JcJgXQ.jpg",
    id: 1396,
    name: 'Breaking Bad',
    posterPath: "/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg",
    overview:
        "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
    createdBy: [],
    episodeRunTime: [],
    firstAirDate: DateTime.parse("2020-11-02"),
    genres: [],
    homepage: "",
    inProduction: true,
    languages: [],
    lastAirDate: DateTime.parse("2020-11-02"),
    lastEpisodeToAir: TvEpisodeToAirResponse(),
    networks: [],
    nextEpisodeToAir: TvEpisodeToAirResponse(),
    voteCount: 0,
    numberOfEpisodes: 1,
    numberOfSeasons: 2,
    originCountry: [],
    originalLanguage: "",
    originalName: "",
    popularity: 20,
    productionCompanies: [],
    productionCountries: [],
    seasons: [],
    spokenLanguages: [],
    status: "",
    tagline: "",
    type: "",
    voteAverage: 20.0);

TvDetailModel tvDetailModel = TvDetailModel(
  genre: [],
  id: 1396,
  name: 'Breaking Bad',
  overview:
      "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
  posterPath: "/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg",
  voteAverage: 20.0,
);

TvEpisodeToAirResponse tvEpisodeToAirResponse = TvEpisodeToAirResponse(
  airDate: "",
  episodeNumber: 2,
  episodeType: "",
  id: 111,
  name: "",
  overview: "",
  productionCode: "",
  runtime: 2,
  seasonNumber: 2,
  showId: 2,
  stillPath: "",
  voteAverage: 2,
  voteCount: 2,
);

SpokenLanguageResponse spokenLanguageResponse = SpokenLanguageResponse(
  englishName: "",
  iso6391: "",
  name: "",
);

SeasonResponse seasonResponse = SeasonResponse(
  airDate: "",
  episodeCount: 2,
  id: 2,
  name: "",
  overview: "",
  posterPath: "",
  seasonNumber: 2,
  voteAverage: 2,
);

ProductionCountryResponse productionCountryResponse = ProductionCountryResponse(
  iso31661: "",
  name: "",
);

ProductionCompanyResponse productionCompanyResponse = ProductionCompanyResponse(
  id: 1,
  logoPath: "",
  name: "",
  originCountry: "",
);

NetworkResponse networkResponse = NetworkResponse(
  id: 1,
  logoPath: "",
  name: "",
  originCountry: "",
);

GenreResponse genreResponse = GenreResponse(
  id: 1,
  name: "",
);

CreatedByResponse createdByResponse = CreatedByResponse(
  creditId: "",
  gender: 2,
  id: 2,
  name: "",
  originalName: "",
  profilePath: "",
);

// TV on air list response
TvOnAirDataResponse tvOnAirDataResponse = TvOnAirDataResponse(
  adult: false,
  backdropPath: "/vgeDRVpSUa4Hvovg4C6dgm4dfUW.jpg",
  genreIds: [10, 10],
  id: 1111,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "sadasda",
  overview: "sasdasdaada",
  popularity: 208232.22,
  posterPath: "/yuTHx38jpogXovMhqNatvozigMJ.jpg",
  firstAirDate: DateTime.parse("2020-11-02"),
  name: "Ici tout commence",
  voteCount: 62,
);

TvOnAirListResponse tvOnAirListResponse = TvOnAirListResponse(
  page: 1,
  results: [tvOnAirDataResponse],
  totalPages: 66,
  totalResults: 1311,
);

//TV popular list responsse
TvPopularDataResponse tvPopularDataResponse = TvPopularDataResponse(
  adult: false,
  backdropPath: "/vgeDRVpSUa4Hvovg4C6dgm4dfUW.jpg",
  genreIds: [10, 10],
  id: 1111,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "sadasda",
  overview: "sasdasdaada",
  popularity: 208232.22,
  posterPath: "/yuTHx38jpogXovMhqNatvozigMJ.jpg",
  firstAirDate: DateTime.parse("2020-11-02"),
  name: "Ici tout commence",
  voteCount: 62,
);

TvPopularListResponse tvPopularListResponse = TvPopularListResponse(
  page: 1,
  results: [tvPopularDataResponse],
  totalPages: 66,
  totalResults: 1311,
);

// TV Top rated list response
TvTopRatedDataResponse tvTopRatedDataResponse = TvTopRatedDataResponse(
  adult: false,
  backdropPath: "/vgeDRVpSUa4Hvovg4C6dgm4dfUW.jpg",
  genreIds: [10, 10],
  id: 1111,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "sadasda",
  overview: "sasdasdaada",
  popularity: 208232.22,
  posterPath: "/yuTHx38jpogXovMhqNatvozigMJ.jpg",
  firstAirDate: DateTime.parse("2020-11-02"),
  name: "Ici tout commence",
  voteCount: 62,
);

TvTableData tvTableDataDummy = TvTableData(
  id: 1,
  title: "title",
  posterPath: "posterPath",
  overview: "overview",
);

final testTvTableFromJson = {
  'id': 1396,
  'title': 'Breaking Bad',
  'overview':
      "Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.",
  'posterPath': "/ztkUQFLlC19CCMYHW9o1zWhJRNq.jpg",
};

TvTopRatedListResponse tvTopRatedListResponse = TvTopRatedListResponse(
  page: 1,
  results: [tvTopRatedDataResponse],
  totalPages: 66,
  totalResults: 1311,
);

// get recomendation tv show
TvRecomendationDataResponse tvRecomendationDataResponse =
    TvRecomendationDataResponse(
  adult: false,
  backdropPath: "/vgeDRVpSUa4Hvovg4C6dgm4dfUW.jpg",
  genreIds: [10, 10],
  id: 1111,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "sadasda",
  overview: "sasdasdaada",
  popularity: 208232.22,
  posterPath: "/yuTHx38jpogXovMhqNatvozigMJ.jpg",
  firstAirDate: DateTime.parse("2020-11-02"),
  name: "Ici tout commence",
  voteCount: 62,
);

TvRecomendationListResponse tvRecomendationListResponse =
    TvRecomendationListResponse(
  page: 1,
  results: [tvRecomendationDataResponse],
  totalPages: 66,
  totalResults: 1311,
);

// search tv show
SearchTvDataResponse searchTvDataResponse = SearchTvDataResponse(
  adult: false,
  backdropPath: "/vgeDRVpSUa4Hvovg4C6dgm4dfUW.jpg",
  genreIds: [10, 10],
  id: 1111,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "sadasda",
  overview: "sasdasdaada",
  popularity: 208232.22,
  posterPath: "/yuTHx38jpogXovMhqNatvozigMJ.jpg",
  firstAirDate: DateTime.parse("2020-11-02").toString(),
  name: "Ici tout commence",
  voteCount: 62,
);

SearchTvListResponse searchTvListResponse = SearchTvListResponse(
  page: 1,
  results: [searchTvDataResponse],
  totalPages: 66,
  totalResults: 1311,
);

TvListModel tvListModel = TvListModel(
  page: 1,
  results: [tvItemModel],
  totalPages: 66,
  totalResults: 1311,
);

TvItemModel tvItemModel = TvItemModel(
  adult: false,
  backdropPath: "/vgeDRVpSUa4Hvovg4C6dgm4dfUW.jpg",
  genreIds: [10, 10],
  id: 1111,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "sadasda",
  overview: "sasdasdaada",
  popularity: 208232.22,
  posterPath: "/yuTHx38jpogXovMhqNatvozigMJ.jpg",
  firstAirDate: DateTime.parse("2020-11-02").toString(),
  name: "Ici tout commence",
  voteCount: 62,
  // voteAverage: 0.0,
);

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_table_data.g.dart';

@JsonSerializable()
class TvTableData {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  TvTableData({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory TvTableData.fromJson(Map<String, dynamic> json) =>
      _$TvTableDataFromJson(json);

  Map<String, dynamic> toJson() => _$TvTableDataToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        posterPath,
        overview,
      ];
}

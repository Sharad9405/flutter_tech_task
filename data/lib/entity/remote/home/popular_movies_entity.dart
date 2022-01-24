import 'package:domain/model/home/popular_movies.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_entity.g.dart';

@JsonSerializable()
class PopularMoviesEntity
    implements BaseLayerDataTransformer<PopularMoviesEntity, PopularMovies> {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @JsonKey(name: 'overview')
  final String overview;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'first_air_date')
  final String releaseDate;

  PopularMoviesEntity(this.id, this.title, this.posterPath, this.backdropPath,
      this.overview, this.voteAverage, this.voteCount, this.releaseDate);

  factory PopularMoviesEntity.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesEntityToJson(this);

  @override
  PopularMoviesEntity restore(data) {
    throw UnimplementedError();
  }

  @override
  PopularMovies transform() {
    return PopularMovies(
        id: this.id ?? -1,
        title: this.title ?? '',
        posterPath: this.posterPath,
        backdropPath: this.backdropPath,
        overview: this.overview ?? '',
        voteAverage: this.voteAverage,
        voteCount: this.voteCount,
        releaseDate: this.releaseDate);
  }
}

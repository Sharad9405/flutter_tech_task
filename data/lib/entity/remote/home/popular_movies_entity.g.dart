// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesEntity _$PopularMoviesEntityFromJson(Map<String, dynamic> json) {
  return PopularMoviesEntity(
    json['id'] as int,
    json['title'] as String,
    json['poster_path'] as String,
    json['backdrop_path'] as String,
    json['overview'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['vote_count'] as int,
    json['first_air_date'] as String,
  );
}

Map<String, dynamic> _$PopularMoviesEntityToJson(
        PopularMoviesEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'first_air_date': instance.releaseDate,
    };

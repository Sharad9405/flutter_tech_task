// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesResponseEntity _$PopularMoviesResponseEntityFromJson(
    Map<String, dynamic> json) {
  return PopularMoviesResponseEntity()
    ..results = (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : PopularMoviesEntity.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PopularMoviesResponseEntityToJson(
        PopularMoviesResponseEntity instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

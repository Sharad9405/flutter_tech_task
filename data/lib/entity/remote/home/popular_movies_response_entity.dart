import 'package:data/entity/remote/home/popular_movies_entity.dart';
import 'package:domain/model/home/popular_movies.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_movies_response_entity.g.dart';

@JsonSerializable()
class PopularMoviesResponseEntity
    implements
        BaseLayerDataTransformer<PopularMoviesResponseEntity,
            List<PopularMovies>> {
  @JsonKey(name: 'results')
  List<PopularMoviesEntity> results;

  PopularMoviesResponseEntity();

  factory PopularMoviesResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesResponseEntityToJson(this);

  @override
  PopularMoviesResponseEntity restore(data) {
    throw UnimplementedError();
  }

  @override
  List<PopularMovies> transform() {
    return this.results != null
        ? this.results.map((e) => e.transform()).toList()
        : [];
  }
}

class PopularMovies {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;

  PopularMovies(
      {this.id,
      this.title,
      this.posterPath,
      this.backdropPath,
      this.overview,
      this.voteAverage,
      this.voteCount,
      this.releaseDate});
}

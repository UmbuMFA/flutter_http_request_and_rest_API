class Movie {
  late int? id;
  late String title;
  late double voteAverage;
  late String overView;
  late String posterPath;

  Movie(this.id, this.title, this.voteAverage, this.overView, this.posterPath );

  Movie.fromJson(Map<String, dynamic> parsedJson){
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['vote_average'] * 1.0;
    overView = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
  }
}
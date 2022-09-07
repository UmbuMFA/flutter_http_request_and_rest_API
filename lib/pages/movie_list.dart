import 'package:flutter/material.dart';
import 'package:flutter_http_request_and_rest_api/pages/movie_detail.dart';
import 'package:flutter_http_request_and_rest_api/service/http_service.dart';

class MovieList extends StatefulWidget {
 const MovieList({Key? key}) : super(key: key);

  @override
  MovieListState createState() =>  MovieListState();
}

class MovieListState extends State <MovieList> {

  int? moviesCount;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState(){
    service = HttpService();
    initialize();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies")
        ),
        
        body: ListView.builder(
          itemCount: (moviesCount == null) ? 0 : moviesCount,
          itemBuilder: (context,int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                title: Text(movies[position].title),
                subtitle: Text(
                  'Rating = ' + movies[position].voteAverage.toString(),
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(builder: (_)  => MovieDetail(movies[position])
                  );
                  Navigator.push(context, route);
                },
              ),
            );
          } 
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_http_request_and_rest_api/pages/movie_detail.dart';
import 'package:flutter_http_request_and_rest_api/service/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  int? moviesCount;
  late List movies;
  late List movies2;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies2 = [];
    movies = (await service.getPopularMovies())!;
    movies2 = (await service.getUpcomingMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
      movies2 = movies2;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Movies")),
        body: Column(
          children: [
            
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: const Center(heightFactor: 2,
                child: Text(" Up Comming Movies",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white
                ),)
                ),
            ),
            
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (moviesCount == null) ? 0 : moviesCount,
                  itemBuilder: (context, int position) {
                    return Container(
                      width: 200,
                      child: Image.network('https://image.tmdb.org/t/p/w500/' +
                          movies2[position].posterPath),
                    );
                  }),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: const Center(
                heightFactor: 2,
                child: Text("Popular Movies",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white
                ), ))),
            Expanded(
              child: ListView.builder(
                  itemCount: (moviesCount == null) ? 0 : moviesCount,
                  itemBuilder: (context, int position) {
                    return Card(
                      color: Colors.orange,
                      elevation: 2.0,
                      child: ListTile(
                        leading: Image.network(
                            'https://image.tmdb.org/t/p/w500/' +
                                movies[position].posterPath),
                        title: Text(movies[position].title, style: TextStyle(
                          fontSize: 20,
                        ),),
                        subtitle: Text(
                          'Rating = ' + movies[position].voteAverage.toString(),
                        ),
                        onTap: () {
                          MaterialPageRoute route = MaterialPageRoute(
                              builder: (_) => MovieDetail(movies[position]));
                          Navigator.push(context, route);
                        },
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

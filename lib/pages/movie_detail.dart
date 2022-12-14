import 'package:flutter/material.dart';
import 'package:flutter_http_request_and_rest_api/models/movie.dart';


class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmbd.org/t/p/w500/';



   MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path  = imgPath + movie.posterPath;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text( 
          movie.title
        )
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                child: Text(movie.overView),
                padding: EdgeInsets.only(left: 16, right:16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
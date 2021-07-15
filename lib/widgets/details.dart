import 'package:flutter/material.dart';
import 'package:movie_app_1/models/movie_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsPage extends StatefulWidget {
  // const DetailsPage({Key? key}) : super(key: key);
  final String imdbId;
  DetailsPage({required this.imdbId});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  MovieDetail ? movie ;

  @override
  void initState(){
    super.initState();

    fetchMovieById(widget.imdbId).then((value) => {
      setState(() {
        movie = value;
      })
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Detail'),),
      body: (movie != null) ? Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(movie!.posterUrl),
              Text(movie!.title, style: TextStyle(fontSize: 40),),
              Text(movie!.year),
              Text(movie!.director),
              Text(movie!.plot),
              Text(movie!.actors),
              Text(movie!.awards),
            ],
          ),
        ),
      ) : CircularProgressIndicator()
    );
  }
  Future<MovieDetail> fetchMovieById(movieId) async {
    final response =
    await http.get(Uri.parse('https://www.omdbapi.com/?i=$movieId&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movie list');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app_1/widgets/details.dart';
import 'package:movie_app_1/models/movie_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieHomePage extends StatefulWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  List<MovieList> movies = [];
  var searchEditingController = TextEditingController();
  var imageHeader = 'assets/images/movies.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.teal,
              )),
              Expanded(child: Image.asset(imageHeader, width: 300,))
            ],
          ),

          //  ---------  1st Search Bar     -------------------
          // Row(
          //   children: [
          //     Expanded(
          //         child: SizedBox(
          //       width: 270,
          //       child: TextField(
          //         controller: searchEditingController,
          //         decoration:
          //             InputDecoration(hintText: 'Search for movies/series'),
          //       ),
          //     )),
          //     TextButton(
          //         onPressed: () {
          //           fetchMovieList(searchEditingController.text)
          //               .then((value) => {
          //                     setState(() {
          //                       movies = value;
          //                     }),
          //                   });
          //         },
          //         child: Text('Search')),
          //   ],
          // ),

          // ------------------   2nd Search Bar
          Row(
            children: [
              SizedBox(
                width: 250,
                child: TextField(
                  controller: searchEditingController,
                  decoration: InputDecoration(hintText: 'Search no.3'),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    fetchMovieList(searchEditingController.text).then((value) => {
                          setState(() {
                            movies = value;
                          }),
                        });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.indigo),
                  icon: Icon(Icons.search),
                  label: Text('Search')),
            ],
          ),


          // ----------  Search  Result    -------------
          Expanded(
            child: ListView.builder(
                // itemCount: 5,
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int position) {
                  return ListTile(
                    leading: Image.network(movies[position].posterUrl),
                    // title: Text(' This item is $position'),
                    title: Text(movies[position].title),
                    // subtitle: Text(' This is subtitle $position'),
                    subtitle: Text(movies[position].year),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                  imdbId: movies[position].imdbId)));
                    },
                  );
                }),
          )
        ],
      ),
    );
  }

  Future<List<MovieList>> fetchMovieList(searchTerm) async {
    final response = await http.get(
        Uri.parse('https://www.omdbapi.com/?s=$searchTerm&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return MovieList.moviesFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movie list');
    }
  }
}

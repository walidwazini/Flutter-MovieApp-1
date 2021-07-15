// 1) Create the class

class MovieDetail {

  // 2) Create the property of the class
  final String imdbId;
  final String title;
  final String year;
  final String posterUrl;
  final String type;
  final String plot;
  final String director;
  final String actors;
  final String awards;
  final String genre;


  //3. Constructor

  MovieDetail({
    required this.imdbId,
    required this.posterUrl,
    required this.director,
    required this.genre,
    required this.plot,
    required this.title,
    required this.type,
    required this.year,
    required this.actors,
    required this.awards,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json){
    return MovieDetail(
        imdbId: json['imdbID'],
        title: json['Title'],
        year: json['Year'],
        posterUrl: json['Poster'],
        type: json['Type'],
        director : json['Director'],
        genre : json['Genre'],
        plot : json['Plot'],
        actors: json['Actors'],
        awards : json['Awards']
    );

  }

}
// 1. Create Class
class MovieList {

  // 2) Create property of the class
  final String imdbId;
  final String title;
  final String year;
  final String posterUrl;
  final String type;

  // 3. Create constructor
  MovieList({
    required this.imdbId,
    required this.title,
    required this.year,
    required this.posterUrl,
    required this.type,
  });

  // 4. Create transformer from json - object
  factory MovieList.fromJson(Map<String, dynamic> json){
    return MovieList(imdbId: json['imdbID'],
        title: json['Title'],
        year: json['Year'],
        posterUrl: json['Poster'],
        type: json['Type']);
  }

  // 5. If in my UI i have a ListView, you will need this code/..
  static List<MovieList> moviesFromJson(dynamic json){
    var searchResult = json['Search'];
    List<MovieList> results = new List.empty(growable: true);
    if (searchResult != null) {
      searchResult.forEach((v) => {
        results.add(MovieList.fromJson(v))
      });
      return results;
    }
    return results;
  }
}
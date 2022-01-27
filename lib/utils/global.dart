import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:tmdb_api/tmdb_api.dart';

List<Movies> data = [];
List<Cast> castData = [];
List<String> imgUrls = [];
final tmdb = TMDB(
  //TMDB instance
  ApiKeys('918bbc1462ad59f3bb90d7465984c84c',
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MThiYmMxNDYyYWQ1OWYzYmI5MGQ3NDY1OTg0Yzg0YyIsInN1YiI6IjYxZTcwOGQ5OTBlYTRiMDA5Y2FlODYxOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.bo3GRrHm1lc2XxVkiNv6rdbJ2bxOjmlPWpRr5bzHwBw'), //ApiKeys instance with your keys,
);
TextStyle tabTextStyle = GoogleFonts.lato(
    textStyle: const TextStyle(
  // color: _c.index == 0 Color(0xff12153D),
  fontSize: 32,
  fontWeight: FontWeight.w600,
));

class Global {
  fetchData() async {
    var discoverGeneral = await tmdb.v3.discover.getMovies();
    print(discoverGeneral["results"]);
    //  .getTrending(mediaType = MediaType.all, timeWindow = TimeWindow.day);
    // print(discoverGeneral);
    // var dg1 = jsonDecode(Map.from(discoverGeneral));
    // Map dG2 = Map.from(discoverGeneral["results"]);
    // print(dG2);
    // var dG1 = jsonDecode(discoverGeneral.toString());
    // print(dG1);
    data = (discoverGeneral['results'] as List)
        .map((data1) => Movies.fromJSON(data1))
        .toList();
    //print(data[0].posterPath);
    for (int i = 0; i < data.length; i += 1) {
      imgUrls.add("https://image.tmdb.org/t/p/original${data[i].posterPath}");
    }
  }
}

class Movies {
  String posterPath = "";
  String overview = "";
  int id = 0;
  String originalTitle = "";
  int totalResults = 0;
  int totalPages = 0;
  double voteAverage = 0.0;
  int voteCount = 0;
  String releaseDate = "";
  Movies({
    required this.posterPath,
    required this.overview,
    required this.id,
    required this.originalTitle,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    // required this.totalResults,
    // required this.totalPages,
  });
  factory Movies.fromJSON(Map<String, dynamic> parsedJson) {
    return Movies(
      posterPath: parsedJson["poster_path"].toString(),
      overview: parsedJson["overview"].toString(),
      id: parsedJson["id"],
      originalTitle: parsedJson["original_title"].toString(),
      voteAverage: parsedJson["vote_average"],
      voteCount: parsedJson["vote_count"],
      releaseDate: parsedJson["release_date"],
      // totalResults: parsedJson["total_results"],
      // totalPages: parsedJson["total_pages"],
    );
  }
}

class Cast {
  String profilePath = "";
  String castName = "";
  int castId = 0;
  String character = "";
  // String originalTitle = "";
  // int totalResults = 0;
  // int totalPages = 0;
  // double voteAverage = 0.0;

  Cast({
    required this.profilePath,
    required this.castName,
    required this.castId,
    required this.character,
    // required this.originalTitle,
    // required this.voteAverage,

    // required this.totalResults,
    // required this.totalPages,
  });
  factory Cast.fromJSON(Map<String, dynamic> parsedJson) {
    return Cast(
      profilePath: parsedJson["profile_path"].toString(),
      castName: parsedJson["name"].toString(),
      castId: parsedJson["id"],
      character: parsedJson['character'],
      // originalTitle: parsedJson["original_title"].toString(),
      // voteAverage: parsedJson["vote_average"]
      // totalResults: parsedJson["total_results"],
      // totalPages: parsedJson["total_pages"],
    );
  }
}

Future<List<CardItem>> createCards() async {
  List<CardItem> lImg = [];
  for (int i = 0; i < 10; i = i + 1) {
    //   if (data[i] != null) {
    print(data[i].posterPath);
    CardItem? xyz = ImageCarditem(image: FadeImage1(i: i));

    lImg.add(xyz);
    // Image.network(
    //     "https://image.tmdb.org/t/p/original${data[i].posterPath}")));
    // } else {
    //   lImg?.add(ImageCarditem(image: Image.asset("assets/img1.png")));
    // }
  }
  print(lImg);
  return lImg;
}

class FadeImage1 extends StatelessWidget {
  const FadeImage1({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80),
      child: Card(
        child: FadeInImage(
          placeholder: const AssetImage("assets/img1.png"),
          image: NetworkImage(
              // "https://image.tmdb.org/t/p/original${data[i].posterPath}"),
              imgUrls[i]),
          height: 450,
          width: 300,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

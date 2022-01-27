import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portf1/utils/global.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Details extends StatefulWidget {
  int ind;
  Details({Key? key, required this.ind}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

int score = 0;

class _DetailsState extends State<Details> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Random r = Random();
    score = 70 + r.nextInt(20);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.blue,
            child: Stack(
                //  alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    child: Hero(
                      tag: "movie",
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 270,
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                clipBehavior: Clip.antiAlias,
                                child: FadeImage1(i: widget.ind))),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 320,
                    left: 32,
                    right: 32,
                    bottom: 10,
                    child: Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                  tag: "title",
                                  child: Text(
                                    data[widget.ind].originalTitle,
                                    style: tabTextStyle,
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    data[widget.ind]
                                        .releaseDate
                                        .substring(0, 4),
                                    style: TextStyle(
                                        color: Color(0xff9a9bb2), fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    "PG-13",
                                    style: TextStyle(
                                        color: Color(0xff9a9bb2), fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    "2h 20m",
                                    style: TextStyle(
                                        color: Color(0xff9a9bb2), fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text("Plot Summary",
                              style: Theme.of(context).textTheme.headline6),
                          Text(
                            data[widget.ind].overview,
                            style: TextStyle(color: Color(0xff737599)),
                          ),
                          Text("Cast & Crew",
                              style: Theme.of(context).textTheme.headline6),
                          FutureBuilder<List<Cast>>(
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Container(
                                      height: 80,
                                      child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          return FittedBox(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 10,
                                              ),
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    foregroundImage: NetworkImage(
                                                        "https://image.tmdb.org/t/p/original${snapshot.data![index].profilePath}"),
                                                    radius: 60,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:Text(
                                                        snapshot.data![index]
                                                            .castName,
                                                        style: TextStyle(
                                                            fontSize: 44),
                                                      ),
                                                  ),
                                                
                                                  Text(
                                                    snapshot
                                                        .data![index].character,
                                                    style: TextStyle(
                                                        fontSize: 36,
                                                        color:
                                                            Color(0xff9a9bb2)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    )
                                  : const CircularProgressIndicator();
                            },
                            future: fetchCast(data[widget.ind].id),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // height: 80,
                    // top:298,
                    top: 228,
                    left: 32,
                    // bottom:611,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          topLeft: Radius.circular(100)),
                      child: Container(
                        // decoration: BoxDecoration(boxShadow:[BoxShadow(blurRadius: 7,spreadRadius: 5,color: Color(0x3312153d),offset: Offset(0,6))],),
                        width: MediaQuery.of(context).size.width - 20,
                        // height: 80,
                        // decoration: BoxDecoration(

                        //   //  color: Colors.amberAccent,
                        //     borderRadius: BorderRadius.only(
                        //         bottomLeft: Radius.circular(50),topLeft: Radius.circular(50))),

                        child: Card(
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Hero(
                                      tag: "star",
                                      child: Icon(
                                        Icons.star_rounded,
                                        color: Color(0xfffcc419),
                                      )),
                                  Row(
                                    children: [
                                      Text("${data[widget.ind].voteAverage}"),
                                      Text(
                                        "/10",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "${data[widget.ind].voteCount}",
                                    style: TextStyle(
                                      color: Color(0xff9a9bb2),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.star_outline_rounded,
                                      size: 40,
                                    ),
                                  ),
                                  Text("Rate This"),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "$score",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text("Metascore"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 350,
                      left: 280,
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                height: 70,
                                width: 70,
                                color: Color(0xfffe6d8e),
                                child: Icon(Icons.add,color: Colors.white,),)),
                      )),
                ]),
          ),
        ),
      ),
    );
  }

  Future<List<Cast>> fetchCast(int id) async {
    // var cast = await tmdb.v3.credit.getDetails(id);
    var cast = await tmdb.v3.movies.getCredits(id);
    // print(cast["cast"][0]["name"]);
    // print(cast[0]["name"]);
    // print(id);
    castData =
        (cast['cast'] as List).map((data2) => Cast.fromJSON(data2)).toList();
    return castData;
  }
}

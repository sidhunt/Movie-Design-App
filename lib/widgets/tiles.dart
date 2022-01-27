import 'package:flutter/material.dart';

class Tiles extends StatefulWidget {
  Tiles({Key? key}) : super(key: key);

  @override
  State<Tiles> createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  List<String> categ = ["Action", "Crime", "Comedy", "Drama", "Thriller"];
  // List<Chip> chips = [
    // Chip(
    //     label: Text(
    //       "Action",
    //     ),
    //     backgroundColor: Colors.transparent,
    //     side: BorderSide(color: Color(0xff12153D).withOpacity(0.15))),
  //   Chip(
  //       label: Text("Crime"),
  //       backgroundColor: Colors.transparent,
  //       side: BorderSide(color: Color(0xff12153D).withOpacity(0.15))),
  //   Chip(
  //       label: Text("Comedy"),
  //       backgroundColor: Colors.transparent,
  //       side: BorderSide(color: Color(0xff12153D).withOpacity(0.15))),
  //   Chip(
  //       label: Text("Drama"),
  //       backgroundColor: Colors.transparent,
  //       side: BorderSide(color: Color(0xff12153D).withOpacity(0.15)))
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        // padding: EdgeInsets.symmetric(horizontal: 42),
        //padding: EdgeInsets.symmetric(horizontal: 22),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 12,),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [  Chip(
        label: Text(
          categ[index],
        ),
        backgroundColor: Colors.transparent,
        side: BorderSide(color: Color(0xff12153D).withOpacity(0.15))),],
           // padding: EdgeInsets.symmetric(horizontal: 0),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 0,
          );
        },
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}

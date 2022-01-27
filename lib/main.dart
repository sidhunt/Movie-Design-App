import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portf1/widgets/cards.dart';
import 'package:portf1/widgets/tab1.dart';
import './widgets/swiper.dart';

import 'utils/global.dart';
import 'widgets/tiles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
      Theme.of(context).textTheme,),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          primaryIconTheme: IconThemeData(color: Colors.black)),
          
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
       // backgroundColor: Color(0xffe5e5e5),
        appBar: AppBar(

          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(width: 20,)
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: Tab1(),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        drawer: Drawer( child: Icon(Icons.menu, color: Colors.black,),),
        body: CustomScrollView(
          
          slivers: [SliverFillRemaining(
            hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Cards(),
              Tiles(),
              Swiper1()
            ],
          ),
        ),]),
      ),
    );
  }

  callData() async {
    Global g = Global();
    await g.fetchData();
  }
}

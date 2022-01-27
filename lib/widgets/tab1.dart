import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/global.dart';

class Tab1 extends StatefulWidget implements PreferredSizeWidget {
  Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(30);
}

class _Tab1State extends State<Tab1> with SingleTickerProviderStateMixin {
  TabController? _c;
  
  TextStyle tabTextStyleUnselected = GoogleFonts.lato(
      textStyle: const TextStyle(
    // color: Color.fromARGB(10, 18, 21, 61),
    fontSize: 32,
  ));

  @override
  void initState() {
    super.initState();
    _c = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          text: "In Theaters",

          // style: tabTextStyle,
        ),
        Tab(
          text: "Box Office",
          //   style: tabTextStyle,
        ),
      ],
      controller: _c,
      isScrollable: true,
      labelColor: const Color(0xff12153D),
      unselectedLabelColor: const Color(0x4d12153D),
      labelStyle: tabTextStyle,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Color(0xfffe6d8e),
    );
    //indicator: UnderlineTabIndicator(borderSide: BorderSide()), );
    // unselectedLabelStyle: tabTextStyleUnselected);
  }
}

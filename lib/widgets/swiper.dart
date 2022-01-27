import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:portf1/screens/details.dart';
import '../utils/global.dart';

class Swiper1 extends StatefulWidget {
  Swiper1({Key? key}) : super(key: key);

  @override
  State<Swiper1> createState() => _Swiper1State();
}

class _Swiper1State extends State<Swiper1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 700,
        width: double.infinity,
        child: Swiper(
          onTap: (_index) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Details(ind: _index)));
          },
          itemCount: imgUrls.length,
          itemBuilder: (context, index) {
            //  return Image.network(imgUrls[index]);
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(tag: "movie", child: FadeImage1(i: index)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 20.0),
                  child: Hero(
                    tag: "title",
                    child: Text(
                      "${data[index].originalTitle}",
                      style: tabTextStyle,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "star",
                      child: Icon(
                        Icons.star_rounded,
                        color: Color(0xfffcc419),
                      ),
                    ),
                    Text("${data[index].voteAverage}")
                  ],
                ),
              ],
            );
          },
          pagination: const SwiperPagination(builder: SwiperPagination.rect),
          autoplay: true,
          autoplayDisableOnInteraction: true,
          curve: Curves.decelerate,
          duration: 1000,
          //control: const SwiperControl(),
        ),
      ),
    );
  }
}

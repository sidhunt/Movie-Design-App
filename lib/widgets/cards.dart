import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/card_item.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import '../utils/global.dart';

class Cards extends StatefulWidget {
  Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardItem>>(
        future: createCards(),
        builder: (context, snapshot) {
          return snapshot.hasData?
               Card(
                 child: HorizontalCardPager(
                      items: snapshot.data ,  
                           ),
               )
              
             :Center(child:const CircularProgressIndicator());
        });
  }

  // Future<List<ImageCarditem>> createCards1() async {
  //     var abc = await createCards();
  //   return abc;  
  // }
}

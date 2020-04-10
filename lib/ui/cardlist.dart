import 'package:flashcards_kr/model/topic.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardList extends StatelessWidget {
  //final Topic topic;
  CardList({Key key, this.category}) : super(key: key);

  final String category;
  
  List<String> korWord = [
    "아침",
    "칫솔",
    "치약",
    "비누",
    "거울",
    '신발'
  ];

  List<String> engWord = [
    "morning",
    "brush",
    "toothpaste",
    "soap",
    "mirror",
    'shoes'
  ];

  // show card
  _renderContent(context, int id) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 32.0, bottom: 32.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 400,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Row(
                children: <Widget>[
                  Text(korWord[id], style: Theme.of(context).textTheme.display3),
              
                  // Text('Click here to flip back',
                  //   style: Theme.of(context).textTheme.body1),
                ],
              ),
              
              Row(
                children: <Widget>[
                  Text(korWord[id], style: Theme.of(context).textTheme.display3),
              
                  // Text('Click here to flip back',
                  //   style: Theme.of(context).textTheme.body1),
                ],
              ),
              
              Align(
                alignment: Alignment.bottomRight,
                              child: Row(
                  children: <Widget>[
                    Text(korWord[id], style: Theme.of(context).textTheme.display3),
                
                    // Text('Click here to flip back',
                    //   style: Theme.of(context).textTheme.body1),
                  ],
                ),
              )
              
                
              
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF06666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Container(
            child: 
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(engWord[id], style: Theme.of(context).textTheme.display3)),),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(engWord[id], style: Theme.of(context).textTheme.display3),
          //     Text('Click here to flip front',
          //         style: Theme.of(context).textTheme.body1),
          //   ],
          // ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.toString()),
      ),
      body: Swiper(
        itemCount: 6,
        viewportFraction: 0.8,
        scale: 0.8,
        control: SwiperControl(),
        //autoplay: true,        
        pagination: SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              //_renderBg(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //_renderAppBar(context),
                  Expanded(
                    flex: 22,
                    child: _renderContent(context, index),
                  ),
                  Expanded(
                    flex: 0,
                    child: Container(
                      //color: Colors.orange,
                    ),
                  ),
                ],
              )
            ],
          );
        },),
      // body: Stack(
      //   fit: StackFit.expand,
      //   children: <Widget>[
      //     //_renderBg(),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: <Widget>[
      //         //_renderAppBar(context),
      //         Expanded(
      //           flex: 4,
      //           child: _renderContent(context),
      //         ),
      //         // Expanded(
      //         //   flex: 1,
      //         //   child: Container(
      //         //     color: Colors.orange,
      //         //   ),
      //         // ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
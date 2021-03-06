//import 'dart:html';

//import 'package:flashcards_kr/model/topic.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardList extends StatefulWidget {
  // Declare a field that holds the Topic.
  //final Topic category;
  // In the constructor, require a Topic.
  //CardList({Key key, @required this.category}) : super(key: key);
  final doc;
  CardList(this.doc);

  @override
  State<StatefulWidget> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final FlutterTts flutterTts = FlutterTts();

  Future _speak(String text, lang) async {
    //print(await flutterTts.getLanguages);
    await flutterTts.setLanguage(lang);
    //await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    //print(await flutterTts.getVoices);
    await flutterTts.speak(text);
  }

  final List<String> korTime = [
    "일월",
    "이월",
    "삼월",
    "사월",
    "오월",
    '유월',
    '칠월',
    '팔월',
    '구월',
    '시월',
    '십일월',
    '십이월',
    '월요일',
    '화요일',
    '수요일',
    '목요일',
    '금요일',
    '토요일',
    '일요일',
  ];

  final List<String> engTime = [
    "January",
    "February",
    "March",
    "April",
    "May",
    'June',
    'July',
    'August',
    'Septempber',
    'October',
    'November',
    'December',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  final List<String> korNumber = [
    '하나',
    '둘',
    '셋',
    '넷',
    "다섯",
    '여섯',
    '일곱',
    '여덟',
    '아홉',
    '열',
  ];

  final List<String> engNumber = [
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
  ];

  final List<String> korBody = [
    '머리',
    '눈',
    '코',
    '귀',
    "입술",
    '눈쌉',
    '목',
    '가슴',
    '팔',
    '다리',
    '발',
  ];

  final List<String> engBody = [
    'head',
    'eye',
    'nose',
    'ear',
    'lip',
    'eyebrow',
    'neck',
    'chest',
    'arm',
    'leg',
    'foot',
  ];

  // show card
  _renderContent(context, DocumentSnapshot document) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 32.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 400,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            //color: Colors.white,
            //color: Color(0xFF006666),
            //color: Theme.of(context).primaryColorLight,
            border: Border.all(width: 3, color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Container(
                padding: const EdgeInsets.only(right: 16, left: 16),
                //color: Colors.white,
                child: FittedBox(
                    child: Text(
                        document.get('kor_name'), //widget.category.korWord[id],
                        style: Theme.of(context).textTheme.headline1)),
                //padding: Padding(padding: ,
              ),
              Container(
                //color: Colors.orange,
                child: Text('Click here to flip back',
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                          icon: Icon(Icons.volume_up),
                          iconSize: 40,
                          tooltip: 'Listen!',
                          splashColor: Colors.blue,
                          onPressed: () {
                            print('IconButton is clicked');
                            _speak(document.get('kor_name'), 'ko-KR');
                          }),
                    )),
              ),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            //color: Colors.white,
            //color: Color(0xFF006666),
            //color: Theme.of(context).primaryColorLight,
            border: Border.all(width: 3, color: Colors.black38),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Container(
                  //color: Colors.white,
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Column(
                    children: [
                      FittedBox(
                          //fit: BoxFit.scaleDown,
                          child: Text(
                        document.get('eng_name'), //widget.category.engWord[id],
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      )),
                      Text(
                        document.get(
                            'eng_description'), //widget.category.engWord[id],
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              // Container(
              //   //color: Colors.orange,
              //   child: Text('Click here to flip front',
              //       style: Theme.of(context).textTheme.bodyText1),
              // ),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.lightGreen,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                          icon: Icon(Icons.volume_up),
                          iconSize: 40,
                          tooltip: 'Listen!',
                          splashColor: Colors.blue,
                          onPressed: () {
                            print('IconButton is clicked');
                            _speak(document.get('eng_name'), 'en-US');
                          }),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isSwitched = false; // autoplay on or off

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), //Text(widget.category.korName),
        elevation: 0.0,
        //backgroundColor: Color(0xFFF06666),
        actions: <Widget>[
          Center(
            child: Text(
              'autoplay',
              textScaleFactor: 1.5,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            //activeTrackColor: Colors.lightBlueAccent,
            //activeTrackColor: Colors.transparent,
            activeColor: Theme.of(context).accentColor,
          ),
          // FlatButton(
          //   textColor: Colors.black,
          //   onPressed: () {},
          //   child: Text("Autoplay"),
          //   shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          // ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
              child: Container(
            color: Theme.of(context).primaryColor,
            //color: Colors.white30,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('categories')
                  .doc(widget.doc)
                  .collection('words')
                  .orderBy('order')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return Swiper(
                  itemCount: snapshot
                      .data.documents.length, //widget.category.korWord.length,
                  viewportFraction: 0.85,
                  scale: 0.8,
                  control: SwiperControl(
                    color: Colors.black38,
                  ),
                  autoplay: isSwitched,
                  //autoplayDelay: 5,
                  //pagination: SwiperPagination(),
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
                              child: _renderContent(
                                  context, snapshot.data.documents[index]),
                              //Text(snapshot.data.documents[index].get('kor_name')),
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
                  },
                );
              },
            )),
      ),
    );
  }
}

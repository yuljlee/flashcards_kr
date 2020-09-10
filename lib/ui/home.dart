import 'package:flashcards_kr/model/topic.dart';
import 'package:flashcards_kr/ui/cardlist.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final Topic time = new Topic(
      1,
      '시간',
      'Time',
      [
        '일월',
        '이월',
        '삼월',
        '사월',
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
      ],
      [
        "January",
        "February",
        "March",
        "April",
        "May",
        'June',
        'July',
        'August',
        'September',
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
      ],
      1);

  final Topic number = new Topic(
      2,
      '숫자',
      'Numbers',
      [
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
      ],
      [
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
      ],
      2);

  final Topic body = new Topic(
      3,
      '몸',
      'Human Body',
      [
        "머리",
        "어깨",
        "무릎",
        "발",
        "눈",
        '코',
        '입',
        '귀',
        '가슴',
        '배',
        '팔',
        '다리',
        '발목',
        '손목',
        '발가락',
        '손가락',
        '엉덩이',
        '머리카락',
        '눈썹',
      ],
      [
        "head",
        "shoulder",
        "knee",
        "foot",
        "eyes",
        'nose',
        'mouth',
        'ear',
        'chest',
        'stomoch',
        'arm',
        'leg',
        'ankle',
        'wrist',
        'toes',
        'finger',
        'hip',
        'hair',
        'eyebrow',
      ],
      3);

  final Topic family = new Topic(
      4,
      '가족',
      'Family',
      [
        '엄마',
        '아빠',
        '할아버지',
        '할머니',
        '언니',
        '오빠',
        '남동생',
        '여동생',
        '사촌',
        '조카',
        '이모',
        '이모부',
        '삼촌',
        '여조카',
      ],
      [
        'mom',
        'dad',
        'grandfather',
        'gramdmother',
        'sister',
        'brother',
        'younger brother',
        'younger sister',
        'cousin',
        'nephew',
        'aunt',
        'uncle',
        'uncle',
        'niece',
      ],
      4);

  final Topic animal = new Topic(
      5,
      '동물',
      'Animals',
      [
        '사자',
        '호랑이',
        '고양이',
        '개',
        '오리',
        '닭',
        '말',
        '돼지',
        '독수리',
        '뱀',
        '원숭이',
        '코끼리',
        '기린',
        '고래',
        '돌고래',
        '상어',
        '물개',
        '캥거루',
        '코알라',
      ],
      [
        'lion',
        'tiger',
        'cat',
        'dog',
        'duck',
        'hen',
        'horse',
        'pig',
        'eagle',
        'snake',
        'monkey',
        'elephant',
        'giraffe',
        'whale',
        'dolphin',
        'shark',
        'seal',
        'kanguru',
        'koala',
      ],
      5);

  final Topic plant = new Topic(
      6,
      '과일',
      'Fruit',
      [
        '사과',
        '배',
        '딸기',
        '복숭아',
        '바나나',
        '수박',
        '참외',
      ],
      [
        'apple',
        'pear',
        'strawberry',
        'peach',
        'banana',
        'watermelon',
        'oriental melon',
      ],
      6);

  Widget _renderCard(context, DocumentSnapshot document) {
    final makeCard = Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      //margin: EdgeInsets.all(20),
      child: GestureDetector(
        //splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          //print('You clicked item number $document');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardList(document.id),
            ),
          );
        },
        child: Container(
          //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          decoration: BoxDecoration(color: Colors.white30),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text(document.get('kor_name'),
                  style: Theme.of(context).textTheme.subtitle2),
              //Divider(),
              Container(
                padding: EdgeInsets.all(10.0),
                //alignment: Alignment.bottomRight,
                child: Text(document.get('eng_name'),
                    style: Theme.of(context).textTheme.subtitle1),
              ),
              Spacer(),
              Container(
                alignment: Alignment.bottomCenter,
                height: 10.0,
                color: Theme.of(context).accentColor,
              )
            ],
          ),
        ),
      ),
    );

    return makeCard;
  }

  @override
  Widget build(BuildContext context) {
    int _rowCnt = 0;
    Orientation orientation = MediaQuery.of(context).orientation;
    // display 2 rows on portrait
    (orientation == Orientation.portrait) ? _rowCnt = 2 : _rowCnt = 3;

    return Scaffold(
      appBar: AppBar(
        // leading: Image.asset(
        //     "assets/images/a_dot_ham.jpeg",
        //   ),
        title: Text(
          ' Choose Topics',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        elevation: 0.0,
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.settings),
        //     tooltip: 'Show Snackbar',
        //     onPressed: () {
        //       print('settings button pressed.');
        //       //scaffoldKey.currentState.showSnackBar(snackBar);
        //     },
        //   ),
        // ],
      ),

      //backgroundColor: const Color(0xFFFFDE03),
      backgroundColor: Theme.of(context).primaryColor,

      body: Container(
          padding: EdgeInsets.only(top: 20.0),
          //color: Colors.blue[700],
          child: StreamBuilder (
              stream: FirebaseFirestore.instance
                  .collection('categories')
                  
                  //.where('id', isLessThan: 11)
                  .orderBy('order')                  
                  .snapshots(),
                  //.listen( (data) => print('grower ${data.docs[0]}')),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return GridView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _renderCard(context, snapshot.data.documents[index]),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _rowCnt,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                );
              })),
    );
  }
}

Widget firstRow() {
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.favorite,
          color: Colors.green,
        ),
      ),
      Text(
        'BEAMS',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ],
  );
}

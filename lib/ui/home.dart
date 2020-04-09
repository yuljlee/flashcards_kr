// Main page
import 'package:flashcards_kr/model/topic.dart';
import 'package:flashcards_kr/ui/cardlist.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  List<Widget> _createCategory(context, int numCards) {
    int i= 0;
    List category = ['매일', '여행', '학교', '사람들', '여가생활', '회사', '먹거리', '포도', '수박', '참외'];
    List colors = [Colors.blueGrey, Colors.blueAccent, Colors.red, 
      Colors.amber, Colors.pink, Colors.cyan, Colors.brown, Colors.indigo, Colors.deepOrange, Colors.deepPurple];
    List<Widget> cards = List<Widget>();
    int _id = 0;
    while (i < numCards) {
      Card card = Card(
          color: Colors.amberAccent,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('You clicked item number $_id');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,            
              children: <Widget>[
                Text(i.toString(), style: Theme.of(context).textTheme.subtitle),
                Text(category[i], style: Theme.of(context).textTheme.display1),
                Text(category[i], style: Theme.of(context).textTheme.title),
                ],
              ),
          ),
        );
      i++;
      cards.add(card);
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards')
        ),
        body: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              padding: EdgeInsets.all(10.0),
              children: 
                _createCategory(context, 8)
            )

    );
  }
}
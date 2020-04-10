// Main page
import 'package:flashcards_kr/model/topic.dart';
import 'package:flashcards_kr/ui/cardlist.dart';
import 'package:flutter/material.dart';
//import 'package:flashcards_kr/model/theme.dart';

class Home extends StatefulWidget {
  //Home({Key key, this.title}) : super(key: key);
  Home({Key key, this.topic}) : super(key: key);
  //final String title;
  final List<Topic> topic;

  @override
  _HomeState createState() => _HomeState();
}

List<Topic> setTopic(int numItem) {
    int i = 0;
    List<Topic> topics = List<Topic>();
    //theme.add([1, '매일', 'Everyday', 1]);
    List category = ['매일', '여행', '학교', '사람들', '여가생활', '회사', '먹거리', '탈것', '수박', '참외'];
    List engCategory = ['Everyday', 'Tour', 'School', 'Pelople', 'Free Time', 'Work', 'Food', 'Vehicles', '수박', '참외'];

    while (i < numItem) {
        Topic topic = Topic(i+1, category[i], engCategory[i], i+1);
        i++;
        topics.add(topic);
    }
    return topics;
}

class _HomeState extends State<Home> {
  // final List<Topic> topic;
  // _HomeState({Key key, @required this.topic}) : super(key: key);
  // set category iteem on grid view
  List<Widget> _createCategory(int numCards) {
    int i= 0;
    //List category = ['매일', '여행', '학교', '사람들', '여가생활', '회사', '먹거리', '포도', '수박', '참외'];
    //Theme theme = Theme(0, '매일', 'Everyday', 1);
    
    List<Topic> topics = setTopic(numCards);
    
    List colors = [Colors.blueGrey, Colors.blueAccent, Colors.red, 
      Colors.amber, Colors.pink, Colors.cyan, Colors.brown, Colors.indigo, Colors.deepOrange, Colors.deepPurple];
    List<Widget> cards = List<Widget>();
    
    while (i < numCards) {
      Card card = Card(
        elevation: 5.0,
        color: colors[i],
                
          child: InkWell(
              onTap: () {
                print(i.toString() + " tapped");
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CardList(topic: topics[0]),
                //   ),
                // );
              },
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(topics[i].id.toString(), style: Theme.of(context).textTheme.subtitle),
                Text(topics[i].korName.toString(), style: Theme.of(context).textTheme.display1),
                Text(topics[i].engName.toString(), style: Theme.of(context).textTheme.title),
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
    Orientation orientation = MediaQuery.of(context).orientation;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST')
      ),
      body: (orientation == Orientation.portrait)
          ? GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              padding: EdgeInsets.all(10.0),
              children: 
                _createCategory(8)
            ) 
          : GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              padding: EdgeInsets.all(10.0),
              children: 
                _createCategory(8)
          ),
        );
  }
}
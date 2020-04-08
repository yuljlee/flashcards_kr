// Main page
import 'package:flashcards_kr/ui/cardlist.dart';
import 'package:flutter/material.dart';
import 'package:flashcards_kr/model/theme.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // set category iteem on grid view
  List<Widget> _createCategory(int numCards) {
    int i = 0;
    List category = ['매일', '여행', '학교', '사람들', '여가생활', '회사', '먹거리', '포도', '수박', '참외'];
    //Theme theme = Theme(0, '매일', 'Everyday', 1);
    
    //List<Theme> theme;
    //theme.add([1, '매일', 'Everyday', 1]);
    
    List colors = [Colors.blueGrey, Colors.blueAccent, Colors.red, 
      Colors.amber, Colors.pink, Colors.black, Colors.brown, Colors.indigo, Colors.deepOrange, Colors.deepPurple];
    List<Widget> cards = List<Widget>();
    
    while (i < numCards) {
      Card card = Card(
        elevation: 5.0,
        color: colors[i],
        child: InkWell( 
          onTap: () {
            print(i.toString() + " tapped");
            Navigator.push(context, MaterialPageRoute(builder: (context) => CardList()),);
          },
          child: Center(
          child: Text(
            i.toString() + ' ' + category[i],
            style: TextStyle(color: Colors.white, fontSize: 30),
          )
        ),
      )
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
        title: Text(widget.title)
      ),
      body: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: EdgeInsets.all(5.0),
        children: 
          _createCategory(10)
      ) 
    );
  }
}
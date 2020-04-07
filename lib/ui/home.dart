// Main page
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

 // set category iteem on grid view
List<Widget> _createCategory(int numCards) {
  int i = 0;
  List category = ['사과', '포도', '수박', '사과', '포도', '수박', '사과', '포도', '수박', '참외'];
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
        },
        child: Center(
        child: Text(
          category[i],
          style: TextStyle(color: Colors.white, fontSize: 40),
        )
      ),
    )
    );
    i++;
    cards.add(card);
  }

  return cards;
}

class _HomeState extends State<Home> {
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
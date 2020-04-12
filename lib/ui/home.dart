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

  Widget _renderCard(context, int id) {
    List category = ['매일', '여행', '학교', '사람들', '여가생활', '회사', '먹거리', '탈것'];
    List engCategory = ['Everyday', 'Tour', 'School', 'Pelople', 'Free Time', 'Work', 'Food', 'Vehicles'];

    final makeCard = Card(
      elevation: 3.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: GestureDetector(
              //splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('You clicked item number $id');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardList(category: category[id]),
                  ),
                );
              },
              child: Container(
                //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,            
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(id.toString(), style: Theme.of(context).textTheme.subtitle)),
                        Text(category[id], style: Theme.of(context).textTheme.display1),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(engCategory[id], style: Theme.of(context).textTheme.title)),
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
      appBar: 
        AppBar(
          title: Text('Flashcards'),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Show Snackbar',
              onPressed: () {
                print('settings button pressed.');
                //scaffoldKey.currentState.showSnackBar(snackBar);
              },
            ),
          ],
        ),
      
      backgroundColor: Colors.yellow[500],
      body: 
              

                Container(
                //padding: EdgeInsets.only(top: 0.0),
                color: Colors.blue,
                child: GridView.builder(                  
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(            
                    crossAxisCount: _rowCnt,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _renderCard(context, index);
                  },
                ),
        ),
      

    );
  }
}
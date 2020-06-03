// Main page
import 'package:flashcards_kr/model/topic.dart';
import 'package:flashcards_kr/ui/cardlist.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
  // List<Widget> _createCategory(context, int numCards) {
  //   int i= 0;
  //   List category = ['매일', '여행', '학교', '사람들', '여가생활', '회사', '먹거리', '포도', '수박', '참외'];
  //   List colors = [Colors.blueGrey, Colors.blueAccent, Colors.red, 
  //     Colors.amber, Colors.pink, Colors.cyan, Colors.brown, Colors.indigo, Colors.deepOrange, Colors.deepPurple];
  //   List<Widget> cards = List<Widget>();
  //   int _id = 0;
  //   while (i < numCards) {
  //     Card card = Card(
  //         color: Colors.amberAccent,
  //         child: InkWell(
  //           splashColor: Colors.blue.withAlpha(30),
  //           onTap: () {
  //             print('You clicked item number $_id');
  //           },
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,            
  //             children: <Widget>[
  //               Text(i.toString(), style: Theme.of(context).textTheme.subtitle2),
  //               Text(category[i], style: Theme.of(context).textTheme.headline4),
  //               Text(category[i], style: Theme.of(context).textTheme.headline6),
  //               ],
  //             ),
  //         ),
  //       );
  //     i++;
  //     cards.add(card);
  //   }

  //   return cards;
  // }

  Topic time = new Topic(1, '시간', 'Time', 1);
  Topic number = new Topic(2, '숫자', 'Numbers', 2);
  Topic body = new Topic(3, '몸', 'Human Body', 3);
  Topic family = new Topic(4, '가족', 'Family', 4);
  Topic animal = new Topic(5, '동물', 'Animals', 5);
  Topic pland = new Topic(6, '식물', 'Plants', 6);

  Widget _renderCard(context, int id) {
    List category = ['시간', '숫자', '몸', '가족', '동물', '식물'];
    List engCategory = ['Time', 'Numbers', 'Human Body', 'Family', 'Animals', 'Plants'];

    final makeCard = Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      //margin: EdgeInsets.all(20),
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
                decoration: BoxDecoration(color: Colors.white30),
                child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        // Align(
                        //   alignment: Alignment.bottomLeft,
                        //   child: Text(id.toString(), style: Theme.of(context).textTheme.body1)
                        // ),
                        Text(category[id], style: Theme.of(context).textTheme.headline6),
                        //Divider(),
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          alignment: Alignment.bottomRight,
                          child: Text(engCategory[id], style: Theme.of(context).textTheme.subtitle2),
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
      appBar: 
        AppBar(
          leading: FlutterLogo(),
          title: Text('Choose Topics', style: Theme.of(context).textTheme.bodyText2,),
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
      
      //backgroundColor: const Color(0xFFFFDE03),
      backgroundColor: Theme.of(context).primaryColor,
      
      body:
        Container(
          padding: EdgeInsets.only(top: 20.0),
          //color: Colors.blue[700],
          child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
              crossAxisCount: _rowCnt,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _renderCard(context, index);
            },
          ),
        ),
    );
  }
}

Widget firstRow() {
      return Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.favorite,
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
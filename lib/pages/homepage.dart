import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_630710670/pages/loginpage.dart';

class mainPage extends StatefulWidget {
  final String name1;
  final String name2;

  const mainPage({Key? key, required this.name1, required this.name2})
      : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  bool oturn = true; //o first
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  var myTextStyle = TextStyle(color: Colors.teal, fontSize: 30);
  int Oscore = 0, Xscore = 0, fillBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${widget.name1} O', style: myTextStyle),
                        Text(Oscore.toString(), style: myTextStyle),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${widget.name2} X', style: myTextStyle),
                        Text(Xscore.toString(), style: myTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.teal)),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: TextStyle(color: Colors.teal, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new loginPage());
                  Navigator.of(context).push(route);
                },
              ),
              Text('Exit')
            ],
          )),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oturn && displayXO[index] == '') {
        displayXO[index] = 'o';
        fillBox++; //ต้องใส่ในนี้เพราะว่าถ้าแท็บซ้ำที่เดิมก็นับแท็บทำให้ถ้าใส่ข้างบนจะนับมั่ว
      } else if (!oturn && displayXO[index] == '') {
        displayXO[index] = 'x';
        fillBox++;
      }

      oturn = !oturn;
      _checkWinner();
    });
  }

  //check แถวที่ win
  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinDialog(displayXO[3]);
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinDialog(displayXO[6]);
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinDialog(displayXO[1]);
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
    } else if (fillBox == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'DRAW!!',
              textAlign: TextAlign.center,
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop(); //popกดแล้วalertหาย
                },
                child: Text('Play Again!'),
              )
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    String name = '';
    if (winner == 'o') {
      name = widget.name1 as String;
      Oscore++;
    } else {
      name = widget.name2 as String;
      Xscore++;
    }

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'WINNER IS ' + name + ' !!',
              textAlign: TextAlign.center,
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop(); //popกดแล้วalertหาย
                },
                child: Text('Play Again!'),
              )
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });

    fillBox = 0;
  }
}

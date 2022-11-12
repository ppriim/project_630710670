import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_630710670/Widgets/textCos.dart';
import 'package:project_630710670/Widgets/textFieldCos.dart';
import 'package:project_630710670/pages/homepage.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nameController2 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _nameController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const textCos(
              shadows: [],
              text: 'Tic-Tac-Toe',
              fontSize: 70,
            ),
            SizedBox(height: size.height * 0.08),
            textFieldCos(controller: _nameController, hintText: 'Player 1'),
            SizedBox(height: 25),
            textFieldCos(controller: _nameController2, hintText: 'Player 2'),
            SizedBox(height: 25),
            IconButton(
              icon: Icon(
                Icons.play_circle_outline_sharp,
                size: 30.0,
              ),
              color: Colors.teal,
              onPressed: () {
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) => new mainPage(
                        name1: _nameController.text,
                        name2: _nameController2.text));
                Navigator.of(context).push(route);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7, top: 4),
              child: Text('Play', ),
            )
          ],
        ),
      ),
    );
  }
}

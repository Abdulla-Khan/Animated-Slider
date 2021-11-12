import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                Colors.blue.shade400,
                Colors.blue.shade800,
              ]))),
          SafeArea(
              child: Container(
            width: 200,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/61100/pexels-photo-61100.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Hosna Faisal',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ])),
                Expanded(
                    child: ListView(
                  children: [
                    newMethod(Icons.home, "Home"),
                    newMethod(Icons.person, "Profile"),
                    newMethod(Icons.settings, "Setting"),
                    newMethod(Icons.logout_outlined, "LogOut")
                  ],
                ))
              ],
            ),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInExpo,
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * value),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("3D Drawer Menu"),
                    ),
                    body: const Center(
                      child: Text('Swipe Right'),
                    ),
                  ),
                ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }

  ListTile newMethod(i, txt) {
    return ListTile(
      leading: Icon(
        i,
        color: Colors.white,
      ),
      title: Text(
        txt,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

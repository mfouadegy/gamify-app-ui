import 'package:app/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Stack(children: [
        _featuredGames(),
        _backgroundBox(),

      ],),
    );
  }

  Widget _featuredGames() {
    return SizedBox(
      height: size.height * .50,
      width: size.width,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((game) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(game.coverImage.url), fit: BoxFit.cover,)
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _backgroundBox(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size.width,
        height: size.height * .80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 45, 59, 1.0),
              Colors.transparent
            ],
            stops: [.60,1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
          )
        ),
      ),
    );
  }
}

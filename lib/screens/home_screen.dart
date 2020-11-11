import 'package:app/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size size;
  double _height;
  double _width;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    _height=size.height;
    _width=size.width;
    return Scaffold(
      body: Stack(children: [
        _featuredGames(),
        _backgroundBox(),
        _topLayer(),

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

  Widget _topLayer(){
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: size.height * .05,horizontal: size.width * .05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _appBarWidget(),
        ],
      ),
    );
  }

  Widget _appBarWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 30,color: Colors.white,),
       Row(
         children: [
           Icon(Icons.search,size: 30,color: Colors.white,),
           SizedBox(width: size.width * .05,),
           Icon(Icons.notifications_none,size: 30,color: Colors.white,),
         ],
       )
      ],
    );
  }
}

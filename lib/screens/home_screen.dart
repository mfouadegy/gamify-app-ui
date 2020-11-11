import 'package:app/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size size;
  int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex=0;
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
        _topLayer(),

      ],),
    );
  }

  Widget _featuredGames() {
    return SizedBox(
      height: size.height * .50,
      width: size.width,
      child: PageView(
        onPageChanged: (int index){
          setState(() {
            _selectedIndex=index;
          });
        },
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
          SizedBox(height: size.height * .25,),
          _featuredGameInfoWidget(),
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
        /*SvgPicture.asset(
            'assets/icons/menu.svg',
            matchTextDirection: false,
            color: Colors.white,
          width: 25,
          height: 25,
        ),*/
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

  Widget _featuredGameInfoWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(featuredGames[_selectedIndex].title,maxLines: 2,style: TextStyle(fontSize: 40,),),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: featuredGames.map((game) {
            int currentIndex=featuredGames.indexOf(game);
            return Container(
              margin: EdgeInsets.only(right: 2),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: currentIndex ==_selectedIndex ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(100)
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

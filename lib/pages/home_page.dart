import 'package:flutter/material.dart';

import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

// private class
class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: <Widget>[_featuresGAmeWidget(), _gradientBoxWidget()],
    ));
  }

  Widget _featuresGAmeWidget() {
    return SizedBox(
        height: _deviceHeight * 0.5,
        width: _deviceWidth,
        child: PageView(
          children: featuredGames.map((_game) {
            return Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(_game.coverImage.url),
              ),
            ));
          }).toList(),
        ));
  }

  Widget _gradientBoxWidget() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: _deviceHeight * 0.8,
          width: _deviceWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(35, 45, 59, 1.0),
            Colors.transparent,
          ], 
          stops: [
            0.65,
            1.0
          ],
          begin: Alignment.bottomCenter, 
          end: Alignment.topCenter)),
        ));
  }
}

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
      children: <Widget>[_featuresGAmeWidget()],
    ));
  }

  Widget _featuresGAmeWidget() {
    return SizedBox(
        height: _deviceHeight * 0.5,
        width: _deviceWidth,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
          image: NetworkImage(featuredGames[0].coverImage.url),
        ))));
  }
}

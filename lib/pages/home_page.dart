import 'package:flutter/material.dart';

import '../data.dart';
import './widgets/scrollable_games_widget.dart';

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

  var _selectedGame;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedGame = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _featuresGameWidget(),
        _gradientBoxWidget(),
        _topLayerWidget()
      ],
    ));
  }

  Widget _featuresGameWidget() {
    return SizedBox(
        height: _deviceHeight * 0.5,
        width: _deviceWidth,
        child: PageView(
          onPageChanged: (_index) {
            setState(() => {_selectedGame = _index});
          },
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
          ], stops: [
            0.65,
            1.0
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ));
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.05, vertical: _deviceHeight * 0.005),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _topBarWidgtet(),
          SizedBox(height: _deviceHeight * 0.13),
          _featuredGamesInfoWidget(),
          Padding(
              padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01),
              child: ScrollableGamesWidget(
                  _deviceHeight * .30, _deviceWidth, true, games)),
          _featureGameBannerWiget(),
          ScrollableGamesWidget(
                  _deviceHeight * .22, _deviceWidth, false, games)
        ],
      ),
    );
  }

  Widget _topBarWidgtet() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.menu, color: Colors.white, size: 30),
            Row(
              children: <Widget>[
                const Icon(Icons.search, color: Colors.white, size: 30),
                SizedBox(
                  width: _deviceWidth * 0.03,
                ),
                const Icon(Icons.notifications, color: Colors.white, size: 30)
              ],
            )
          ]),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
        height: _deviceHeight * 0.12,
        width: _deviceWidth,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(featuredGames[_selectedGame].title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white, fontSize: _deviceHeight * 0.040)),
              SizedBox(height: _deviceHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: featuredGames.map((_game) {
                  double _circleRadius = _deviceHeight * 0.004;
                  bool _isActive =
                      _game.title == featuredGames[_selectedGame].title;

                  return Container(
                    margin: EdgeInsets.only(right: _deviceWidth * 0.015),
                    height: _circleRadius * 2,
                    width: _circleRadius * 2,
                    decoration: BoxDecoration(
                        color: _isActive ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(100)),
                  );
                }).toList(),
              )
            ]));
  }

  Widget _featureGameBannerWiget() {
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(featuredGames[3].coverImage.url))),
    );
  }
}

import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

//TODO add "WidgetsBindingObserver" mixin
class _HomePageWidgetState extends State<HomePageWidget>
    with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    //TODO: initialize binding observer

    //TODO: add callback "addPostFrameCallback"
    //TODO: create a simple method "_onWidgetLoaded"
  }

  @override
  Widget build(BuildContext context) {
    //TODO: adding Scaffold (body + bottomNavigationBar)
    return Container();
  }

  //TODO: build UI into separated methods
}
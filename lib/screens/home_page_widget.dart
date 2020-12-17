import 'package:flutter/material.dart';
import 'package:project_example/constants/app_colors.dart';
import 'package:project_example/widgets/custom_bottom_navigation_bar.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with WidgetsBindingObserver {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onWidgetLoaded();
    });
  }

  void _onWidgetLoaded() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _buildBackground(),
          _buildBodyPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: (tabSelected) {
          final index = NavigationTab.values.indexOf(tabSelected);
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
          SnackBar(content: Text('You choose $tabSelected'));
        },
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset("assets/png/bg_stars.jpg", fit: BoxFit.fitHeight),
    );
  }

  Widget _buildBodyPage() {
    return PageView(
      controller: _pageController,
      children: [
        _buildPlanetListWidget(),
        _buildBookMark(),
      ],
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.arrow_back_ios,
          color: AppColors.white,
        ),
        InkWell(
          onTap: () {
            //TODO: reset search input text

            //TODO: reset planet data and term serached

            //TODO: refresh the data
          },
          child: Icon(
            Icons.refresh,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      'Planets',
      style: TextStyle(
        fontSize: 36,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSearchBar() {
    //TODO: build a stateless search input widget
    return Container();
  }

  _buildPlanetListWidget() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 32.0,
          right: 32.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            SizedBox(height: 28),
            _buildTitle(),
            SizedBox(height: 16),
            _buildSearchBar(),

            //TODO: create method for building list
          ],
        ),
      ),
    );
  }

  _buildBookMark() {
    return Center(
      child: Text(
        "Coming soon! :)",
        style: TextStyle(
          fontSize: 36,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:project_example/constants/app_colors.dart';
import 'package:project_example/model/planet.dart';
import 'package:project_example/repository/planets_repository.dart';
import 'package:project_example/widgets/custom_bottom_navigation_bar.dart';
import 'package:project_example/widgets/planet_card_widget.dart';
import 'package:project_example/widgets/search_input_widget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with WidgetsBindingObserver {
  final PlanetsRepository _planetsRepository = PlanetsRepository();
  List<Planet> _planetList = [];
  String _searchTerm;
  final TextEditingController _searchController = TextEditingController();
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
    final planetList = await _planetsRepository.getAllPlanets();

    setState(() {
      _planetList = planetList;
    });
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
      physics: NeverScrollableScrollPhysics(),
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
            _searchController.text = "";

            setState(() {
              _planetList = [];
              _searchTerm = null;
            });

            _onWidgetLoaded();
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
    return SearchInputWidget(
      textController: _searchController,
      onTextChanged: (value) {
        final filterPlanets = _planetsRepository.getPlanetsByName(value);
        setState(() {
          _searchTerm = value;
          _planetList = filterPlanets;
        });
      },
    );
  }

  Widget _buildPlanetList() {
    if (_planetList.isEmpty) {
      final isUserSearching = _searchTerm != null && _searchTerm.isNotEmpty;

      return Expanded(
        child: Center(
          child: isUserSearching
              ? Text(
                  'No data found for "$_searchTerm"',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                ),
        ),
      );
    }

    return ScrollConfiguration(
      behavior: RemoveGlowBehavior(),
      child: Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 16),
          itemBuilder: (context, index) => _buildPlanetItem(context, index),
          itemCount: _planetList.length,
          shrinkWrap: true,
        ),
      ),
    );
  }

  Widget _buildPlanetItem(BuildContext context, int index) {
    final planet = _planetList[index];

    return PlanetCardWidget(
      planet: planet,
    );
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
            _buildPlanetList()
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

class RemoveGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

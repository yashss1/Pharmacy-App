import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pharmacy_app/screens/Home.dart';
import 'package:pharmacy_app/screens/Diag.dart';
import 'package:pharmacy_app/screens/Account.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class DashBoard extends StatefulWidget {
  const DashBoard(
      {Key? key,
      required this.city,
      required this.state,
      required this.medJSON1})
      : super(key: key);

  final String city, state;
  final medJSON1;

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<String> _options = ["HOME", "CART", "MENU", "SETTINGS", "FAVORITES"];
  int _currentIndex = 0;
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home), title: new Text('Red')),
      BottomNavigationBarItem(
        icon: new Icon(Icons.search),
        title: new Text('Blue'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.info_outline), title: Text('Yellow'))
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Home(
          city: widget.city,
          state: widget.state,
          medJSON1: widget.medJSON1,
        ),
        Diag(city: widget.city, state: widget.state),
        Account(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: primaryGreen,
        backgroundColor: secondary,
        animationDuration: Duration(seconds: 1),
        height: 50,
        index: bottomSelectedIndex,
        animationCurve: Curves.bounceOut,
        items: <Widget>[
          Icon(
            Icons.home,
            color: bottomSelectedIndex == 0 ? Colors.white : primaryGreen,
            size: 25,
          ),
          Icon(
            Icons.airline_seat_flat_angled,
            color: bottomSelectedIndex == 1 ? Colors.white : primaryGreen,
            size: 25,
          ),
          Icon(
            Icons.account_circle_rounded,
            color: bottomSelectedIndex == 2 ? Colors.white : primaryGreen,
            size: 25,
          ),
        ],
        onTap: (index) {
          setState(() {
            bottomTapped(index);
          });
        },
      ),
    );
  }
}

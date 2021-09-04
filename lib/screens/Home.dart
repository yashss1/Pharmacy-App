import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharmacy_app/model/CategoryClass.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/model/category_model.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:pharmacy_app/ResultPage.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmacy_app/services/networking.dart';
import 'package:pharmacy_app/services/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.city, required this.state})
      : super(key: key);

  final String city, state;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollViewController = new ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;
  String msg = 'Error';
  bool show_loader = false;
  int count = 10;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  void getData() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.fda.gov/drug/event.json?search=patient.reaction.reactionmeddrapt:"$msg"&limit=100');
    var medData = await networkHelper.getData();
    show_loader = false;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultPage(
        medData: medData,
        city: widget.city,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          AnimatedContainer(
            height: _showAppbar ? 220.0 : 220.0,
            color: primaryGreen,
            width: MediaQuery.of(context).size.width,
            duration: Duration(milliseconds: 200),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 20, left: 5, bottom: 15),
                  child: Visibility(
                    visible: _showAppbar,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: ClipRRect(
                                child: Image.asset('images/mm_logo.jpg'),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Med',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3,
                                    ),
                                  ),
                                  Text(
                                    'Market',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.blueGrey,
                                ),
                                Text(
                                  widget.city == null ? 'yash' : widget.city,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 23,
                            child: Icon(
                              Icons.shopping_cart,
                              size: 25,
                              color: primaryGreen,
                            )),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: Colors.white,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('Search Medicine'),
                //       Icon(Icons.search),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 70,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            //Do something with the user input.
                            msg = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: "Enter Medicine",
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          show_loader = true;
                          setState(() {});
                          getData();
                        },
                        icon: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height - 220,
              height: _showAppbar
                  ? MediaQuery.of(context).size.height - 210
                  : MediaQuery.of(context).size.height - 170,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      // scrollDirection: Axis.horizontal,
                      controller: _scrollViewController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              'Category : ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: category.length,
                              itemBuilder: (BuildContext context, index) =>
                                  CategoryModel(
                                categoryClass: category[index],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 5),
                            child: ImageSlideshow(
                              width: double.infinity,
                              height: 200,
                              initialPage: 0,
                              indicatorColor: Colors.blue,
                              indicatorBackgroundColor: Colors.grey,
                              onPageChanged: (value) {
                                debugPrint('Page changed: $value');
                              },
                              autoPlayInterval: 3000,
                              isLoop: true,
                              children: [
                                Image.asset(
                                  'images/med1.jpg',
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'images/dna.jpg',
                                  fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'images/med2.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: show_loader
                ? SpinKitDoubleBounce(
                    color: Colors.black,
                    size: 100.0,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

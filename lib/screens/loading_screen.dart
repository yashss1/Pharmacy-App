import 'package:flutter/material.dart';
import 'package:pharmacy_app/DashBoard.dart';
import 'package:pharmacy_app/screens/Home.dart';
import 'package:pharmacy_app/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String city = "", state = "";

  @override
  void initState() {
    super.initState();
    getlocationData();
  }

  void getlocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    city = location.city;
    state = location.state;

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DashBoard(city: city, state: state);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100.0,
        ),
      ),
    );
  }
}

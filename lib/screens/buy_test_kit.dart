import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/model/SearchedKM.dart';

class BuyTestKit extends StatefulWidget {
  const BuyTestKit({Key? key, required this.city}) : super(key: key);

  final String city;

  @override
  _BuyTestKitState createState() => _BuyTestKitState();
}

class _BuyTestKitState extends State<BuyTestKit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            height: 180,
            color: primaryGreen,
            width: MediaQuery.of(context).size.width,
            duration: Duration(milliseconds: 200),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 20, left: 5, bottom: 15),
                  child: Visibility(
                    visible: true,
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
                                  widget.city,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
                height: MediaQuery.of(context).size.height - 150,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SearchedKM(
                          name: 'Health Chekup',
                          city: widget.city,
                          price: '499'),
                      SearchedKM(
                          name: 'Winter Care', city: widget.city, price: '799'),
                      SearchedKM(
                          name: 'Arthritis Screening',
                          city: widget.city,
                          price: '999'),
                      SearchedKM(
                          name: 'Comprehensive Heart Health Chekup',
                          city: widget.city,
                          price: '999'),
                      SearchedKM(
                          name: 'Healthy Lung & Body Checkup',
                          city: widget.city,
                          price: '999'),
                      SearchedKM(
                          name: 'Diabetes Checkup',
                          city: widget.city,
                          price: '1299'),
                      SearchedKM(
                          name: 'Full Body CheckUp',
                          city: widget.city,
                          price: '999'),
                      SearchedKM(
                          name: 'Covid-19 Checkup',
                          city: widget.city,
                          price: '799'),
                      SearchedKM(
                          name: 'Alcohol Impact Checkup',
                          city: widget.city,
                          price: '1499'),
                      SearchedKM(
                          name: 'Pregnancy Checkup',
                          city: widget.city,
                          price: '999'),
                      SearchedKM(
                          name: 'Cancer Chekup',
                          city: widget.city,
                          price: '1899'),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

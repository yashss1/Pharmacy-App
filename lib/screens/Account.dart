import 'package:flutter/material.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_app/model/account_model.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  color: primaryGreen,
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: SvgPicture.asset(
                            'images/person.svg',
                            color: primaryGreen,
                            height: 60,
                            width: 60,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Yash Sonawane',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'yash493031@gmail.com',
                              style: TextStyle(
                                fontSize: 15,
                              ),
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
              height: MediaQuery.of(context).size.height - 210,
              child: Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Column(
                      children: [
                        AccountModel(
                          name: 'Settings',
                          icon: Icon(
                            Icons.settings,
                            size: 35,
                            color: primaryGreen,
                          ),
                        ),
                        AccountModel(
                          name: 'My Account',
                          icon: Icon(
                            Icons.account_circle,
                            size: 35,
                            color: primaryGreen,
                          ),
                        ),
                        AccountModel(
                          name: 'Cart',
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 35,
                            color: primaryGreen,
                          ),
                        ),
                        AccountModel(
                          name: 'Wishlist',
                          icon: Icon(
                            Icons.favorite_border,
                            size: 35,
                            color: primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

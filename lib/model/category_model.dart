import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/model/CategoryClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel extends StatelessWidget {
  const CategoryModel({Key? key, required this.categoryClass})
      : super(key: key);

  final CategoryClass categoryClass;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 152,
      // color: Colors.black26,
      child: Stack(
        children: [
          Positioned(
            top: 28,
            left: 30,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: secondary,
                ),
                margin: EdgeInsets.all(9),
                height: 100,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, top: 8),
                  child: Column(
                    children: [
                      Text(
                        categoryClass.name,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Circular'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: 2,
            child: Image.asset(
              categoryClass.icon,
              height: categoryClass.height,
            ),
          ),
          Positioned(
            top: 120,
            left: 120,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}

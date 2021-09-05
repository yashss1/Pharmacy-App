import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/model/CategoryClass.dart';
import 'package:pharmacy_app/model/category_model.dart';
import 'package:pharmacy_app/model/searched_medicine_model.dart';
import 'constants.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatefulWidget {
  ResultPage({this.medData, required this.city});
  final medData;
  final String city;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String medName = '0';
  String _dropDownValue = '10';
  @override
  void initState() {
    super.initState();
    // print(widget.medData);
    printTerm(widget.medData);
  }

  void printTerm(dynamic medData) {
    if (medData == null) {
      print('null Data');
      return;
    }
    medName = medData['results'][0]['patient']['drug'][0]['medicinalproduct'];
    print(medName);
    // print(medData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          AnimatedContainer(
            height: 220,
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
                                    'Mart',
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 17,
                        child: Text(
                          'Count:',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: DropdownButton(
                          hint: Text(
                            _dropDownValue,
                            style: TextStyle(color: Colors.blue),
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          items: [
                            '10',
                            '20',
                            '30',
                            '40',
                            '50',
                            '60',
                            '70',
                            '80',
                            '90',
                            '100'
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                _dropDownValue = '$val';
                                print(_dropDownValue);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
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
              child: widget.medData != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: int.tryParse(_dropDownValue) ?? 10,
                                itemBuilder: (context, index) {
                                  return SearchedMM(
                                    name: widget.medData['results'][index]
                                            ['patient']['drug'][0]
                                        ['medicinalproduct'],
                                    form: widget.medData['results'][index]
                                            ['patient']['drug'][0]
                                        ['drugdosageform'],
                                    quantity: widget.medData['results'][index]
                                            ['patient']['drug'][0]
                                        ['drugstructuredosagenumb'],
                                    id: widget.medData['results'][index]
                                            ['patient']['drug'][0]
                                        ['drugstructuredosageunit'],
                                    medJson: widget.medData,
                                    indice: index,
                                    city: widget.city,
                                  );
                                }),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     if (count < 90) {
                          //       count += 10;
                          //     }
                          //     setState(() {});
                          //   },
                          //   child: Text(
                          //     'View More',
                          //     style: TextStyle(
                          //       fontSize: 17,
                          //       fontFamily: 'Circular',
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('images/fof.json', height: 180),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Sorry',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: 'Circular',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Related Item not Found',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Circular',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

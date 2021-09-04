import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharmacy_app/constants.dart';

class DetailMed extends StatefulWidget {
  const DetailMed(
      {Key? key, this.medJson, required this.indice, required this.city})
      : super(key: key);
  final medJson;
  final int indice;
  final String city;

  @override
  _DetailMedState createState() => _DetailMedState();
}

class _DetailMedState extends State<DetailMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: primaryGreen,
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 10),
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
                              padding: const EdgeInsets.only(top: 9, left: 5),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 20),
                          child: Column(
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
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  // width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            height: 300,
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.medJson['results'][widget.indice]
                                          ['patient']['drug'][0]
                                      ['medicinalproduct'],
                                  // overflow: TextOverflow.fade,
                                  maxLines: 3,
                                  // softWrap: false,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.medJson['results'][widget.indice]
                                                  ['patient']['drug'][0]
                                              ['drugstructuredosageunit'] ==
                                          null
                                      ? 'NA'
                                      : widget.medJson['results'][widget.indice]
                                              ['patient']['drug'][0]
                                          ['drugstructuredosageunit'],
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                Text(
                                  'Safety Report Id : ',
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  widget.medJson['results'][widget.indice]
                                              ['safetyreportid'] ==
                                          null
                                      ? 'BMC'
                                      : widget.medJson['results'][widget.indice]
                                          ['safetyreportid'],
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(200),
                              ),
                            ),
                            // height: 300,
                            // width: 200,
                            height: MediaQuery.of(context).size.height * 0.35,
                            // width: MediaQuery.of(context).size.width * 0.5,
                            child: Image.asset(
                              'images/flask.png',
                              height: 270,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Text(
                          'Drug Batch Number : ',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.medJson['results'][widget.indice]['patient']
                                      ['drug'][0]['drugbatchnumb'] ==
                                  null
                              ? 'NA'
                              : widget.medJson['results'][widget.indice]
                                  ['patient']['drug'][0]['drugbatchnumb'],
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Drug Authorisation Number : ',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.medJson['results'][widget.indice]['patient']
                                      ['drug'][0]['drugauthorizationnumb'] ==
                                  null
                              ? 'NA'
                              : widget.medJson['results'][widget.indice]
                                      ['patient']['drug'][0]
                                  ['drugauthorizationnumb'],
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Drug Dosage Note : ',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.medJson['results'][widget.indice]['patient']
                                      ['drug'][0]['drugdosagetext'] ==
                                  null
                              ? 'NA'
                              : widget.medJson['results'][widget.indice]
                                  ['patient']['drug'][0]['drugdosagetext'],
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Drug Indication : ',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.medJson['results'][widget.indice]['patient']
                                      ['drug'][0]['drugindication'] ==
                                  null
                              ? 'NA'
                              : widget.medJson['results'][widget.indice]
                                  ['patient']['drug'][0]['drugindication'],
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Drug Start Date (YYYY-MM-DD) : ',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.medJson['results'][widget.indice]['patient']
                                      ['drug'][0]['drugstartdate'] ==
                                  null
                              ? 'NA'
                              : widget.medJson['results'][widget.indice]
                                  ['patient']['drug'][0]['drugstartdate'],
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Primary Source Country : ',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.medJson['results'][widget.indice]
                                      ['primarysourcecountry'] ==
                                  null
                              ? 'NA'
                              : widget.medJson['results'][widget.indice]
                                  ['primarysourcecountry'],
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Primary Source Country : ',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.medJson['results'][widget.indice]
                                      ['seriousnessdisabling'] ==
                                  null
                              ? 'NA'
                              : widget.medJson['results'][widget.indice]
                                  ['seriousnessdisabling'],
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Used Against : ',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          widget.medJson['results'][widget.indice]['patient']
                                      ['reaction'][0]['reactionmeddrapt'] ==
                                  null
                              ? 'NA'
                              : widget.medJson['results'][widget.indice]
                                      ['patient']['reaction'][0]
                                  ['reactionmeddrapt'],
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 10,
                  color: primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.shopping_cart,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
// child: Text(
// widget.medJson['results'][widget.indice]['patient']['drug'][0]
// ['medicinalproduct'],
// ),
// ),

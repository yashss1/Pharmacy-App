import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pharmacy_app/screens/detail_med.dart';

class SearchedMM extends StatelessWidget {
  const SearchedMM(
      {Key? key,
      required this.name,
      required this.form,
      required this.quantity,
      required this.id,
      this.medJson,
      required this.indice,
      required this.city})
      : super(key: key);

  final String name, form, quantity, id, city;
  final medJson;
  final int indice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(left: 8),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(
                      'images/flasks.png',
                      height: 80,
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailMed(
                            indice: indice,
                            medJson: medJson,
                            city: city,
                          );
                        }));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(
                                    name,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  id == null ? '00' : id,
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Quantity per Pack : ',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                quantity == null ? '15' : quantity,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Drug Dose Form : ',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 100,
                                child: Text(
                                  form == null ? 'Tab' : form,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
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
          ),
          Positioned(
            top: 15,
            right: 20,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          Positioned(
            top: 48,
            right: 30,
            child: CircleAvatar(
              radius: 20,
              child: Icon(
                Icons.shopping_cart,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

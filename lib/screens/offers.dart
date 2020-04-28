import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Offers Zone",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: Image(
                        image: AssetImage('assets/rewards.jpg'),
                      ),
                    )
                  ],
                ),
              ),
              offersCard("Festival Offer", "FESTETA", 'Thailand.jpg', "50"),
              offersCard(
                  "New Year Public Offer", "NYETA", 'Singapore.jpg', "60"),
              offersCard("Offer: Public Tour", "PTETA", 'Bali.jpg', "50"),
            ],
          ),
        ),
      ),
    );
  }

  Widget offersCard(
      String offerName, String couponCode, String imageName, String discount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 233,
        child: Card(
          elevation: 10,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage('assets/$imageName'),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 95,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "$offerName",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "$discount% off",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 5),
                        child: Text(
                          "Coupon Code",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                color: Colors.black12,
                                child: Text(
                                  "$couponCode",
                                  style: TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 2,
                                      color: Colors.black54),
                                ),
                              ),
                              Container(
                                color: Colors.lightGreen[100],
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "COPY CODE",
                                    style: TextStyle(color: Colors.green[600]),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

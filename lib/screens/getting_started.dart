import 'package:etraveladda/screens/Cart.dart';
import 'package:etraveladda/screens/home_page.dart';
import 'package:etraveladda/screens/offers.dart';
import 'package:flutter/material.dart';

class GettingStarted extends StatefulWidget {
  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/GettingStarted.jpg'),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            color: Color.fromRGBO(1, 1, 1, 0.25),
          ),
          Align(
            alignment: Alignment(-0.8, 0.5),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 200,
//                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Discover The\nJourney of Fun",
                        style: TextStyle(
                          wordSpacing: 2,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "See the world with us,\nyou don't want to miss the nature",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: 1),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                color: Color(0xff4d7ffe),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                    width: 200,
                    height: 50,
                    child: Center(
                        child: Text(
                      "Explore Now",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}

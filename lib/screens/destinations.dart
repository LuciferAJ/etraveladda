import 'package:flutter/material.dart';

class Destinations extends StatefulWidget {
  @override
  _DestinationsState createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: destinationCard("Singapore", "Singapore")),
                Expanded(child: destinationCard("Dubai", "Dubai"))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(child: destinationCard("Rajasthan", "Rajasthan")),
                Expanded(child: destinationCard("Bali", "Bali"))
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(child: destinationCard("Bhutan", "Bhutan")),
                Expanded(child: destinationCard("Malaysia", "Malaysia"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget destinationCard(String image, String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: AssetImage('assets/$image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(1, 1, 1, 0.25),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

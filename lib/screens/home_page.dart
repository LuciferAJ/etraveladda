import 'package:etraveladda/TourClass.dart';
import 'package:etraveladda/screens/Cart.dart';
import 'package:etraveladda/screens/destinations.dart';
import 'package:etraveladda/screens/offers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController controller;
  int _cIndex = 2;
  List internationalTours;
  List indianTours;
  final List<Widget> _children = [
    Destinations(),
    Cart(),
    HomeScreenBody(),
    Offers(),
  ];

  @override
  void initState() {
    internationalTours = getInternationalTours();
    indianTours = getIndianTours();
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  void _incrementTab(index) {
    setState(() {
      if (index == 4) {
        _scaffoldKey.currentState.openEndDrawer();
      } else {
        _cIndex = index;
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image(
            image: AssetImage("assets/eTravelAdda.png"),
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          centerTitle: true,
          backgroundColor: Color(0xffF9F9FB),
          elevation: 0,
          leading: Builder(builder: (BuildContext context) {
            return new GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: new Container(
                child: new Image.asset(
                  "assets/drawer1.png",
                ),
                padding: new EdgeInsets.all(17.0),
              ),
            );
          }),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'eTraveladda',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.white),
                    )),
                decoration: BoxDecoration(color: Color(0xff4d7ffe)),
              ),
              ListTile(
                title: Text(
                  'About Us',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Domestic Packages',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'International Packages',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Weekend Gateway',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Terms and Conditions',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Post your Review',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: DrawerHeader(
            child: ListView(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage('assets/Bali.jpg')))),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: new Text("John Doe", textScaleFactor: 1.5),
                  )
                ],
              ),
              Divider(),
              ListTile(
                title: Text(
                  'My Trips',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'My Cards',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Offers',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'LogOut',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              Divider(),
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black87,
          selectedItemColor: Color(0xff4d7ffe),
          currentIndex: _cIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.place, size: 25), title: new Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment, size: 25), title: new Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 25), title: new Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer, size: 25), title: new Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size: 25), title: new Text(''))
          ],
          onTap: (index) {
            _incrementTab(index);
          },
        ),
        backgroundColor: Color(0xffF9F9FB),
        key: _scaffoldKey,
        body: _children[_cIndex],
      ),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with TickerProviderStateMixin {
  TabController controller;
  int _cIndex = 0;
  List internationalTours;
  List indianTours;

  @override
  void initState() {
    internationalTours = getInternationalTours();
    indianTours = getIndianTours();
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Where do you want\n to go?",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    wordSpacing: 2,
                    color: Colors.black87),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300],
                              offset: Offset(1.5, 1.5),
                              blurRadius: 5)
                        ],
                        color: Colors.white),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                        child: TextField(
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            hintText: "Find yourself a destination",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(height: 0.0),
                        ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 8),
                child: Container(
                  width: 45,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff4d7ffe),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.5, 1.5),
                            blurRadius: 5)
                      ]),
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25, bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Top Trending International Tours",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff5D706A)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: tourCard(context, internationalTours),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 20, bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Top Trending Domestic Tours",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff5D706A)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: tourCard(context, indianTours),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 20, bottom: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Popular Tours",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff5D706A)),
              ),
            ),
          ),
          popularTour(context, "Malaysia", "₹24999.99", 'Malaysia.jpg', '4.0'),
          popularTour(context, "Thailand", "₹29999.50", "Thailand.jpg", '4.5'),
          popularTour(context, "Dubai", "₹27499.99", "Dubai.jpg", '4.2'),
          popularTour(context, "Bali", "₹35499.50", "Bali.jpg", '4.0')
        ],
      ),
    );
  }

  Widget popularTour(BuildContext context, String place, String price,
      String image, String stars) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
      child: Container(
        height: 120,
        child: Card(
          elevation: 4.0,
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
//                width: 70,
                  height: 120,
//                color: Colors.black,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      child: Image(
                        image: AssetImage('assets/$image'),
                        fit: BoxFit.fill,
                        width: 110,
                      )),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                      child: Text(
                        place,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5D706A)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: Text(
                        "10 nights for two/all inclusive",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                      child: Text(
                        price,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5D706A)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
//                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff01A06A),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 8),
                      child: Text(
                        "$stars\n"
                        "★",
                        textAlign: TextAlign.center,
                      ),
                    ),
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

Widget tourCard(BuildContext context, tours) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.3,
    child: ListView.builder(
        itemCount: tours.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 4.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(tours[index].image),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        Container(
                          color: Color.fromRGBO(1, 1, 1, 0.25),
                        ),
                        Align(
                            alignment: Alignment(-1, 0.5),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                tours[index].countryName,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
  );
}

List getIndianTours() {
  return [
//      TourClass(countryName: 'Thailand', image: 'assets/Thailand.jpg'),
//      TourClass(countryName: 'Malaysia', image: 'assets/Malaysia.jpg'),
//      TourClass(countryName: 'Singapore', image: 'assets/Singapore.jpg'),
//      TourClass(countryName: 'Dubai', image: 'assets/Dubai.jpg'),
//      TourClass(countryName: 'Bali', image: 'assets/Bali.jpg'),
    TourClass(countryName: 'Kerala', image: 'assets/Kerala.jpg'),
    TourClass(countryName: 'Rajasthan', image: 'assets/Rajasthan.jpg'),
    TourClass(countryName: 'Andaman', image: 'assets/Andaman.jpg'),
    TourClass(countryName: 'Bhutan', image: 'assets/Bhutan.jpg'),
    TourClass(countryName: 'Kathmandu', image: 'assets/Kathmandu.jpg'),
  ];
}

List getInternationalTours() {
  return [
    TourClass(countryName: 'Malaysia', image: 'assets/Malaysia.jpg'),
    TourClass(countryName: 'Singapore', image: 'assets/Singapore.jpg'),
    TourClass(countryName: 'Thailand', image: 'assets/Thailand.jpg'),
    TourClass(countryName: 'Dubai', image: 'assets/Dubai.jpg'),
    TourClass(countryName: 'Bali', image: 'assets/Bali.jpg'),
  ];
}

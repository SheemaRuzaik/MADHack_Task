import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2_travel_app/models/travel_model.dart';
import 'package:task2_travel_app/providers/travel_data_provider.dart';
import 'package:task2_travel_app/screens/detailed_travel_screen.dart';

class TravelScreenList extends StatefulWidget {
  @override
  _TravelScreenListState createState() => _TravelScreenListState();
}

class _TravelScreenListState extends State<TravelScreenList> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<TravelDataProvider>(context, listen: false);
    model.loadTravel();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TravelDataProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: model.travellist.length,
            itemBuilder: (context, index) {
              TravelModel travelModel = model.travellist[index];
              return TravelViewCard(
                  image: travelModel.image,
                  destination: travelModel.destinationName,
                  place: travelModel.place,
                  shortDescp: travelModel.shortDescp,
                  longDescp: travelModel.longDescp);
            }));
  }
}

class TravelViewCard extends StatelessWidget {
  final String image;
  final String destination;
  final String place;
  final String shortDescp;
  final String longDescp;

  TravelViewCard({
    required this.image,
    required this.destination,
    required this.place,
    required this.shortDescp,
    required this.longDescp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
        color: Colors.blueGrey.shade100,
        child: InkWell(
          splashColor: Color.fromRGBO(102, 0, 51, 25),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag:'dash',
                    child: Container (
                        height: 500,
                        width: 400,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 1,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],

                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover)),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    destination,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color.fromRGBO(153, 0, 76, 25)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    place,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromRGBO(204, 0, 102, 50)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    shortDescp,
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(96, 96, 96, 25)),
                  )
                ],
              ),

            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailedView(
                            image: image,
                            destination: destination,
                            place: place,
                            //shortDescp:shortDescp,
                            longDescp: longDescp,
                          )));
            },
            )
    );
  }
}

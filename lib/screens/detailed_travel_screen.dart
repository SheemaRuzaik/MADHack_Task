import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2_travel_app/models/travel_model.dart';
import 'package:task2_travel_app/providers/travel_data_provider.dart';

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
            return DetailedView(
                image: travelModel.image,
                destination: travelModel.destinationName,
                place: travelModel.place,
                //shortDescp: travelModel.shortDescp,
                longDescp: travelModel.longDescp);
          }));
}

class DetailedView extends StatelessWidget {
  final String image;
  final String destination;
  final String place;

  //final String shortDescp;
  final String longDescp;

  DetailedView({
    required this.image,
    required this.destination,
    required this.place,
    //required this.shortDescp,
    required this.longDescp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 70,
      color: Colors.blueGrey.shade100,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Hero(
                  tag:'dash',
                  child: Container(
                    height: 600,
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
                longDescp,
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(32, 32, 32, 95)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

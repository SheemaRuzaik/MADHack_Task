import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task2_travel_app/models/travel_model.dart';

class TravelDataProvider with ChangeNotifier {
  List<TravelModel> travellist = [];

  loadTravel() {
    FirebaseFirestore.instance
        .collection("Travel_Destinations")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((queryDocSnapshot) {
        if (queryDocSnapshot.exists) {
          travellist.add(TravelModel.fromJason(queryDocSnapshot.data()));
        }
      });

      notifyListeners();
    });
  }
}

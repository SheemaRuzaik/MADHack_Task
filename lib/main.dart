import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:task2_travel_app/providers/travel_data_provider.dart';
import 'package:task2_travel_app/screens/travel_dest_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  static const String _title = 'My Travel App';
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:_title,
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.pink.shade900)
        ),
        home: TravelScreenList(),
      ),
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<TravelDataProvider>(
      create: (_) => TravelDataProvider())
];

import 'package:bookmyfilm/screens/show_item_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
      
       MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
         // colorScheme:ColorScheme.dark(),
          primarySwatch: Colors.blue,
        ),
        home: //PlayTrailer(),
            MovieList(),
      
    );
  }
}

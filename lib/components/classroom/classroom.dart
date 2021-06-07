import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(GoogleClassroomClone());

class GoogleClassroomClone extends StatefulWidget {
  @override
  _GoogleClassroomCloneState createState() => _GoogleClassroomCloneState();
}

class _GoogleClassroomCloneState extends State<GoogleClassroomClone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GoogleClassroomClone",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

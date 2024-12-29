import 'package:flutter/material.dart';
import 'package:todo_list/thirdPage.dart';
import 'package:todo_list/subDetail.dart';
import 'package:todo_list/secondDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: { // 페이지를 등록한다는 개념
        '/': (context) => SubDetail(),
        '/second': (context) => SecondDetail(),
        '/third': (context) => ThirdDetail()
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:listview_example/sub/firstPage.dart';
import 'package:listview_example/sub/secondPage.dart';
import './animalItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(animalName: '벌', kind: "곤충", imagePath: "repo/images/bee.png"));
    animalList.add(Animal(animalName: '고양이', kind: "포유류", imagePath: "repo/images/cat.png"));
    animalList.add(Animal(animalName: '젖소', kind: "포유류", imagePath: "repo/images/cow.png"));
    animalList.add(Animal(animalName: '강아지', kind: "포유류", imagePath: "repo/images/dog.png"));
    animalList.add(Animal(animalName: '원숭이', kind: "영장류", imagePath: "repo/images/fox.png"));
    animalList.add(Animal(animalName: '원숭이', kind: "영장류", imagePath: "repo/images/monkey.png"));
    animalList.add(Animal(animalName: '돼지', kind: "포유류", imagePath: "repo/images/pig.png"));
    animalList.add(Animal(animalName: '늑대', kind: "포유류", imagePath: "repo/images/wolf.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Example'),
      ),
      body: TabBarView(
        children: <Widget>[
          FirstApp(list: animalList),
          SecondApp(list: animalList)
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue)),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue))
        ],
        controller: controller,
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}

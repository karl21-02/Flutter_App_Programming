import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FileApp();
}

class _FileApp extends State<FileApp> {
  int _count = 0;
  List<String> itemList = [];
  TextEditingController controller = TextEditingController();

  Future<List<String>> readListFile() async {
    List<String> itemList = [];
    var key = 'first';
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? firstCheck = pref.getBool(key);
    var dir = await getApplicationDocumentsDirectory();
    bool fileExist = await File('${dir.path}/fruit.txt').exists();

    try {
      if (firstCheck == null || firstCheck == false || fileExist == false) {
        pref.setBool(key, true);
        var file =
        await DefaultAssetBundle.of(context).loadString('repo/fruit.txt');
        File('${dir.path}/fruit.txt').writeAsStringSync(file);
        var array = file.split('\n');
        for (var item in array) {
          itemList.add(item.trim()); // 공백 제거
        }
      } else {
        var file = await File('${dir.path}/fruit.txt').readAsString();
        var array = file.split('\n');
        for (var item in array) {
          itemList.add(item.trim());
        }
      }
    } catch (e) {
      print('Error loading file: $e');
    }

    return itemList;
  }

  @override
  void initState() {
    super.initState();
    readCountFile();
    initData();
  }

  void initData() async {
    var result = await readListFile();
    setState(() {
      itemList.addAll(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        itemList[index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
                itemCount: itemList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          writeFruit(controller.value.text);
          setState(() {
            itemList.add(controller.value.text);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void writeFruit(String fruit) async {
    var dir = await getApplicationDocumentsDirectory();
    var file = await File(dir.path + '/fruit.txt').readAsString();
    file = file + '\n' + fruit;
    File(dir.path + '/fruit.txt').writeAsStringSync(file);
  }

  void readCountFile() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var file = await File('${dir.path}/count.txt').readAsString();
      setState(() {
        _count = int.parse(file);
      });
    } catch (e) {
      print('Error reading count file: $e');
    }
  }
}

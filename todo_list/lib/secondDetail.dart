import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(controller.value.text);
              },
              child: Text('저장하기'),
            ),
          ],
        ),
      ),
    );
  }
}
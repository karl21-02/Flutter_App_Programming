import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendDataExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SendDataExample();
}

class _SendDataExample extends State<SendDataExample> {
  static const platform = const MethodChannel('com.flutter.dev/encrypto');

  TextEditingController controller = new TextEditingController();
  String _changeText = 'Nothing';
  String _reChangedText = 'Nothing';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Data Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _changeText,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _decodeText(_changeText);
                },
                child: Text('디코딩하기'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _reChangedText,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sendData(controller.value.text);
        },
        child: Text("변환"),
      ),
    );
  }

  Future<void> _sendData(String text) async {
    final String result = await platform.invokeMethod('getEncrypto', text);
    print(result);
    setState(() {
      _changeText = result;
    });
  }
  void _decodeText(String changText) async {
    final String result = await platform.invokeMethod('getDecode', changText);
    setState(() {
      _reChangedText = result;
    });
  }
}
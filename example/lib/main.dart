import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:documents_picker/documents_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> docPaths;

  void _getDocuments() async {
    docPaths = await DocumentsPicker.pickDocuments(maxCount: 10);

    if (!mounted) return;
    setState(() {});
  }

  void _getImages() async {
    docPaths = await DocumentsPicker.pickImages(maxCount: 10);

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Get documents'),
                onPressed: _getDocuments,
              ),
              FlatButton(
                child: Text('Get Images'),
                onPressed: _getImages,
              ),
              if (docPaths != null) Text(docPaths.join('\n'))
            ],
          ),
        ),
      ),
    );
  }
}

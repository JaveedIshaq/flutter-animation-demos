import 'package:flutter/material.dart';
import 'package:flutter_animations_demo/mpin_animatin/mpin_animatin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation Demos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Animation Demos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.purple,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MpinAnimatin(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      'MpinPage Button Press Animation',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

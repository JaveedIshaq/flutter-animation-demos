import 'package:flutter/material.dart';
import 'package:flutter_animations_demo/mpin_animatin/mpin_animatin_item.dart';

class MpinAnimatin extends StatefulWidget {
  const MpinAnimatin({Key? key}) : super(key: key);

  @override
  _MpinAnimatinState createState() => _MpinAnimatinState();
}

class _MpinAnimatinState extends State<MpinAnimatin> {
  MpinAnimationController _animationController = MpinAnimationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.pink,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              MpinAnimatinItem(
                controller: _animationController,
              ),
              ElevatedButton(
                  onPressed: () {
                    _animationController.animate();
                  },
                  child: Text('1'))
            ],
          ),
        ),
      ),
    );
  }
}

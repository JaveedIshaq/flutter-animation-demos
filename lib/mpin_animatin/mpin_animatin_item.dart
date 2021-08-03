import 'package:flutter/material.dart';

class MpinAnimationController {
  late void Function() animate;
}

class MpinAnimatinItem extends StatefulWidget {
  const MpinAnimatinItem({Key? key, required this.controller})
      : super(key: key);

  final MpinAnimationController controller;

  @override
  _MpinAnimatinItemState createState() => _MpinAnimatinItemState(controller);
}

class _MpinAnimatinItemState extends State<MpinAnimatinItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;

  void animate() {
    _controller.forward();
  }

  _MpinAnimatinItemState(controller) {
    controller.animate = animate;
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed)
        _controller.reverse();
      setState(() {});
    });
    _sizeAnimation = Tween<double>(begin: 24, end: 72).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _sizeAnimation.value,
        width: _sizeAnimation.value,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(_sizeAnimation.value / 2)),
        child: Align(
          alignment: Alignment.center,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Transform.scale(
              scale: _sizeAnimation.value / 48,
              child: Text(
                '1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ));
  }
}

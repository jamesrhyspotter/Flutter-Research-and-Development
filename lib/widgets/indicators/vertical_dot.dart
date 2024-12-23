import 'package:flutter/material.dart';

class VerticalDotTraceAnimation extends StatefulWidget {
  const VerticalDotTraceAnimation({Key? key}) : super(key: key);

  @override
  State<VerticalDotTraceAnimation> createState() => _VerticalDotTraceAnimationState();
}

class _VerticalDotTraceAnimationState extends State<VerticalDotTraceAnimation> with SingleTickerProviderStateMixin{
  bool selected = false;

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState(){
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween(
        begin: 1.0,
        end: 10.0
    ).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.fastOutSlowIn)
    );

    _animationController.repeat(reverse: true);

    _animationController.reverseDuration = Duration(seconds: 5);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

  //  Curves.fastOutSlowIn,

    return Scaffold(
      body: Container(
        color: Colors.black,
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, _) {
                      return Positioned(
                       // width: selected ? 200.0 : 50.0,
                       // height: selected ? 50.0 : 200.0,
                        top: ((height*0.05))*_animation.value,
                        child: Container(
                          height:50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white12,
                            border: Border.all(color: Colors.amber.shade800, width: 1.0)
                          ),
                          child: Icon(Icons.arrow_upward, color: Colors.white),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

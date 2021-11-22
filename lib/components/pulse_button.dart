import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PulseButton extends StatefulWidget {

    final GestureTapCallback onTap;
    final String imagePath;


    PulseButton(@required this.imagePath, @required this.onTap);

    @override
    _PulseButtonState createState() => _PulseButtonState();
  }

class _PulseButtonState extends State<PulseButton> with SingleTickerProviderStateMixin{

    late AnimationController _animationController;
    late Animation _animation;

    @override
    void initState(){
      _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
      );

      _animation = Tween(
          begin: 0.0,
          end: 12.0
      ).animate(
          CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOut)
      );

      _animationController.repeat(reverse: true);

      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      child: AnimatedBuilder(
          animation: _animation,
          builder: (context, _) {
            return Ink(
                padding: EdgeInsets.all(16.0),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      for(int i = 0; i <= 2; i++)
                        BoxShadow(
                          color: Colors.white.withOpacity(_animationController.value / 2),
                          spreadRadius: _animation.value * i,
                        )
                    ]
                ),
                child: SvgPicture.asset(widget.imagePath,)
            );
          }
      ),
      onTap: widget.onTap,
    );
  }
}

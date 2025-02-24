import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int reps = 10;
  int repTime = 8;
  int totalTime = 80;

  Color fillColor = Colors.amber.shade800;
  Color ringColor = Colors.grey.shade300;
  Color backgroundColor = Colors.black87;

  CountDownController _controller = CountDownController();
  int _duration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: CircularCountDownTimer(
            // Countdown duration in Seconds.
            duration: totalTime,

            // Countdown initial elapsed Duration in Seconds.
            initialDuration: 0,

            // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
            controller: _controller,

            // Width of the Countdown Widget.
            width: MediaQuery.of(context).size.width / 2,

            // Height of the Countdown Widget.
            height: MediaQuery.of(context).size.height / 2,

            // Ring Color for Countdown Widget.
            ringColor: ringColor,

            // Ring Gradient for Countdown Widget.
            ringGradient: null,

            // Filling Color for Countdown Widget.
            fillColor: fillColor,

            // Filling Gradient for Countdown Widget.
            fillGradient: null,

            // Background Color for Countdown Widget.
            backgroundColor: backgroundColor,

            // Background Gradient for Countdown Widget.
            backgroundGradient: null,

            // Border Thickness of the Countdown Ring.
            strokeWidth: 10.0,

            // Begin and end contours with a flat edge and no extension.
            strokeCap: StrokeCap.butt,

            // Text Style for Countdown Text.
            textStyle: TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),

            // Format for the Countdown Text.
            textFormat: CountdownTextFormat.S,

            // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
            isReverse: false,

            // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
            isReverseAnimation: false,

            // Handles visibility of the Countdown Text.
            isTimerTextShown: true,

            // Handles the timer start.
            autoStart: false,

            // This Callback will execute when the Countdown Starts.
            onStart: () {
              // Here, do whatever you want
              print('Countdown Started');
            },

            // This Callback will execute when the Countdown Ends.
            onComplete: () {
              // Here, do whatever you want
              print('Countdown Ended');
            },
          )),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button(title: "Start", onPressed: () => _controller.start()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Pause", onPressed: () => _controller.pause()),
          SizedBox(
            width: 10,
          ),
          _button(title: "Resume", onPressed: () => _controller.resume()),
          SizedBox(
            width: 10,
          ),
          _button(
              title: "Restart",
              onPressed: () => _controller.restart(duration: _duration))
        ],
      ),
    );
  }

  _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
        child: ElevatedButton(
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    ));
  }
}

import 'package:flutter/material.dart';

class StepperList extends StatefulWidget {
  @override
  _StepperListState createState() => _StepperListState();
}

class _StepperListState extends State<StepperList> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stepper(
          steps: const [
            Step(
              title: Text('Step 1'),
              content: Text('Text Content'),
            ),
            Step(
              title: Text('Step 2'),
              content: Text('Text Content'),
            ),
            Step(
              title: Text('Step 3'),
              content: Text('Text Content'),
            ),
          ],
        onStepTapped: (int newIndex){
            setState(() {
              _currentStep = newIndex;
            });
        },
          currentStep: _currentStep,
          onStepContinue: (){
            if(_currentStep != 2){
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepCancel: (){
            if(_currentStep != 0){
              setState(() {
                _currentStep -= 1;
              });
            }
          },
        ),
      ),
    );
  }
}

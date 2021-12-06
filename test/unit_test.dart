

import 'package:flutter_test/flutter_test.dart';


// STEPS ------------------------------
// 1. Add the Test Dependency
// 2. Create a test file
//    app /
//      lib /
//        counter.dart
//      test/
//        counter_test.dart
// 3. Create a class to test
//  'unit' is another name for a function, method or class
// 4. Write a test for our class

    // void main() {
    //   test('Counter value should be incremented', () {
    //     final counter = Counter();
    //
    //     counter.increment();
    //
    //     expect(counter.value, 1);
    //   });
    // }

// 5. Combine multiple tests in a group
    //
    // void main() {
    //   group('Counter', () {
    //     test('value should start at 0', () {
    //       expect(Counter().value, 0);
    //     });
    //
    //     test('value should be incremented', () {
    //       final counter = Counter();
    //
    //       counter.increment();
    //
    //       expect(counter.value, 1);
    //     });
    //
    //     test('value should be decremented', () {
    //       final counter = Counter();
    //
    //       counter.decrement();
    //
    //       expect(counter.value, -1);
    //     });
    //   });
    // }



void main() {

  // RUNNING BEFORE EVERY TEST -------------------------------
  setUp(() => {

  });

  // RUNNING AFTER EVERY TEST --------------------------------
  tearDown(() => {

  });


  // TESTS ---------------------------------------------------

  group("Testing Group for My Widget", (){

  });
  test("Test Name", (){

    //Test contents
    // Object testUnit = Object();

    //expect(actual, output)
    //expect(testCode.value, desiredValue)

  });
}
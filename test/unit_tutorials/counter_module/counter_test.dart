import 'package:flutter_test/flutter_test.dart';
import 'package:tutorials_testing/unit_tutorials/counter_module/counter.dart';

void main() {
  // setUpAll(() => prints("setUpAll"));// It will execute once before any test run
  //  setUp(() => prints("setUp"));// It will execute before every test
  //  tearDown(() => prints("tearDown"));// It will execute after every test
  //  tearDownAll(() => prints("tearDownAll"));// It will execute once after all test run

  group("Counter class -", () {
    late Counter counter;
    //Arrange => give
    setUp(() => counter = Counter());

    //give when then
    test(
        "give counter class when it is instantiated then value of count should be 0",
        () {
      //Arrange => give
      //Act => when
      final value = counter.counter;
      //Assert =>then
      expect(value, 0);
    });

    //give when then
    test(
        "give counter class when it is incremented then value of count should be 1",
        () {
      //Arrange => give
      //Act =>when
      counter.incrementCounter();
      //Assert=>then
      expect(counter.counter, 1);
    });

    //give when then
    test(
        "give counter class when it is decremented then value of count should be -1",
        () {
      //Arrange => give
      //Act =>when
      counter.decrementCounter();
      //Assert=>then
      expect(counter.counter, -1);
    });

    //give when then
    test("give counter class when it is reset then value of count should be 0",
        () {
      //Arrange => give
      //Act =>when
      counter.reset();
      //Assert=>then
      expect(counter.counter, 0);
    });
  });
}

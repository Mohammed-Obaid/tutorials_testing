
class Counter {
  int _counter = 0;

  get counter => _counter;

  void incrementCounter() {_counter++;}

  void decrementCounter() {_counter--;}

  void reset(){
    _counter=0;
  }
}

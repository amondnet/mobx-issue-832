import 'dart:math';

import 'package:mobx/mobx.dart';

// Include generated file
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @readonly
  int _value = 0;

  @readonly
  bool _loading = false;

  Future<void> makeApiCall() async{
    _loading = true;
    // simulating api call
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));
    _loading = false;
  }

  Future<void> increment() async {
    _value = 0;
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));
    var _random = new Random();
    var _diceface = _random.nextInt(6) +1 ;
    _value = _diceface;
  }
}

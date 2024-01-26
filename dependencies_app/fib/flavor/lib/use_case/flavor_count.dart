import 'package:base/use_case/count.dart';

class FlavorCount extends BaseCount {
  final int _previousCounter;
  FlavorCount(this._previousCounter);

  @override
  int call(int counter) => _previousCounter + counter;
}

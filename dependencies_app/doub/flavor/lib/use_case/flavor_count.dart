import 'package:base/use_case/count.dart';

class FlavorCount extends BaseCount {
  @override
  int call(int counter) => counter * 2;
}

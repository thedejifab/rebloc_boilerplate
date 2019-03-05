import 'package:meta/meta.dart';
import 'package:rebloc/rebloc.dart';

class IncrementCounter extends Action{
  final int currentCounter;

  const IncrementCounter({@required this.currentCounter});
}

class DisplayNewCounter extends Action{
  final int newCounter;

  const DisplayNewCounter({@required this.newCounter});
}
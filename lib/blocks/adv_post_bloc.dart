import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _monthController = PublishSubject<String>();

  Observable<String> get monthStream => _monthController.stream;

  selectMonth(String month) {
    _monthController.sink.add(month);
  }

  dispose() {
    _monthController.close();
  }
}

final bloc = MoviesBloc();
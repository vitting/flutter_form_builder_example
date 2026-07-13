import 'dart:async';

class DataRepository {
  final StreamController<String> _dataStreamController = StreamController<String>.broadcast();

  Stream<String> get dataStream => _dataStreamController.stream;

  void updateData(String newData) {
    _dataStreamController.add(newData);
  }

  void dispose() {
    _dataStreamController.close();
  }
}

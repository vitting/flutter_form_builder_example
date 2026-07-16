import 'dart:async';

class FormRenderBuilderRepository {
  final StreamController<bool> _streamController = StreamController<bool>.broadcast();

  Stream<bool> get dataStream => _streamController.stream;

  void updateData(bool isMouseOver) {
    _streamController.add(isMouseOver);
  }
}

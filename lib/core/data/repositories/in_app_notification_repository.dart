import 'package:flutter/foundation.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/core/domain/entities/info_entity.dart';

class InAppNotificationRepository extends ChangeNotifier {
  ErrorEntity? _lastError;
  InfoEntity? _lastInfo;
  Future<void> addError(ErrorEntity error) async {
    _lastInfo = null;
    _lastError = error;
    notifyListeners();
  }

  Future<void> addInfo(InfoEntity info) async {
    _lastError = null;
    _lastInfo = info;
    notifyListeners();
  }

  Future<void> cleanup() async {
    _lastError = null;
    _lastInfo = null;
    notifyListeners();
  }

  Future<ErrorEntity?> get error async => _lastError;
  Future<InfoEntity?> get info async => _lastInfo;
}

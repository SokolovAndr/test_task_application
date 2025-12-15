import 'package:chopper/chopper.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/generated/l10n.dart';

part 'resource_error.freezed.dart';
part 'resource_error.g.dart';

@freezed
sealed class ResourceError with _$ResourceError implements Exception {
  const factory ResourceError({
    required String? code,
    @Default('Error') String description,
  }) = _ResourceError;

  factory ResourceError.fromJson(Map<String, dynamic> json) =>
      _$ResourceErrorFromJson(
        json.map(
          (key, value) => MapEntry(
            switch (key) {
              'errorMessage' => 'message',
              'errorCode' => 'code',
              'title' => 'message',
              String() => key,
            },
            key == 'message' && value == null ? S.current.unknown_error : value,
          ),
        ),
      );
}

extension RError on Response {
  ResourceError? get resourceError => error as ResourceError?;
}

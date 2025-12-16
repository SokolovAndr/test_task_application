import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);
typedef Json = Map<String, dynamic>;

class BaseResponseConverter extends JsonConverter {
  const BaseResponseConverter(this.factories);
  static const Converter jsonConverter = JsonConverter();
  final Map<Type, JsonFactory> factories;

  T? _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      return null;
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity as List);

    if (entity is Map) return _decodeMap<T>(entity as Map<String, dynamic>);

    return entity;
  }

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    if (response.body is String &&
        (response.body as String).isEmpty &&
        response.statusCode == 200) {
      return Response(response.base, null, error: response.error);
    }
    final jsonRes = await super.convertResponse(response);

    return jsonRes.copyWith<ResultType>(body: _decode<Item>(jsonRes.body));
  }

  @override
  FutureOr<Response> convertError<ResultType, Item>(Response response) async {
    final jsonRes = await super.convertError(response);
    return jsonRes.copyWith<ResourceError>(
      body: ResourceError.fromJson(jsonRes.body),
    );
  }
}

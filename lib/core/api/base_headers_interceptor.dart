import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:intl/intl.dart';

class BaseHeadersInterceptor implements Interceptor {
  const BaseHeadersInterceptor();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    final response = await chain.proceed(
      applyHeaders(chain.request, {
        'Accept': chain.request.headers['Accept'] ?? 'application/json',
        'Content-type':
            chain.request.headers['Content-type'] ?? 'application/json',
        'locale': Intl.getCurrentLocale(),
        'DeviceTimestamp': DateTime.now().toIso8601String(),
      }),
    );
    return response;
  }
}

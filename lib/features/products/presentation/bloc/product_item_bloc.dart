import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_application/core/data/data_sources/dto/request_error.dart';
import 'package:test_task_application/core/data/data_sources/dto/resource_error.dart';
import 'package:test_task_application/core/data/repositories/in_app_notification_repository.dart';
import 'package:test_task_application/core/domain/entities/error_entity.dart';
import 'package:test_task_application/features/products/data/repositories/products_repository.dart';
import 'package:test_task_application/features/products/domain/entities/product_entity.dart';

part 'product_item_event.dart';
part 'product_item_state.dart';
part 'product_item_bloc.freezed.dart';

class ProductItemBloc extends Bloc<ProductItemEvent, ProductItemState> {
  ProductItemBloc(
    this.productsRepository,
    this.inAppNotificationRepository,
    this.id,
  ) : super(const _Loading()) {
    on<_Load>((event, emit) async {
      final s = state;
      emit(const _Loading());
      try {
        final product = await productsRepository.getProductById(id: id);
        emit(_Loaded(product: product));
      } on ResourceError catch (e) {
        emit(s);
        await inAppNotificationRepository.addError(
          ErrorEntity(
            error: e.description,
            retryAction: () {
              if (!isClosed) {
                add(event);
              }
            },
          ),
        );
      } on RequestError catch (e) {
        emit(s);
        await inAppNotificationRepository.addError(
          ErrorEntity(
            error: e.description,
            retryAction: () {
              if (!isClosed) {
                add(event);
              }
            },
          ),
        );
      }
    });
  }
  final int id;
  final ProductsRepository productsRepository;
  final InAppNotificationRepository inAppNotificationRepository;
}

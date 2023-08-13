import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final AddOrderUseCase _addOrderUseCase;
  final FetchOrdersUseCase _fetchOrdersUseCase;
  final GetUserFromStorageUseCase _getUserFromStorageUseCase;

  OrderBloc({
    required AddOrderUseCase addOrderUseCase,
    required FetchOrdersUseCase fetchOrdersUseCase,
    required GetUserFromStorageUseCase getUserFromStorageUseCase,
  })  : _addOrderUseCase = addOrderUseCase,
        _fetchOrdersUseCase = fetchOrdersUseCase,
        _getUserFromStorageUseCase = getUserFromStorageUseCase,
        super(OrderState.empty()) {
    on<InitListOfOrders>(_initOrders);
    on<LoadOrders>(_loadOrders);
    on<AddOrder>(_addOrder);

    add(InitListOfOrders());
  }

  Future<void> _initOrders(
    InitListOfOrders event,
    Emitter<OrderState> emit,
  ) async {
    if (state.orderItems.isEmpty) {
      add(LoadOrders());
      emit(
        state.copyWith(isLoading: true),
      );
      
    } else {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> _addOrder(
    AddOrder event,
    Emitter<OrderState> emit,
  ) async {
    await _addOrderUseCase.execute(event.order);
    final List<OrderModel> orders = List.from(state.orderItems)
      ..insert(0, event.order);
    emit(state.copyWith(orderItems: orders));
  }

  Future<void> _loadOrders(
    LoadOrders event,
    Emitter<OrderState> emit,
  ) async {
    final UserModel userFromStorage = await _getUserFromStorageUseCase.execute(
      const NoParams(),
    );
    try {
      final List<OrderModel> ordersList =
          await _fetchOrdersUseCase.execute(userFromStorage.uid);
      ordersList.isEmpty
          ? emit(
              state.copyWith(
                orderItems: [],
                isLoading: false,
              ),
            )
          : emit(
              state.copyWith(
                orderItems: ordersList,
                isLoading: false,
              ),
            );
    } catch (error) {
      emit(state.copyWith(exception: error));
    }
  }
}

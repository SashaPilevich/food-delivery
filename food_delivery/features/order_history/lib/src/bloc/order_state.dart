part of 'order_bloc.dart';

class OrderState {
  final List<OrderModel> orderItems;
  final Object exception;
  final bool isLoading;

  OrderState({
    required this.orderItems,
    required this.exception,
    required this.isLoading,
  });

  OrderState.empty()
      : orderItems = [],
        exception = '',
        isLoading = true;

  OrderState copyWith({
    List<OrderModel>? orderItems,
    Object? exception,
    bool? isLoading,
  }) {
    return OrderState(
      orderItems: orderItems ?? this.orderItems,
      exception: exception ?? this.exception,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

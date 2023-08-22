part of 'admin_panel_bloc.dart';

class AdminPanelState {
  final List<DishModel> listOfProducts;
  final List<UserModel> listOfUsers;
  final List<OrderWithUserInfoModel> listOfOrders;
  final List<OrderWithUserInfoModel> listOfUncompletedOrders;
  final int numberOfUsers;
  final int salesAmount;
  final bool isLoading;
  final File selectedImage;
  final String imageUrl;
  final String exception;

  const AdminPanelState({
    required this.listOfProducts,
    required this.listOfUsers,
    required this.listOfOrders,
    required this.listOfUncompletedOrders,
    required this.numberOfUsers,
    required this.salesAmount,
    required this.isLoading,
    required this.imageUrl,
    required this.selectedImage,
    required this.exception,
  });

  AdminPanelState.empty()
      : listOfProducts = [],
        listOfUsers = [],
        listOfOrders = [],
        listOfUncompletedOrders = [],
        numberOfUsers = 0,
        salesAmount = 0,
        isLoading = true,
        imageUrl = '',
        selectedImage = File(''),
        exception = '';

  AdminPanelState copyWith({
    List<DishModel>? listOfProducts,
    List<UserModel>? listOfUsers,
    List<OrderWithUserInfoModel>? listOfOrders,
    List<OrderWithUserInfoModel>? listOfUncompletedOrders,
    int? numberOfUsers,
    int? salesAmount,
    bool? isLoading,
    String? imageUrl,
    File? selectedImage,
    String? exception,
  }) {
    return AdminPanelState(
      listOfProducts: listOfProducts ?? this.listOfProducts,
      listOfUsers: listOfUsers ?? this.listOfUsers,
      listOfOrders: listOfOrders ?? this.listOfOrders,
      listOfUncompletedOrders:
          listOfUncompletedOrders ?? this.listOfUncompletedOrders,
      numberOfUsers: numberOfUsers ?? this.numberOfUsers,
      salesAmount: salesAmount ?? this.salesAmount,
      isLoading: isLoading ?? this.isLoading,
      imageUrl: imageUrl ?? this.imageUrl,
      selectedImage: selectedImage ?? this.selectedImage,
      exception: exception ?? this.exception,
    );
  }
}

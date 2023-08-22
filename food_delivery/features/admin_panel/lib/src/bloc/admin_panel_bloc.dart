import 'dart:io';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'admin_panel_event.dart';
part 'admin_panel_state.dart';

class AdminPanelBloc extends Bloc<AdminPanelEvent, AdminPanelState> {
  final FetchAllDishesUseCase _fetchAllDishesUseCase;
  final UpdateProductUseCase _updateProductUseCase;
  final FetchAllUsersUseCase _fetchAllUsersUseCase;
  final UpdateUserRoleUseCase _updateUserRoleUseCase;
  final FetchAllOrdersUseCase _fetchAllOrdersUseCase;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;
  final AddProductUseCase _addProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final AppRouter _appRouter;
  AdminPanelBloc({
    required FetchAllDishesUseCase fetchAllDishesUseCase,
    required UpdateProductUseCase updateProductUseCase,
    required FetchAllUsersUseCase fetchAllUsersUseCase,
    required UpdateUserRoleUseCase updateUserRoleUseCase,
    required FetchAllOrdersUseCase fetchAllOrdersUseCase,
    required UpdateOrderStatusUseCase updateOrderStatusUseCase,
    required AddProductUseCase addProductUseCase,
    required DeleteProductUseCase deleteProductUseCase,
    required UploadImageUseCase uploadImageUseCase,
    required AppRouter appRouter,
  })  : _fetchAllDishesUseCase = fetchAllDishesUseCase,
        _updateProductUseCase = updateProductUseCase,
        _fetchAllUsersUseCase = fetchAllUsersUseCase,
        _updateUserRoleUseCase = updateUserRoleUseCase,
        _fetchAllOrdersUseCase = fetchAllOrdersUseCase,
        _updateOrderStatusUseCase = updateOrderStatusUseCase,
        _addProductUseCase = addProductUseCase,
        _deleteProductUseCase = deleteProductUseCase,
        _uploadImageUseCase = uploadImageUseCase,
        _appRouter = appRouter,
        super(AdminPanelState.empty()) {
    on<LoadProducts>(_loadProducts);
    on<UpdateProduct>(_updateProduct);
    on<LoadUsers>(_loadUsers);
    on<UpdateUserRole>(_updateUserRole);
    on<LoadOrders>(_loadOrders);
    on<UpdateOrderStatus>(_updateOrderStatus);
    on<AddProduct>(_addProduct);
    on<DeleteProduct>(_deleteProduct);
    on<UploadImage>(_uploadImage);
    on<SelectImage>(_selectImage);
    on<InitOrders>(_initOrders);
    on<NavigateToAddProductsScreen>(_navigateToAddProductsScreen);
    on<NavigateToCurrentScreen>(_navigateToCurrentScreen);

    add(const LoadProducts());
    add(const LoadUsers());
    add(const LoadOrders());
    add(const InitOrders());
  }

  Future<void> _initOrders(
    InitOrders event,
    Emitter<AdminPanelState> emit,
  ) async {
    if (state.listOfOrders.isEmpty || state.listOfUncompletedOrders.isEmpty) {
      emit(
        state.copyWith(isLoading: true),
      );
      add(const LoadOrders());
    } else {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> _loadProducts(
    LoadProducts event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      final List<DishModel> dishes = await _fetchAllDishesUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          listOfProducts: dishes,
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _updateProduct(
    UpdateProduct event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      await _updateProductUseCase.execute(event.dishModel);
      add(const LoadProducts());
      emit(state.copyWith(imageUrl: ''));
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _loadUsers(
    LoadUsers event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      final List<UserModel> users = await _fetchAllUsersUseCase.execute(
        const NoParams(),
      );
      emit(
        state.copyWith(
          listOfUsers: users,
          numberOfUsers: users.length,
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _updateUserRole(
    UpdateUserRole event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      await _updateUserRoleUseCase.execute(
        UpdateUserRoleParams(
          uid: event.uid,
          role: event.role,
        ),
      );
      add(const LoadUsers());
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _loadOrders(
    LoadOrders event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      final List<OrderWithUserInfoModel> orders =
          await _fetchAllOrdersUseCase.execute(
        const NoParams(),
      );

      final List<OrderWithUserInfoModel> listOfUncompletedOrders = [];
      int salesAmount = 0;

      for (OrderWithUserInfoModel order in orders) {
        salesAmount += order.orderModel.cart.totalPrice;
        if (!order.orderModel.isComplete) {
          listOfUncompletedOrders.add(order);
        }
      }

      emit(
        state.copyWith(
          listOfOrders: orders,
          listOfUncompletedOrders: listOfUncompletedOrders,
          isLoading: false,
          salesAmount: salesAmount,
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _updateOrderStatus(
    UpdateOrderStatus event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      await _updateOrderStatusUseCase.execute(
        UpdateOrderStatusParams(
          uid: event.uid,
          isComplete: event.isComplete,
        ),
      );
      add(const LoadOrders());
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _selectImage(
    SelectImage event,
    Emitter<AdminPanelState> emit,
  ) async {
    final ImagePicker imagePicker = ImagePicker();
    try {
      final XFile? file =
          await imagePicker.pickImage(source: ImageSource.gallery);
      emit(
        state.copyWith(
          selectedImage: File(file?.path ?? ''),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          exception: error.toString(),
        ),
      );
    }
  }

  Future<void> _uploadImage(
    UploadImage event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      final String imageUrl =
          await _uploadImageUseCase.execute(event.imageFile);
      emit(
        state.copyWith(
          imageUrl: imageUrl,
          selectedImage: File(''),
        ),
      );
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _addProduct(
    AddProduct event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      await _addProductUseCase.execute(event.dishModel);
      emit(state.copyWith(imageUrl: ''));
      add(const LoadProducts());
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  Future<void> _deleteProduct(
    DeleteProduct event,
    Emitter<AdminPanelState> emit,
  ) async {
    try {
      await _deleteProductUseCase.execute(event.id);
      add(const LoadProducts());
    } on FirebaseException catch (error) {
      emit(
        state.copyWith(exception: error.message),
      );
    }
  }

  void _navigateToAddProductsScreen(
    NavigateToAddProductsScreen event,
    Emitter<AdminPanelState> emit,
  ) {
    _appRouter.navigate(
      const AddProductScreenRoute(),
    );
  }

  void _navigateToCurrentScreen(
    NavigateToCurrentScreen event,
    Emitter<AdminPanelState> emit,
  ) {
    _appRouter.pop();
  }
}

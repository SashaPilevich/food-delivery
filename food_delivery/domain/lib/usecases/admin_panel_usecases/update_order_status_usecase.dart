import 'package:domain/domain.dart';

class UpdateOrderStatusUseCase implements FutureUseCase<UpdateOrderStatusParams, void> {
  final AdminPanelRepository _adminPanelRepository;

  const UpdateOrderStatusUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<void> execute(UpdateOrderStatusParams updateOrderStatusParams ) async {
    return _adminPanelRepository.updateOrderStatus(
      uid: updateOrderStatusParams.uid,
      isComplete: updateOrderStatusParams.isComplete,
    );
  }
}

class UpdateOrderStatusParams {
  final String uid;
  final bool isComplete;

  const UpdateOrderStatusParams({
    required this.uid,
    required this.isComplete,
  });
}

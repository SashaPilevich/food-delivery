import 'package:domain/domain.dart';

class UpdateProductUseCase implements FutureUseCase<DishModel, void> {
  final AdminPanelRepository _adminPanelRepository;

  const UpdateProductUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<void> execute(DishModel dishModel) async {
    return _adminPanelRepository.updateProduct(
      dishModel: dishModel,
    );
  }
}

import 'package:domain/domain.dart';

class AddProductUseCase implements FutureUseCase<DishModel, void> {
  final AdminPanelRepository _adminPanelRepository;

  AddProductUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<void> execute(DishModel dishModel) async {
    return _adminPanelRepository.addProduct(
      dishModel: dishModel,
    );
  }
}

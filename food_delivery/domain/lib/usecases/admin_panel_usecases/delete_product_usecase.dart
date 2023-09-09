import 'package:domain/domain.dart';

class DeleteProductUseCase implements FutureUseCase<String, void> {
  final AdminPanelRepository _adminPanelRepository;

  const DeleteProductUseCase(
      {required AdminPanelRepository adminPanelRepository})
      : _adminPanelRepository = adminPanelRepository;

  @override
  Future<void> execute(String id) async {
    await _adminPanelRepository.deleteProduct(id: id);
  }
}

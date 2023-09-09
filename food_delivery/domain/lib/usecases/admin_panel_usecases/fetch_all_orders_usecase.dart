import 'package:domain/domain.dart';

class FetchAllOrdersUseCase
    implements FutureUseCase<NoParams, List<OrderWithUserInfoModel>> {
  final AdminPanelRepository _adminPanelRepository;

  const FetchAllOrdersUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<List<OrderWithUserInfoModel>> execute(NoParams noParams) async {
    return _adminPanelRepository.fetchAllOrders();
  }
}

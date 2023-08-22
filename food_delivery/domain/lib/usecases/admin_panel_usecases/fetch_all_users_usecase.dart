import 'package:domain/domain.dart';

class FetchAllUsersUseCase implements FutureUseCase<NoParams, List<UserModel>> {
  final AdminPanelRepository _adminPanelRepository;

  const FetchAllUsersUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<List<UserModel>> execute(NoParams noParams) async {
    return _adminPanelRepository.fetchAllUsers();
  }
}

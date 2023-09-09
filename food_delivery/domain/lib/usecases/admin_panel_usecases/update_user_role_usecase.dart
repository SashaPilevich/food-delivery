import 'package:domain/domain.dart';

class UpdateUserRoleUseCase implements FutureUseCase<UpdateUserRoleParams, void> {
  final AdminPanelRepository _adminPanelRepository;

  const UpdateUserRoleUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<void> execute(UpdateUserRoleParams updateUserRoleParams) async {
    return _adminPanelRepository.updateUserRole(
      uid: updateUserRoleParams.uid,
      role:updateUserRoleParams.role,
    );
  }
}

class UpdateUserRoleParams {
  final String uid;
  final String role;

  const UpdateUserRoleParams({
    required this.uid,
    required this.role,
  });
}

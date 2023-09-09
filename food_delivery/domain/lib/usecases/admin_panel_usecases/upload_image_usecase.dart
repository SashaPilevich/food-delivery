import 'dart:io';

import 'package:domain/domain.dart';

class UploadImageUseCase implements FutureUseCase<File, String> {
  final AdminPanelRepository _adminPanelRepository;

  const UploadImageUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  @override
  Future<String> execute(File imageUrl) async {
    return _adminPanelRepository.uploadImage(
      imageUrl: imageUrl,
    );
  }
}

import 'package:core/core.dart';
import 'user_entity.dart';

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  int get typeId => 2;

  @override
  UserEntity read(BinaryReader reader) {
    final int fieldsCount = reader.readByte();
    Map<String, dynamic> data = {};
    for (int i = 0; i < fieldsCount; i++) {
      final String key = reader.readString();
      final value = reader.read();
      data[key] = value;
    }
    return UserEntity(
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      userName: data['userName'] ?? '',
      role: data['role'] ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer.writeByte(4);
    writer.writeString('uid');
    writer.write(obj.uid);
    writer.writeString('email');
    writer.write(obj.email);
    writer.writeString('userName');
    writer.write(obj.userName);
    writer.writeString('role');
    writer.write(obj.role);
  }
}

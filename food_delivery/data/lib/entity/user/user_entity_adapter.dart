import 'package:core/core.dart';
import 'user_entity.dart';

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  int get typeId => 2;

  @override
  UserEntity read(BinaryReader reader) {
    final fieldsCount = reader.readByte();
    Map<String, dynamic> data = {};
    for (int i = 0; i < fieldsCount; i++) {
      final key = reader.readString();
      final value = reader.read();
      data[key] = value;
    }
    return UserEntity(
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      userName: data['userName'] ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer.writeByte(3);
    writer.writeString('uid');
    writer.write(obj.uid);
    writer.writeString('email');
    writer.write(obj.email);
    writer.writeString('userName');
    writer.write(obj.userName);
  }
}

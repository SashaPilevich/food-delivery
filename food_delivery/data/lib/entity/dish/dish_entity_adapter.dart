import 'package:core/core.dart';
import 'dish_entity.dart';

class DishEntityAdapter extends TypeAdapter<DishEntity> {
  @override
  final typeId = 0;

  @override
  DishEntity read(BinaryReader reader) {
    final fieldsCount = reader.readByte();
    Map<String, dynamic> data = {};
    for (int i = 0; i < fieldsCount; i++) {
      final key = reader.readString();
      final value = reader.read();
      data[key] = value;
    }
    return DishEntity(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      cost: data['cost'] ?? 0,
      description: data['description'] ?? '',
      ingredients: List<String>.from(data['ingredients'] ?? []),
      category: data['category'] ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, DishEntity obj) {
    writer.writeByte(7);
    writer.writeString('id');
    writer.write(obj.id);
    writer.writeString('title');
    writer.write(obj.title);
    writer.writeString('imageUrl');
    writer.write(obj.imageUrl);
    writer.writeString('cost');
    writer.write(obj.cost);
    writer.writeString('description');
    writer.write(obj.description);
    writer.writeString('ingredients');
    writer.write(obj.ingredients);
    writer.writeString('category');
    writer.write(obj.category);
  }
}

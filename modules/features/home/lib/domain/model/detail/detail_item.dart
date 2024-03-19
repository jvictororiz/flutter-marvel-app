import 'package:home/ui/home/component/item_image_title.dart';
import 'package:home/ui/home/component/model/item_image_name_model.dart';

class DetailItem {
  int id;
  String name;
  String tagImage;
  String description;
  String urlImage;
  bool isCharacter;
  List<ItemImageTitleModel> items;

  DetailItem({
    this.id = -1,
    this.name = "",
    this.tagImage = "",
    this.description = "",
    this.urlImage = "",
    this.isCharacter = false,
    this.items = const [],
  });

  DetailItem copyWith({
    int? id,
    String? name,
    String? tagImage,
    String? description,
    String? urlImage,
    bool? isCharacter,
    List<ItemImageTitleModel>? items,
  }) {
    return DetailItem(
      id: id ?? this.id,
      name: name ?? this.name,
      tagImage: tagImage ?? this.tagImage,
      description: description ?? this.description,
      urlImage: urlImage ?? this.urlImage,
      isCharacter: isCharacter ?? this.isCharacter,
      items: items ?? this.items,
    );
  }
}

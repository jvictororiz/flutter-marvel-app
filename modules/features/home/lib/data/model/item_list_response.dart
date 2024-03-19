import 'item_summary_response.dart';

class ItemListResponse {
  int available;
  int returned;
  String collectionURI;
  List<ItemSummaryResponse> items;

  ItemListResponse({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'returned': returned,
      'collectionURI': collectionURI,
      'items': items,
    };
  }

  factory ItemListResponse.fromMap(Map<String, dynamic> map) {
    var items = map['items'] as List<dynamic>;
    return ItemListResponse(
      available: map['available'] as int,
      returned: map['returned'] as int,
      collectionURI: map['collectionURI'] as String,
      items: items.map((e) => ItemSummaryResponse.fromMap(e)).toList(growable: true),
    );
  }
}

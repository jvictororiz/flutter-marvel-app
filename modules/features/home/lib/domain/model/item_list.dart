import 'item_summary.dart';

class ItemList {
  int available;
  int returned;
  String collectionURI;
  List<ItemSummary> items;

  ItemList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });
}
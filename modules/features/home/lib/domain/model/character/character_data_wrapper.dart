import 'character_container.dart';

class CharacterDataWrapper {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  CharacterContainer data;
  String etag;

  CharacterDataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.data,
    required this.etag,
  });
}

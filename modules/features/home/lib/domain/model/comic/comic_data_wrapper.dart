import 'package:home/domain/model/comic/comic_container.dart';

class ComicDataWrapper {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  ComicContainer data;
  String etag;

  ComicDataWrapper({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.data,
    required this.etag,
  });
}

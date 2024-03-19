import 'comic_container_response.dart';

class ComicDataWrapperResponse {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  ComicContainerResponse data;
  String etag;

  ComicDataWrapperResponse({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.data,
    required this.etag,
  });


  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'copyright': copyright,
      'attributionText': attributionText,
      'attributionHTML': attributionHTML,
      'data': data,
      'etag': etag,
    };
  }

  factory ComicDataWrapperResponse.fromMap(Map<String, dynamic> map) {
    return ComicDataWrapperResponse(
      code: map['code'] as int,
      status: map['status'] as String,
      copyright: map['copyright'] as String,
      attributionText: map['attributionText'] as String,
      attributionHTML: map['attributionHTML'] as String,
      data: ComicContainerResponse.fromMap(map['data']) ,
      etag: map['etag'] as String,
    );
  }
}

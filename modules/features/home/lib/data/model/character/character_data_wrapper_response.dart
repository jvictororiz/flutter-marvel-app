import 'character_container_response.dart';

class CharacterDataWrapperResponse {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  CharacterContainerResponse data;
  String etag;

  CharacterDataWrapperResponse({
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

  factory CharacterDataWrapperResponse.fromMap(Map<String, dynamic> map) {
    return CharacterDataWrapperResponse(
      code: map['code'] as int,
      status: map['status'] as String,
      copyright: map['copyright'] as String,
      attributionText: map['attributionText'] as String,
      attributionHTML: map['attributionHTML'] as String,
      data: CharacterContainerResponse.fromMap(map['data']) ,
      etag: map['etag'] as String,
    );
  }
}

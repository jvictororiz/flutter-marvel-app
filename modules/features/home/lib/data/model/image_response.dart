class ImageModelResponse {
  String? extension;
  String? path;

  ImageModelResponse({
    required this.extension,
    required this.path,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': extension,
      'url': path,
    };
  }

  factory ImageModelResponse.fromMap(Map<String, dynamic> map) {
    return ImageModelResponse(
      extension: map['extension'],
      path: map['path'],
    );
  }
}

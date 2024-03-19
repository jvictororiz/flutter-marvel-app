class   ItemSummaryResponse {
  String resourceURI;
  String name;


  Map<String, dynamic> toMap() {
    return {
      'resourceURI': resourceURI,
      'name': name,
    };
  }

  factory ItemSummaryResponse.fromMap(Map<String, dynamic> map) {
    return ItemSummaryResponse(
      resourceURI: map['resourceURI'] as String,
      name: map['name'] as String,
    );
  }

  ItemSummaryResponse({
    required this.resourceURI,
    required this.name,
  });
}

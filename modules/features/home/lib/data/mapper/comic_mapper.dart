import 'package:home/data/model/comic/comic_container_response.dart';
import 'package:home/data/model/comic/comic_data_wrapper_response.dart';

import '../../domain/model/comic/comic.dart';
import '../../domain/model/comic/comic_container.dart';
import '../../domain/model/comic/comic_data_wrapper.dart';
import '../model/comic/comic_response.dart';
import '../model/image_response.dart';

class ComicMapper {
  ComicDataWrapper toComicModel(ComicDataWrapperResponse response) {
    return ComicDataWrapper(
      code: response.code,
      status: response.status,
      copyright: response.copyright,
      attributionText: response.attributionText,
      attributionHTML: response.attributionHTML,
      etag: response.etag,
      data: toComicContainerModel(response.data),
    );
  }

  ComicContainer toComicContainerModel(ComicContainerResponse response) {
    return ComicContainer(
      offset: response.offset,
      limit: response.limit,
      total: response.total,
      count: response.count,
      results: response.results.map((item) => toComic(item)).toList(growable: true),
    );
  }

  Comic toComic(ComicResponse response) {
    return Comic(
      id: response.id,
      title: response.title ?? "",
      description: response.description ?? "",
      urlImage: toImageModel(response.thumbnail),
    );
  }

  String toImageModel(ImageModelResponse response) {
    return "${response.path ?? ""}.${response.extension ?? ""}";
  }
}

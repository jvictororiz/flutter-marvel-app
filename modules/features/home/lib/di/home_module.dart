import 'package:api/api_configuration.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/data/repository/comic_repository.dart';
import 'package:home/domain/model/detail/detail_item.dart';
import 'package:home/domain/usecase/detai_usecase.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:home/ui/detail/page/detail_page.dart';

import '../data/datasource/character_service.dart';
import '../data/datasource/comic_service.dart';
import '../data/datasource/dio/character_dio.dart';
import '../data/datasource/dio/comic_dio.dart';
import '../data/mapper/character_mapper.dart';
import '../data/mapper/comic_mapper.dart';
import '../data/repository/character_repository.dart';
import '../ui/detail/controller/detail_controller.dart';
import '../ui/home/controller/home_controller.dart';
import '../ui/home/page/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(() => ApiConfiguration(i).getDio());

    i.add(() => CharacterMapper());
    i.add(() => CharacterRepository(i(), i(), i()));
    i.add<CharacterService>(() => CharacterDio(i()));

    i.add(() => ComicMapper());
    i.add(() => ComicRepository(i(), i(), i()));
    i.add<ComicService>(() => ComicDio(i()));

    i.add(() => HomeUseCase(i(), i()));
    i.add(() => DetailUseCase(i(), i()));

    i.add(() => HomeController(i(), i()));
    i.add(() => DetailController(i()));
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const HomePage());
    r.child("/detail", child: (_) {
      return DetailPage(detailItem: r.args.data);
    });
  }
}

import 'package:design_system/component/feedback_builder_component.dart';
import 'package:design_system/component/loading_content_component.dart';
import 'package:design_system/res/colors.dart';
import 'package:design_system/utils/controller_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/domain/model/character/character.dart';
import 'package:home/domain/model/comic/comic.dart';
import 'package:home/ui/home/component/item_character.dart';
import 'package:home/ui/home/controller/model/home_event.dart';
import 'package:home/ui/home/controller/model/home_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../component/item_image_title.dart';
import '../component/model/item_image_name_model.dart';
import '../component/shimmer_character.dart';
import '../component/shimmer_item_image_title.dart';
import '../controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Modular.get<HomeController>();

  final _scrollCharactersController = ScrollController();
  final _scrollComicsController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.init();
    configObservers();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return RxBuilder(builder: (context) {
      final state = _controller.state;
      final comics = state.comics;
      final characters = state.characters;
      return Scaffold(
          backgroundColor: CustomColors.primaryColor,
          appBar: _buildAppBar(state, context),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              controller: _scrollCharactersController,
              children: [
                const SizedBox(height: 20),
                const Text("Encontrar alguma coisa", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                SizedBox(
                    height: 50,
                    child: SearchBar(
                        hintText: "Procurar por conteúdo",
                        onSubmitted: (query) {
                          _controller.submitQuery(query);
                        })),
                const SizedBox(height: 40),
                const Text("Quadrinhos", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildScreenComics(state, comics),
                const SizedBox(height: 20),
                const Text("Personagens", style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildScreenCharacters(state, characters),
                Visibility(visible: characters.length > 6, child: Center(child: SizedBox(width: 100, child: LoadingAnimationWidget.newtonCradle(color: Colors.white70, size: 50)))),
              ],
            ),
          ));
    });
  }

  ScreenBuilderComponent _buildScreenComics(HomeState state, List<Comic> comics) {
    return ScreenBuilderComponent(
      isLoading: state.loadingComics,
      isSuccess: comics.isNotEmpty,
      isError: state.errorLoadComics,
      isEmpty: comics.isEmpty,
      loadingWidget: const ShimmerItemImageTitle(),
      errorWidget: const Center(),
      emptyWidget: const SizedBox(),
      successWidget: SizedBox(
        height: 160,
        child: ListView.builder(
            itemCount: comics.length + 1,
            scrollDirection: Axis.horizontal,
            controller: _scrollComicsController,
            itemBuilder: (context, index) {
              if (index == comics.length) {
                return SizedBox(width: 100, child: LoadingAnimationWidget.newtonCradle(color: Colors.white70, size: 50));
              }
              final currentItem = comics[index];
              return ItemImageTitle(
                  item: ItemImageTitleModel(
                    id: currentItem.id,
                    description: currentItem.description,
                    urlImage : currentItem.urlImage,
                    title: currentItem.title,
                    tag: currentItem.getTag(),
                  ),
                  onTap: () {
                    _controller.tapOnComic(currentItem);
                  });
            }),
      ),
    );
  }

  ScreenBuilderComponent _buildScreenCharacters(HomeState state, List<Character> characters) {
    return ScreenBuilderComponent(
        isLoading: state.loadingCharacters,
        isSuccess: characters.isNotEmpty,
        isError: state.errorLoadCharacters,
        isEmpty: characters.isEmpty,
        loadingWidget: const ShimmerCharacter(),
        errorWidget: const Center(),
        emptyWidget: const SizedBox(),
        successWidget: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 0.85,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 5,
          children: List.generate(characters.length, (index) {
            final currentItem = characters[index];
            return ItemCharacter(
              character: currentItem,
              onTap: () {
                _controller.tapOnCharacter(currentItem);
              },
            );
          }),
        ));
  }

  AppBar _buildAppBar(HomeState state, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CustomColors.primaryColor,
      title: Row(
        children: [
          Hero(
            tag: "logo",
            child: Image.asset('assets/images/marvel_logo.png', height: 15),
          ),
          const SizedBox(width: 20),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                state.email,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoadingContent(
            isLoading: state.loadingLogout,
            child: InkWell(
              customBorder: CircleBorder(),
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Atenção"),
                      content: const Text("Tem certeza que deseja se deslogar?"),
                      actions: [
                        CupertinoButton(
                          child: const Text(
                            "Sim",
                            style: TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {
                            _controller.logout();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future configObservers() async {
    _scrollCharactersController.addListener(() async {
      if (_scrollCharactersController.isFinalPage()) {
        _controller.getCharacters("", false);
      }
    });

    _scrollComicsController.addListener(() async {
      if (_scrollComicsController.isFinalPage()) {
        _controller.getComics("", false);
      }
    });

    _controller.event.addListener(() {
      final currentEvent = _controller.event.value;

      if (currentEvent is GoToLogin) {
        Modular.to.popAndPushNamed("../", forRoot: true);
      }
      if (currentEvent is GoToDetail) {
        Modular.to.pushNamed("./detail", arguments: currentEvent.detailItem);
      }
    });
  }
}

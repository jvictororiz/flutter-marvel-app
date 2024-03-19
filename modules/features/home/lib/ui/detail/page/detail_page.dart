import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_system/component/feedback_builder_component.dart';
import 'package:design_system/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/domain/model/detail/detail_item.dart';
import 'package:home/ui/detail/component/gradient_image.dart';
import 'package:home/ui/home/component/item_image_title.dart';
import 'package:home/ui/home/component/shimmer_item_image_title.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../controller/detail_controller.dart';

class DetailPage extends StatefulWidget {
  final DetailItem detailItem;

  const DetailPage({super.key, required this.detailItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DetailController _controller = Modular.get<DetailController>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));

    _controller.init(widget.detailItem);
    configObservers();
  }

  @override
  Widget build(BuildContext context) {
    const double heightImage = 400;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: CustomColors.primaryColor,
        body: RxBuilder(builder: (context) {
          final state = _controller.state;
          final detailItem = state.detailItem ?? widget.detailItem;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              GradientImage(
                height: heightImage,
                child: Hero(
                  tag: detailItem.tagImage,
                  child: CachedNetworkImage(
                    height: heightImage,
                    imageUrl: detailItem.urlImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  detailItem.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Visibility(
                visible: detailItem.description.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
                  child: Text(
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    detailItem.description,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  state.titleBottomList,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              ScreenBuilderComponent(
                isLoading: state.loading,
                isSuccess: detailItem.items.isNotEmpty,
                isError: state.isError,
                isEmpty: detailItem.items.isEmpty,
                loadingWidget: const ShimmerItemImageTitle(),
                errorWidget: const Center(),
                emptyWidget: const SizedBox(),
                successWidget: SizedBox(
                  height: 160,
                  child: ListView.builder(
                      itemCount: detailItem.items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final currentItem = detailItem.items[index];
                        return ItemImageTitle(
                            item: currentItem,
                            onTap: () {
                              var detail = DetailItem(
                                id: currentItem.id,
                                name: currentItem.title,
                                tagImage: currentItem.tag,
                                description: currentItem.description,
                                urlImage: currentItem.urlImage,
                                isCharacter: !detailItem.isCharacter,
                                items: [],
                              );
                              Modular.to.pushNamed("./detail", arguments: detail);
                            });
                      }),
                ),
              ),
              SizedBox(height: 20)
            ],
          );
        }));
  }

  Future configObservers() async {
    _controller.event.addListener(() {
      final currentEvent = _controller.event.value;
    });
  }
}

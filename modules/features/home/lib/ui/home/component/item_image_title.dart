import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'model/item_image_name_model.dart';

class ItemImageTitle extends StatelessWidget {
  final ItemImageTitleModel item;
  final VoidCallback? onTap;

  const ItemImageTitle({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    CachedNetworkImage imageComponent = CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: item.urlImage,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            width: 110,
            height: 120,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(25),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Hero(
                    tag: item.tag,
                    child: imageComponent,
                  )),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: SizedBox(
                width: 110,
                child: Text(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  item.title,
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

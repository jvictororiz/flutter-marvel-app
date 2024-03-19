import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home/domain/model/character/character.dart';

class ItemCharacter extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;

  const ItemCharacter({super.key, required this.character, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          width: 220,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: onTap,
              child: Hero(
                tag: character.getTag(),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: character.urlImage,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          character.name,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        )
      ],
    );
  }
}

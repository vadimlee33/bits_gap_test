import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entity/character.dart';
import 'favorite_button_widget.dart';

class CharacterCardWidget extends StatelessWidget {
  final Character character;
  final bool isFavorite;
  final VoidCallback onFavoriteButtonTap;
  const CharacterCardWidget(
      {super.key,
      required this.character,
      required this.isFavorite,
      required this.onFavoriteButtonTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/character/${character.id}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: character.image!,
                    width: double.infinity,
                    height: 160.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: FavoriteButtonWidget(
                    isFavorite: isFavorite,
                    onTap: onFavoriteButtonTap,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                character.name!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

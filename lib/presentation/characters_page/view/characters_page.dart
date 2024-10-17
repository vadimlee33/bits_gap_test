import 'package:bitsgap_test_app/presentation/characters_page/store/character_store.dart';
import 'package:bitsgap_test_app/core/theme/app_colors.dart';
import 'package:bitsgap_test_app/presentation/characters_page/widgets/character_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CharactersPage extends StatelessWidget {
  final CharacterStore store;

  const CharactersPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.isLoading && store.currentPage == 1) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.irisBlue,
            ));
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!store.isLoading &&
                  store.hasNextPage &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                store.fetchCharacters();
              }
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: store.characters.length,
                      itemBuilder: (context, index) {
                        final character = store.characters[index];
                        return Observer(
                          builder: (_) => CharacterCardWidget(
                            character: character,
                            isFavorite: store.isFavorite(character.id!),
                            onFavoriteButtonTap: () {
                              store.toggleFavorite(character.id!);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  if (store.isLoading)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.irisBlue,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

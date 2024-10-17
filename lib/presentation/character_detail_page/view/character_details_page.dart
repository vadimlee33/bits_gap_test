import 'package:bitsgap_test_app/core/utils/extensions.dart';
import 'package:bitsgap_test_app/core/widgets/custom_app_bar.dart';
import 'package:bitsgap_test_app/presentation/character_detail_page/widgets/information_row_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bitsgap_test_app/presentation/character_detail_page/store/character_details_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../domain/entity/character.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/enums.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterDetailsStore store;
  final int characterId;

  const CharacterDetailsPage(
      {super.key, required this.store, required this.characterId});

  @override
  Widget build(BuildContext context) {
    store.fetchCharacterDetails(characterId);
    return Scaffold(
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              if (!store.isLoading && store.character == null)
                const Center(child: Text('Character not found')),
              store.isLoading
                  ? const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.irisBlue))
                  : store.character != null
                      ? Positioned.fill(
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: store.character!.image!,
                                width: double.infinity,
                                height: 260,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: _buildCharacterInfo(store.character!),
                              )
                            ],
                          ),
                        )
                      : Container(),
              const CustomAppBar()
            ],
          );
        },
      ),
    );
  }

  Widget _buildCharacterInfo(Character character) {
    return Column(
      children: [
        InformationRowWidget(
          key: const Key('name_info'),
          informationType: "Name",
          icon: AppIcons.informationIcon(),
          text: character.name!,
        ),
        _buildGenderInfo(GenderExtension.fromString(character.gender!)),
        _buildStatusInfo(StatusExtension.fromString(character.status!)),
        _buildSpeciesInfo(SpeciesExtension.fromString(character.species!)),
      ],
    );
  }

  Widget _buildGenderInfo(Gender gender) {
    return InformationRowWidget(
      key: const Key('gender_info'),
      icon: gender.icon,
      text: gender.name,
      informationType: "Gender",
    );
  }

  Widget _buildStatusInfo(Status status) {
    return InformationRowWidget(
      key: const Key('status_info'),
      icon: status.icon,
      text: status.name,
      informationType: "Status",
    );
  }

  Widget _buildSpeciesInfo(Species species) {
    return InformationRowWidget(
      key: const Key('species_info'),
      icon: species.icon,
      text: species.name,
      informationType: "Species",
    );
  }
}

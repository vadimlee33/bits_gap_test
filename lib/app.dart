import 'package:bitsgap_test_app/presentation/characters_page/view/characters_page.dart';
import 'package:bitsgap_test_app/presentation/character_detail_page/store/character_details_store.dart';
import 'package:bitsgap_test_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/character_detail_page/view/character_details_page.dart';
import 'service_locator.dart' as di;
import 'presentation/characters_page/store/character_store.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) =>
              CharactersPage(store: di.getIt<CharacterStore>()),
        ),
        GoRoute(
          path: '/character/:id',
          builder: (context, state) {
            final characterId = int.parse(state.pathParameters['id']!);
            return CharacterDetailsPage(
              store: di.getIt<CharacterDetailsStore>(),
              characterId: characterId,
            );
          },
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';
import 'package:sms_project/view/login_page/login_page.dart';
import 'package:sms_project/view/login_page/login_page_view_model.dart';

import 'di/get_it.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/login_page',
  navigatorKey: _rootNavigatorKey,
  routes: [
    // GoRoute(
    //   path: '/splash_page',
    //   builder: (context, state) => const SplashPage(),
    // ),
    GoRoute(
      path: '/login_page',
      builder: (context, state) {
        return ChangeNotifierProvider(create: (_) => getIt<LoginPageViewModel>(),
        child: const LoginPage());
      },
      routes: [
        GoRoute(
          path: 'signup_page',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: 'change_password_page',
          builder: (context, state) => const LoginPage(),
        ),
      ]
    ),

    // ShellRoute(
    //     navigatorKey: _shellNavigatorKey,
    //     pageBuilder: (context, state, child) {
    //       return NoTransitionPage(
    //         child: MultiProvider(
    //           providers: [
    //             ChangeNotifierProvider(
    //               create: (_) => getIt<NavigationPageViewModel>(),
    //             ),
    //             ChangeNotifierProvider(
    //               create: (_) => getIt<DaySentencePageViewModel>(),
    //             ),
    //             ChangeNotifierProvider(
    //               create: (_) => getIt<QuizPageViewModel>(),
    //             ),
    //             ChangeNotifierProvider(
    //               create: (_) => getIt<WordSearchPageViewModel>(),
    //             ),
    //             ChangeNotifierProvider(
    //               create: (_) => getIt<MyFavoritePageViewModel>(),
    //             ),
    //             ChangeNotifierProvider(
    //               create: (_) => getIt<SettingPageViewModel>(),
    //             ),
    //           ],
    //           child: ScaffoldWithNavBar(
    //             location: state.matchedLocation,
    //             child: child,
    //           ),
    //         ),
    //       );
    //     },
    //     routes: [
    //       GoRoute(
    //         path: '/day_sentence_page',
    //         builder: (context, state) {
    //           final navigationViewModel =
    //               Provider.of<NavigationPageViewModel>(context, listen: false);
    //           return ChangeNotifierProvider(
    //             create: (_) => getIt<DaySentencePageViewModel>(),
    //             child: DaySentencePage(
    //               resetNavigation: navigationViewModel.resetNavigation,
    //             ),
    //           );
    //         },
    //       ),
    //       GoRoute(
    //         path: '/quiz_page',
    //         builder: (context, state) {
    //           final navigationViewModel =
    //               Provider.of<NavigationPageViewModel>(context, listen: false);
    //           return ChangeNotifierProvider(
    //             create: (_) => getIt<QuizPageViewModel>(),
    //             child: QuizPage(
    //               resetNavigation: navigationViewModel.resetNavigation,
    //             ),
    //           );
    //         },
    //       ),
    //       GoRoute(
    //         path: '/word_search_page',
    //         builder: (context, state) {
    //           final navigationViewModel =
    //               Provider.of<NavigationPageViewModel>(context, listen: false);
    //           return ChangeNotifierProvider(
    //             create: (_) => getIt<WordSearchPageViewModel>(),
    //             child: WordSearchPage(
    //               resetNavigation: navigationViewModel.resetNavigation,
    //             ),
    //           );
    //         },
    //       ),
    //       GoRoute(
    //         path: '/my_favorite_page',
    //         builder: (context, state) {
    //           final navigationViewModel =
    //               Provider.of<NavigationPageViewModel>(context, listen: false);
    //           return ChangeNotifierProvider(
    //             create: (_) => getIt<MyFavoritePageViewModel>(),
    //             child: MyFavoritePage(
    //               resetNavigation: navigationViewModel.resetNavigation,
    //             ),
    //           );
    //         },
    //         routes: [
    //           GoRoute(
    //             path: 'my_sentences_page',
    //             builder: (context, state) {
    //               final extra = state.extra! as Map<String, dynamic>;
    //               return ChangeNotifierProvider(
    //                 create: (_) => getIt<MyFavoritePageViewModel>(),
    //                 child: MySentencesPage(
    //                     mySentencesItems: extra['mySentencesItems']),
    //               );
    //             },
    //           ),
    //           GoRoute(
    //             path: 'my_quiz_page',
    //             builder: (context, state) {
    //               final extra = state.extra! as Map<String, dynamic>;
    //               return ChangeNotifierProvider(
    //                 create: (_) => getIt<MyFavoritePageViewModel>(),
    //                 child: MyQuizPage(myQuizItems: extra['myQuizItems']),
    //               );
    //             },
    //           ),
    //           GoRoute(
    //             path: 'my_search_page',
    //             builder: (context, state) {
    //               final extra = state.extra! as Map<String, dynamic>;
    //               return ChangeNotifierProvider(
    //                 create: (_) => getIt<MyFavoritePageViewModel>(),
    //                 child:
    //                     MySearchPage(mySearchesItems: extra['mySearchesItems']),
    //               );
    //             },
    //           ),
    //         ],
    //       ),
    //       GoRoute(
    //         path: '/setting_page',
    //         builder: (context, state) {
    //           final navigationViewModel =
    //               Provider.of<NavigationPageViewModel>(context, listen: false);
    //           return ChangeNotifierProvider(
    //             create: (_) {
    //               return getIt<SettingPageViewModel>();
    //             },
    //             child: SettingPage(
    //               resetNavigation: navigationViewModel.resetNavigation,
    //             ),
    //           );
    //         },
    //       ),
    //     ]),
  ],
);

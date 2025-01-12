import 'dart:async';
import 'dart:core';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../data/repository/connectivity_observer.dart';
import '../../data/repository/network_connectivity_observer.dart';
import '../../utils/one_answer_dialog.dart';
import '../../utils/simple_logger.dart';
import '../pages/find_WG_page/find_WG_page_view_model.dart';
import '../pages/my_history_page/my_history_page_view_model.dart';
import '../pages/setting_page/setting_page_view_model.dart';
import '../pages/upload_WG_page/upload_WG_page_view_model.dart';
import 'navigation_bar_page_view_model.dart';

class NavigationBarPage extends StatefulWidget {
  final String location;

  const NavigationBarPage(
      {super.key, required this.child, required this.location});

  final Widget child;

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  final ConnectivityObserver _connectivityObserver =
      NetworkConnectivityObserver();
  Status _status = Status.available;
  StreamSubscription<Status>? _subscription;
  bool _isDialogShowing = false;

  @override
  void initState() {
    super.initState();
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    try {
      // 초기 연결 상태 확인
      await Future.delayed(const Duration(milliseconds: 500));

      if (mounted) {
        final viewModel = context.read<NavigationBarPageViewModel>();
        await viewModel.generateDocId();
      }

      // 초기 상태 확인 및 타입 처리
      final results = await Connectivity().checkConnectivity();
      final hasConnection = results.any((result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile);
      _status = hasConnection ? Status.available : Status.unavailable;

      if (!mounted) return;

      // 상태 변화 모니터링 시작
      _subscription = _connectivityObserver.observe().listen(
        (status) {
          if (!mounted) return;

          setState(() {
            if (_status != status) {
              _status = status;
              _handleConnectivityChange();
            }
          });
        },
        onError: (error) {
          logger.info('Connectivity subscription error: $error');
        },
      );
    } catch (e) {
      logger.info('Connectivity initialization error: $e');
    }
  }

  void _handleConnectivityChange() {
    if (_status == Status.unavailable && !_isDialogShowing) {
      _isDialogShowing = true;
      showConnectionErrorDialog();
    } else if (_status == Status.available && _isDialogShowing) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
        _isDialogShowing = false;
      }
    }
  }

  void showConnectionErrorDialog() {
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OneAnswerDialog(
          onTap: () {
            _isDialogShowing = false;
            Navigator.pop(context);
          },
          title: 'CHECK WIFI',
          firstButton: 'OK',
          imagePath: 'assets/gifs/internetLost.gif',
        );
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NavigationBarPageViewModel>();
    final findWGPageViewModel = context.watch<FindWGPageViewModel>();
    final uploadWGPageViewModel = context.watch<UploadWGPageViewModel>();
    final favoritesViewModel = context.watch<MyHistoryPageViewModel>();
    final settingPageViewModel = context.watch<SettingPageViewModel>();
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          padding: const EdgeInsets.only(top: 12),
          iconSize: 25,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.Default,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(BootstrapIcons.house_door),
            selectedIcon: const Icon(BootstrapIcons.house_door_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            title: const Text(
              'Find WG',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
          BottomBarItem(
            icon: const Icon(BootstrapIcons.cloud_plus),
            selectedIcon: const Icon(BootstrapIcons.cloud_plus_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            title: const Text(
              'Upload WG',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
          BottomBarItem(
            icon: const Icon(BootstrapIcons.bookmark_check),
            selectedIcon: const Icon(BootstrapIcons.bookmark_check_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            showBadge: viewModel.badgeValue,
            badgeColor: Colors.transparent,
            badge: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            title: const Text(
              'HISTORY',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
          BottomBarItem(
            icon: const Icon(BootstrapIcons.gear),
            selectedIcon: const Icon(BootstrapIcons.gear_fill),
            selectedColor: const Color(0xFF088395),
            unSelectedColor: CupertinoColors.black,
            title: const Text(
              'SETTING',
              style: TextStyle(fontFamily: 'KoPub', fontSize: 10),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFEBF4F6),
        elevation: 0,
        currentIndex: widget.location.contains('/find_WG_page')
            ? 0
            : widget.location.contains('/upload_WG_page')
                ? 1
                : widget.location.contains('/history_page')
                    ? 2
                    : 3,
        onTap: (int index) {
          if (_status == Status.unavailable) {
            showConnectionErrorDialog();
          } else {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            _goOtherTab(context, index, viewModel.resetNavigation);
          }
        },
      ),
    );
  }

  void _goOtherTab(
      BuildContext context, int index, Function resetNavigation) async {
    // if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    List<String> locations = [
      '/find_WG_page',
      '/upload_WG_page',
      '/history_page',
      '/setting_page'
    ];
    String? location = locations[index];
    router.go(location);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final yourLangCheck = prefs.getString('selected_language');
    // final targetLangCheck = prefs.getString('target_language');
    // if (yourLangCheck == null || targetLangCheck == null) {
    //   if (context.mounted) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('Please complete the settings.'),
    //         duration: Duration(seconds: 2),
    //       ),
    //     );
    //   }
    // } else {
    //   if (index == 3) {
    //     router.go(location);
    //     await resetFavorites();
    //   } else {
    //     router.go(location);
    //   }
    // }
  }
}

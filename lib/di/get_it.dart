import 'package:get_it/get_it.dart';

import '../view/navigation/navigation_bar_page_view_model.dart';
import '../view/pages/find_WG_page/find_WG_page_view_model.dart';
import '../view/pages/login_page/login_page_view_model.dart';
import '../view/pages/my_history_page/my_history_page_view_model.dart';
import '../view/pages/setting_page/setting_page_view_model.dart';
import '../view/pages/upload_WG_page/upload_WG_page_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Repository

  // use case

  // ViewModel
  getIt
    ..registerFactory<LoginPageViewModel>(() => LoginPageViewModel())
    ..registerFactory<NavigationBarPageViewModel>(() => NavigationBarPageViewModel())
    ..registerFactory<FindWGPageViewModel>(() => FindWGPageViewModel())
    ..registerFactory<UploadWGPageViewModel>(() => UploadWGPageViewModel())
    ..registerFactory<MyHistoryPageViewModel>(() => MyHistoryPageViewModel())
    ..registerFactory<SettingPageViewModel>(() => SettingPageViewModel())
    ;
}

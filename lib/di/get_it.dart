import 'package:get_it/get_it.dart';
import 'package:sms_project/view/login_page/login_page_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Repository


  // use case


  // ViewModel
  getIt
    .registerFactory<LoginPageViewModel>(() => LoginPageViewModel())
    ;
}

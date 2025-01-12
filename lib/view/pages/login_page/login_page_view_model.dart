import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page_state.dart';

SharedPreferences? prefs;

class LoginPageViewModel with ChangeNotifier {
  // final UserRepository userRepository;

  // LoginPageViewModel({
  //   required this.userRepository,
  // });

  LoginPageState _state = const LoginPageState();

  LoginPageState get state => _state;

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  //
  // Future signIn(String? id, String? password, BuildContext context) async {
  //   try {
  //     // 아이디로 유저정보를 우선 확인
  //     int recreatedCount = 0;
  //     final currentUser = await userRepository.getFirebaseUserData(id!);
  //     if (currentUser.isNotEmpty) {
  //       recreatedCount = currentUser.first.recreatCount;
  //     }
  //     // await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     //     email: '$recreatedCount.$id@gmail.com', password: password!);
  //     if (context.mounted) {
  //       prefs!.setString('_email', '$recreatedCount.$id@gmail.com');
  //       if (context.mounted) {
  //         showDialog(
  //             context: context,
  //             builder: (context) {
  //               return OneAnswerDialog(
  //                   onTap: () {
  //                     Navigator.pop(context);
  //                   },
  //                   title: '안녕하세요, ${currentUser.first.name} 고객님',
  //                   subtitle: (currentUser.first.lastCouponCount <
  //                           currentUser.first.coupons.length)
  //                       ? '새 쿠폰이 지급되었습니다!!'
  //                       : '로그인 되었습니다.',
  //                   firstButton: '확인',
  //                   imagePath: 'assets/gifs/success.gif');
  //             });
  //         await userRepository.renewCouponCount(currentUser.first.id);
  //       }
  //       context.go('/main_page');
  //     }
  //   } catch (e) {
  //     if (context.mounted) {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             logger.info('에러:$e');
  //             return OneAnswerDialog(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 title: '알림',
  //                 subtitle: '정보가 없습니다.',
  //                 firstButton: '확인',
  //                 imagePath: 'assets/gifs/alert.gif');
  //           });
  //     }
  //   }
  // }

  Future<String> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    String idMemory = prefs!.getString('_email') ?? '';
    return idMemory;
  }
}

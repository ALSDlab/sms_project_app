import 'package:fms_project/data/core/result.dart';
import 'package:fms_project/domain/model/user_data_model.dart';
import 'package:fms_project/domain/repository/user_data_repository.dart';

class UserDataReporitoryImpl implements UserDataRepository {
  @override
  Future<Result<void>> createUserData(String email, String password) {
    // TODO: implement createUserData
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteUserData(String email) {
    // TODO: implement deleteUserData
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> editUserPassword(String email) {
    // TODO: implement editUserPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDataModel>> getFirebaseUserData(String email) {
    // TODO: implement getFirebaseUserData
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signUpWithApple() {
    // TODO: implement signUpWithApple
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signUpWithFacebook() {
    // TODO: implement signUpWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signUpWithGoogle() {
    // TODO: implement signUpWithGoogle
    throw UnimplementedError();
  }
  
}
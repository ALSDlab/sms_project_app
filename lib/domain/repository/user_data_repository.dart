
import '../../data/core/result.dart';
import '../model/user_data_model.dart';

abstract interface class UserDataRepository {
  Future<Result<UserDataModel>> getFirebaseUserData(String email);

  Future<Result<void>> createUserData(String email, String password);

  Future<Result<void>> editUserPassword(String email);

  Future<Result<void>> deleteUserData(String email);

  Future<Result<void>> signUpWithGoogle();

  Future<Result<void>> signUpWithFacebook();

  Future<Result<void>> signUpWithApple();






}

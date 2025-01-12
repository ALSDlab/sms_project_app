import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'user_data_model.freezed.dart';

part 'user_data_model.g.dart';

@freezed
class UserDataModel with _$UserDataModel {
  const factory UserDataModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'signUpDate') required String signUpDate,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'isSignOut') required bool deleted,
    @JsonKey(name: 'signOutDate') required String signOutDate,


  }) = _UserDataModel;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);
}
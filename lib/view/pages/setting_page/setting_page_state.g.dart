// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_page_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingPageStateImpl _$$SettingPageStateImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingPageStateImpl(
      tapped: json['tapped'] as bool? ?? false,
      selectedLanguage: json['selectedLanguage'] as String? ?? '',
      targetLanguage: json['targetLanguage'] as String? ?? '',
      selectedLevel: json['selectedLevel'] as String? ?? '',
    );

Map<String, dynamic> _$$SettingPageStateImplToJson(
        _$SettingPageStateImpl instance) =>
    <String, dynamic>{
      'tapped': instance.tapped,
      'selectedLanguage': instance.selectedLanguage,
      'targetLanguage': instance.targetLanguage,
      'selectedLevel': instance.selectedLevel,
    };

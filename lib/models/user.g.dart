// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['uid'] as String,
      json['displayName'] as String,
      json['email'] as String,
      json['company'] as String,
      json['photoURL'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'company': instance.company,
      'photoURL': instance.photoURL
    };

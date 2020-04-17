// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberIndex _$MemberIndexFromJson(Map<String, dynamic> json) {
  return MemberIndex(
    json['member_id'] as String,
    json['mobile'] as String,
    json['username'] as String,
    json['office'] as String,
    json['thumb'] as String,
    json['club_id'] as String,
    json['club_name'] as String,
    json['club_status'] as String,
    json['business_type'] as String,
    json['weixin_pic'] as String,
    json['role'] as String,
    json['member_order'] == null
        ? null
        : MemberOrder.fromJson(json['member_order'] as Map<String, dynamic>),
    json['kefu_mobile'] as String,
  );
}

Map<String, dynamic> _$MemberIndexToJson(MemberIndex instance) =>
    <String, dynamic>{
      'member_id': instance.memberId,
      'mobile': instance.mobile,
      'username': instance.username,
      'office': instance.office,
      'thumb': instance.thumb,
      'club_id': instance.clubId,
      'club_name': instance.clubName,
      'club_status': instance.clubStatus,
      'business_type': instance.businessType,
      'weixin_pic': instance.weixinPic,
      'role': instance.role,
      'member_order': instance.memberOrder,
      'kefu_mobile': instance.kefuMobile,
    };

MemberOrder _$MemberOrderFromJson(Map<String, dynamic> json) {
  return MemberOrder(
    json['id'] as String,
    json['title'] as String,
    json['create_at'] as String,
    json['pay_at'] as String,
    json['start_time'] as String,
    json['end_time'] as String,
    json['club_id'] as String,
    json['is_vip'] as String,
  );
}

Map<String, dynamic> _$MemberOrderToJson(MemberOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'create_at': instance.createAt,
      'pay_at': instance.payAt,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'club_id': instance.clubId,
      'is_vip': instance.isVip,
    };

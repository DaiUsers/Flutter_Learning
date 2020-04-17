import 'package:json_annotation/json_annotation.dart'; 
  
part 'member_index.g.dart';


@JsonSerializable()
  class MemberIndex extends Object {

  @JsonKey(name: 'member_id')
  String memberId;

  @JsonKey(name: 'mobile')
  String mobile;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'office')
  String office;

  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'club_id')
  String clubId;

  @JsonKey(name: 'club_name')
  String clubName;

  @JsonKey(name: 'club_status')
  String clubStatus;

  @JsonKey(name: 'business_type')
  String businessType;

  @JsonKey(name: 'weixin_pic')
  String weixinPic;

  @JsonKey(name: 'role')
  String role;

  @JsonKey(name: 'member_order')
  MemberOrder memberOrder;

  @JsonKey(name: 'kefu_mobile')
  String kefuMobile;

  MemberIndex(this.memberId,this.mobile,this.username,this.office,this.thumb,this.clubId,this.clubName,this.clubStatus,this.businessType,this.weixinPic,this.role,this.memberOrder,this.kefuMobile);

  factory MemberIndex.fromJson(Map<String, dynamic> srcJson) => _$MemberIndexFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MemberIndexToJson(this);
}

  
@JsonSerializable()
  class MemberOrder extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'create_at')
  String createAt;

  @JsonKey(name: 'pay_at')
  String payAt;

  @JsonKey(name: 'start_time')
  String startTime;

  @JsonKey(name: 'end_time')
  String endTime;

  @JsonKey(name: 'club_id')
  String clubId;

  @JsonKey(name: 'is_vip')
  String isVip;

  MemberOrder(this.id,this.title,this.createAt,this.payAt,this.startTime,this.endTime,this.clubId,this.isVip);

  factory MemberOrder.fromJson(Map<String, dynamic> srcJson) => _$MemberOrderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MemberOrderToJson(this);
}

  

import 'package:tencent_cloud_chat_sdk/web/compatible_models/v2_tim_group_member_info.dart';

class NoticeMessageListenner {
  String listennerName;
  String groupID;
  late V2TimGroupMemberInfo opUser = V2TimGroupMemberInfo(
      faceUrl: '', userID: '', nickName: '', nameCard: '', friendRemark: '');
  late bool isAgreeJoin;
  late String opReason;
  late String customData;
  int? recvOpt;

  NoticeMessageListenner(
      {required this.listennerName,
      required this.groupID,
      this.isAgreeJoin = false,
      required this.opUser,
      this.customData = '',
      this.recvOpt,
      this.opReason = ''});
}

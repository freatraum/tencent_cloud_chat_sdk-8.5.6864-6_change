import 'v2_tim_user_info.dart';
import 'package:tencent_cloud_chat_sdk/utils/utils.dart';

/// V2TimRecvC2cTextMessage
///
/// {@category Models}
///
class V2TimRecvC2cTextMessage {
  late String msgID;
  late V2TimUserInfo sender;
  late String? text;

  V2TimRecvC2cTextMessage({
    required this.msgID,
    required this.sender,
    this.text,
  });

  V2TimRecvC2cTextMessage.fromJson(Map json) {
    json = Utils.formatJson(json);
    msgID = json['msgID'] ?? '';
    sender = V2TimUserInfo.fromJson(json['sender'] ?? {});
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msgID'] = msgID;
    data['sender'] = sender.toJson();
    data['text'] = text;
    return data;
  }
  String toLogString() {
    String res = "msgID:$msgID|sender:${sender.toLogString()}|text:$text";
    return res;
  }
}
// {
//   "msgID":"",
//   "sender":{},
//   "text":""
// }

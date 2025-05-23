import 'package:tencent_cloud_chat_sdk/utils/utils.dart';

/// V2TimConversationOperationResult
///
/// {@category Models}
///
class V2TimConversationOperationResult {
  String? conversationID;
  int? resultCode;
  String? resultInfo;

  V2TimConversationOperationResult({
    this.conversationID,
    this.resultCode,
    this.resultInfo,
  });

  V2TimConversationOperationResult.fromJson(Map json) {
    json = Utils.formatJson(json);
    conversationID = json['conversation_operation_result_conversation_id'] ?? '';
    resultCode = json['conversation_operation_result_result_code'];
    resultInfo = json['conversation_operation_result_result_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['conversationID'] = conversationID;
    data['resultCode'] = resultCode;
    data['resultInfo'] = resultInfo;

    return data;
  }
  String toLogString() {
    String res = "conversationID:$conversationID|resultCode:$resultCode|resultInfo:$resultInfo";
    return res;
  }
}

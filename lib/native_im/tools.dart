import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

class Tools {
  static int _userDataSeq = 0;

  static String generateUserData(String apiName) {
    String userData = "";
    if (apiName.isNotEmpty) {
      ++_userDataSeq;
      userData = "$apiName-$_userDataSeq";
    } else {
      throw "get userData error";
    }
    return userData;
  }

  static ffi.Pointer<ffi.Char> string2PointerChar(String data) {
    return data.toNativeUtf8().cast<ffi.Char>();
  }

  static String pointerChar2String(ffi.Pointer<ffi.Char> data) {
    return data.cast<Utf8>().toDartString();
  }

  static ffi.Pointer<ffi.Void> string2PointerVoid(String data) {
    return data.toNativeUtf8().cast<ffi.Void>();
  }

  static List<Map<String, dynamic>> map2JsonList(Map<String, dynamic> originalMap, String key, String value) {
    return originalMap.entries.map((entry) => {key: entry.key, value: entry.value}).toList();
  }

  static Map<String, T> jsonList2Map<T>(List<Map<String, dynamic>>? jsonList, String key, String value) {
  Map<String, T> resultMap = {};
  
  // 检查输入列表是否为空
  if (jsonList == null || jsonList.isEmpty) {
    return resultMap;
  }
  
  // 检查key和value参数是否为空
  if (key.isEmpty || value.isEmpty) {
    return resultMap;
  }
  
  for (var item in jsonList) {
    // 检查item是否为空
    if (item == null) {
      continue;
    }
    
    // 检查item是否包含指定的key和value
    if (!item.containsKey(key) || !item.containsKey(value)) {
      continue;
    }
    
    // 检查key对应的值是否为String类型且不为空
    final keyValue = item[key];
    if (keyValue == null || keyValue is! String || keyValue.isEmpty) {
      continue;
    }
    
    // 检查value对应的值是否为指定类型T且不为空
    final valueValue = item[value];
    if (valueValue == null || valueValue is! T) {
      continue;
    }
    
    resultMap[keyValue] = valueValue;
  }
  
  return resultMap;
}
}

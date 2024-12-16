import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

abstract class FFAppConstants {
  static const String baseUrl =
      'http://rbnews-stage.ap-south-1.elasticbeanstalk.com';
  static Map<String, DebugDataField> toDebugSerializableMap() => {
        'baseUrl': debugSerializeParam(
          baseUrl,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/r-b-news-k9jlh3?tab=appValues&appValuesTab=constant',
          searchReference:
              'reference=EhcKEQoHYmFzZVVybBIGcm1kNXNzcgIIA1oHYmFzZVVybA==',
          name: 'String',
          nullable: false,
        )
      };
}

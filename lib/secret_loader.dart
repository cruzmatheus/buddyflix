import 'dart:convert';

import 'package:buddyflix/secrets.dart';
import 'package:flutter/services.dart';

class SecretLoader {
  final String secretPath;

  SecretLoader({this.secretPath});

  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(this.secretPath,
        (jsonStr) async {
      return Secret.fromJson(json.decode(jsonStr));
    });
  }
}

import 'country_list_screen.dart';
import 'package:elementary/elementary.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart' show timeDilation;

/// Model for [CountryListScreen]
class CountryListScreenModel extends ElementaryModel {
  CountryListScreenModel(
    ErrorHandler errorHandler, // Обработка ошибок
  ) : super(errorHandler: errorHandler);
  Future<String> loadStringState() async {
    try {
      final res = 'error';
      //timeDilation = 30.0;
      return res;
    }
    on Exception catch (e) {
      handleError(e);
      rethrow;
    }
  }
}

import 'app_typography.dart';
import 'country_list_screen.dart';
import 'country_list_screen_model.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

CountryListScreenWidgetModel countryListScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = context.read<CountryListScreenModel>();//Считывание данных из модели
  return CountryListScreenWidgetModel(model);
}

/// Widget Model for [CountryListScreen]
class CountryListScreenWidgetModel
    extends WidgetModel<CountryListScreen, CountryListScreenModel>
    implements ICountryListWidgetModel {
  final _StringState = EntityStateNotifier<String>();
  CountryListScreenWidgetModel(
    CountryListScreenModel model,
  ) : super(model);
  ValueListenable<EntityState<String>> get StringState =>
      _StringState;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadStringState();
  }

  @override
  void onErrorHandle(Object error) {
    super.onErrorHandle(error);

    if (error is DioException &&
        (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Connection troubles')));
    }
  }
  Future<void> _loadStringState() async {
    final previousData = _StringState.value.data;
    _StringState.loading(previousData);
    try {
      final res = await model.loadStringState();
      if (res == 'true') {
        _StringState.content(res);
      }
      else if (res == 'error') {
        _StringState.error();
      }
    }
     on Exception catch (e) {
      _StringState.error(e, previousData);
    }
  }
}




abstract interface class ICountryListWidgetModel implements IWidgetModel {
  ValueListenable<EntityState<String>> get StringState;
}

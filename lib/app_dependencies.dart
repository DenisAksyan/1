import 'app.dart';
import 'country_list_screen_model.dart';
import 'default_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Widget with dependencies that live all runtime.
class AppDependencies extends StatefulWidget {
  final App app;

  const AppDependencies({required this.app, Key? key}) : super(key: key);

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> {
  late final Dio _http;
  late final DefaultErrorHandler _defaultErrorHandler;
  late final CountryListScreenModel _countryListScreenModel;
  late final ThemeWrapper _themeWrapper;

  @override
  void initState() {
    super.initState();
    _http = Dio();
    _defaultErrorHandler = DefaultErrorHandler();
    _countryListScreenModel = CountryListScreenModel(
      _defaultErrorHandler
    );

    _themeWrapper = ThemeWrapper();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CountryListScreenModel>(
          create: (_) => _countryListScreenModel,
        ),
        Provider<ThemeWrapper>(
          create: (_) => _themeWrapper,
        ),
      ],
      child: widget.app,
    );
  }
}

import 'country_list_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends ElementaryWidget<ICountryListWidgetModel> {
  const CountryListScreen({
    Key? key,
    WidgetModelFactory wmFactory = countryListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICountryListWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: EntityStateNotifierBuilder<String>(
        listenableEntityState: wm.StringState, // Просмотр состояния
        loadingBuilder: (_, __) => const _LoadingWidget(), //Состояние загрузки
        errorBuilder: (_, __, ___) => const _ErrorWidget(), //Состояние ошибки
        builder: (_, ___) => const _WidgetBuild(),
      ),
    );
  }
}


class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('loading'),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error'),
    );
  }
}
class _WidgetBuild extends StatelessWidget {
  const _WidgetBuild({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('WidgetBuild'),
    );
  }
}



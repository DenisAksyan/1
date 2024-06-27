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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: const Text("Checking the widget status",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontStyle: FontStyle.italic
              ),)
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                <Widget>[
                  Text('',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 42.0,
                        fontStyle: FontStyle.normal
                    ),),
                  SizedBox( width: 10.0,
                    height: 100.0,),
                  Image.network(
                    'https://gas-kvas.com/grafic/uploads/posts/2024-01/gas-kvas-com-p-znachok-zagruzki-na-prozrachnom-fone-1.png',
                    width: 200.0, // ширина изображения
                    height: 200.0, // высота изображения
                  ),
                ]
            ))
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: const Text("Checking the widget status",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontStyle: FontStyle.italic
              ),)
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                <Widget>[
                  Text('',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 42.0,
                        fontStyle: FontStyle.normal
                    ),),
                  SizedBox( width: 10.0,
                    height: 100.0,),
                  Image.network(
                    'https://i.pinimg.com/originals/9c/14/32/9c1432a9964ad8d1c43d983de47dd100.jpg',
                    width: 300.0, // ширина изображения
                    height: 300.0, // высота изображения
                  ),
                ]
            ))
    );
  }
}
class _WidgetBuild extends StatelessWidget {
  const _WidgetBuild({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Checking the widget status",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 32.0,
          fontStyle: FontStyle.italic
        ),)
      ),
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      <Widget>[
        Text('WidgetBuild',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            fontSize: 42.0,
            fontStyle: FontStyle.normal
        ),),
        SizedBox( width: 10.0,
          height: 100.0,),
        Image.network(
              'https://sneg.top/uploads/posts/2023-04/1681360745_sneg-top-p-kartinka-zelenaya-galochka-krasivo-15.png',
              width: 200.0, // ширина изображения
              height: 200.0, // высота изображения
            ),
      ]
    ))
    );
  }
}



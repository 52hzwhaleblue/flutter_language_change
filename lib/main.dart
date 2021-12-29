import 'package:flutter/material.dart';
import 'package:simple_setting/simple_setting.dart';

void main() {
  // SimpleSetting.init(langMap: {
  //   "en_US": Lang.en,
  //   "vi_VN": Lang.vi
  // });
  SimpleSetting.init(languageData: Lang.vi);
  runApp(const SettingProvider(child: MyApp()));
}

class Lang {
  static const Map<String, String> vi = {
    "title": "Ví dụ",
  };

  static const Map<String, String> en = {
    "title": "Example",
  };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingWidget(builder: (language, _, __) {
        return MyHomePage(title: "title".tr);
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // check current lang
          bool isVi = SettingData.lang == Lang.vi;
          SimpleSetting.changeLanguage(context, isVi ? Lang.en : Lang.vi);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

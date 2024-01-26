import 'package:flavors_app/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appConfig = await getAppConfig();

  runApp(MyApp(appConfig: appConfig));
}

class MyApp extends StatelessWidget {
  final AppConfig appConfig;
  const MyApp({super.key, required this.appConfig});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: appConfig.buildType == BuildType.debug,
      title: appConfig.appName,
      theme: appConfig.theme,
      supportedLocales: appConfig.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: MyHomePage(appConfig: appConfig),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppConfig appConfig;
  const MyHomePage({super.key, required this.appConfig});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _prevCounter = 0;
  int _counter = 0;

  @override
  void initState() {
    _counter = switch (widget.appConfig) {
      DoubConfig() => 1,
      FibConfig() => 1,
      BaseConfig() => 0,
    };
    super.initState();
  }

  String _getTitle(BuildContext context) => switch (widget.appConfig) {
        DoubConfig() => AppLocalizations.of(context)!.title_double,
        FibConfig() => AppLocalizations.of(context)!.title_fib,
        BaseConfig() => AppLocalizations.of(context)!.title_base,
      };

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _doubleCounter() {
    setState(() {
      _counter *= 2;
    });
  }

  void _fibCounter() {
    setState(() {
      final prev = _counter;
      _counter = _prevCounter + _counter;
      _prevCounter = prev;
    });
  }

  void _count() => switch (widget.appConfig) {
        DoubConfig() => _doubleCounter(),
        FibConfig() => _fibCounter(),
        BaseConfig() => _incrementCounter(),
      };

  String _imgPath() => switch (widget.appConfig) {
        FibConfig() => '${widget.appConfig.assetsPath}/img.webp',
        _ => '${widget.appConfig.assetsPath}/img.png',
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${widget.appConfig.appName} Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300.0,
              child: Image.asset(_imgPath()),
            ),
            const Spacer(),
            Text(
              _getTitle(context),
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _count,
        child: const Icon(Icons.add),
      ),
    );
  }
}

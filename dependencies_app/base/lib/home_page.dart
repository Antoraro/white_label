import 'package:flavor/action_button.dart';
import 'package:flavor/config/flavor_assets.dart';
import 'package:flavor/config/flavor_localizations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    final localizations = FlavorLocalizations();
    final l10n = localizations.getAll(context);
    final assets = FlavorAssets();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${localizations.appName} Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300.0,
              child: Image.asset(assets.logo),
            ),
            const Spacer(),
            Text(
              l10n.title,
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
      floatingActionButton: ActionButton(
        counter: _counter,
        onCounterUpdated: (value) => setState(() => _counter = value),
      ),
    );
  }
}

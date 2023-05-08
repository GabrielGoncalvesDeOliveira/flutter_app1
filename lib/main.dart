import 'package:flutter/material.dart';
import 'dart:developer' as dev;

void main() {
  runApp(const MainApp());
}

const String LOGGER_NAME = 'mobile.fema';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    dev.log('MainApp.build', name: LOGGER_NAME);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App 1'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              dev.log('appBar.leading', name: LOGGER_NAME);
            }, 
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                dev.log('actions.add', name: LOGGER_NAME);
                final _HelloPageWidgetState x = _key.currentState as _HelloPageWidgetState;
                x._incrementCounter();
              }
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                dev.log('actions.remove', name: LOGGER_NAME);
                final _HelloPageWidgetState x = _key.currentState as _HelloPageWidgetState;
                x._decrementCounter();
              }
            ),
            IconButton(
              icon: const Icon(Icons.restore),
              onPressed: () {
                dev.log('actions.restore', name: LOGGER_NAME);
                final _HelloPageWidgetState x = _key.currentState as _HelloPageWidgetState;
                x._defineCounter(0);
              }
            ),
            IconButton(
              icon: const Icon(Icons.star_border_outlined),
              onPressed: () {
                dev.log('actions.star', name: LOGGER_NAME);
              }
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.blue.shade700,
            icon: const Icon(Icons.add),
            label: const Text('Adicionar'),
            onPressed: () {
              dev.log('floatingActionButton.add', name: LOGGER_NAME);
          }
        ),
        body: HelloPageWidget(key: _key, content: 'Olá meus amigos!',), 
      ),
    );
  }
}

class HelloPageWidget extends StatefulWidget {
  final String content;

  const HelloPageWidget({required Key key, required this.content}) : super(key: key);

  @override
  State<HelloPageWidget> createState() => _HelloPageWidgetState();
}

class _HelloPageWidgetState extends State<HelloPageWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.content, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
          Text('$_counter', style: Theme.of(context).textTheme.headlineMedium,)
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      dev.log('_incrementarContador: {$_counter}');
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      dev.log('_decrementarContador: {$_counter}');
    });
  }

  void _defineCounter(int valor) {
    setState(() {
      _counter = valor;
      dev.log('_definirContador: {$_counter}');
    });
  }
}

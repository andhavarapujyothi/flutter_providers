import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/timer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TimerProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    var timeprovider = Provider.of<TimerProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeprovider.updateTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build...');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.timer_outlined,
              size: 100,
              color: Colors.purple,
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<TimerProvider>(
              builder: (context, data, child) {
                return Text("${data.countdown}");
              },
            ),
          ],
        ),
      ),
    );
  }
}

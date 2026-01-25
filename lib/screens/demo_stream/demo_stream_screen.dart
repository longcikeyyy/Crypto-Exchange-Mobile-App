import 'dart:async';

import 'package:crypto_exchange_mobile_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

/// Single Subscription Stream Demo Screen
class DemoStreamScreen extends StatelessWidget {
  const DemoStreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    StreamController streamController = StreamController<int>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Demo Single Subscription Stream')),
          Text('Counter Value from Stream'),
          StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data.toString() : 'No data',
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              counter++;
              streamController.sink.add(counter);
            },
            child: Text('Start Stream'),
          ),

          /// Navigate to Broadcast Subscription Stream Demo Screen2
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.demoStreamScreen2);
            },
            child: Text('Go to Broadcast Stream Demo Screen'),
          ),
        ],
      ),
    );
  }
}

/// Broadcast Subscription Stream Demo Screen
class DemoStreamScreen2 extends StatefulWidget {
  const DemoStreamScreen2({super.key});

  @override
  State<DemoStreamScreen2> createState() => _DemoStreamScreen2State();
}

class _DemoStreamScreen2State extends State<DemoStreamScreen2> {
  int counter = 0;
  StreamController streamController = StreamController<int>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Demo Broadcast Subscription Stream')),
          Text('This is Demo Stream Screen 2'),
          StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data.toString() : 'No data',
              );
            },
          ),
          ElevatedButton(
            onPressed: () async {
              // counter++;
              // streamController.sink.add(counter);
              /// Mock data increase
              for (int i = 0; i < 100; i++) {
                counter++;
                streamController.sink.add(counter);
                await Future.delayed(Duration(milliseconds: 500));
              }
            },
            child: Text('On Increase Counter'),
          ),
          StreamBuilder(
            stream: streamController.stream,
            builder: (context, snapshot) {
              return Text(
                snapshot.hasData ? snapshot.data.toString() : 'No data',
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}

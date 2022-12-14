import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview/16/pages/other_page.dart';
import 'package:flutter_provider_essential/provider_overview/16/providers/counter.dart';
import 'package:provider/provider.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({Key? key}) : super(key: key);

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  @override
  Widget build(BuildContext context) {
    if (context.read<Counter>().counter == 3) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtherPage()),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigate'),
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.read<Counter>().increment(),
      ),
    );
  }
}

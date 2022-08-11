import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview/16/providers/counter.dart';
import 'package:provider/provider.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({Key? key}) : super(key: key);

  @override
  State<HandleDialogPage> createState() => _HandleDialogPageState();
}

class _HandleDialogPageState extends State<HandleDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Dialog'),
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

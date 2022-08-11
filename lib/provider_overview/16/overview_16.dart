import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview/16/pages/counter_page.dart';
import 'package:flutter_provider_essential/provider_overview/16/pages/handle_dialog_page.dart';
import 'package:flutter_provider_essential/provider_overview/16/pages/navigate_page.dart';
import 'package:provider/provider.dart';

import 'providers/counter.dart';

class Overview16 extends StatelessWidget {
  const Overview16({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('addPostFrameCallback'),
      ),
      body: childWidget(context),
    );
  }

  Widget childWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          shrinkWrap: true,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: Counter(),
                      child: CounterPage(),
                    ),
                  )),
              child: const Text(
                'Counter Page',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: Counter(),
                      child: HandleDialogPage(),
                    ),
                  )),
              child: const Text(
                'Handle Dialog Page',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: Counter(),
                      child: NavigatePage(),
                    ),
                  )),
              child: const Text(
                'Navigate Page',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

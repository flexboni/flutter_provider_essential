import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/app_router.dart';
import 'package:flutter_provider_essential/provider_overview_02/model/dog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Dog>(
            create: (context) => Dog(name: 'Sun', breed: 'Bulldog', age: 3)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Provider Essential'),
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      ),
    );
  }
}

class PageModel {
  PageModel({
    required this.name,
    required this.route,
  });

  final String name;
  final String route;
}

final pages = <PageModel>[
  PageModel(name: 'OverView01', route: AppRoutes.overView01),
  PageModel(name: 'OverView02', route: AppRoutes.overView02),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

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
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 30),
        alignment: Alignment.topCenter,
        child: Wrap(
          spacing: 20,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pages
                  .map(
                    (page) => ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(page.route),
                      child: Text(
                        page.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
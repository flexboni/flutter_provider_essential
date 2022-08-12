import 'package:flutter/material.dart';
import 'package:flutter_provider_essential/provider_overview/17/app_provider.dart';
import 'package:flutter_provider_essential/provider_overview/17/success_page.dart';
import 'package:provider/provider.dart';

class Overview17 extends StatefulWidget {
  const Overview17({Key? key}) : super(key: key);

  @override
  State<Overview17> createState() => _Overview17State();
}

class _Overview17State extends State<Overview17> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? searchTerm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier addListener'),
      ),
      body: ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
          builder: (context, child) {
            final appState = context.watch<AppProvider>().state;

            Future<void> submit() async {
              setState(() {
                autovalidateMode = AutovalidateMode.always;
              });

              final form = _formKey.currentState;
              if (form == null || !form.validate()) return;

              form.save();

              try {
                await context.read<AppProvider>().getResult(searchTerm!);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SuccessPage()),
                );
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: const Text('Something went wrong'),
                  ),
                );
              }
            }

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  autovalidateMode: autovalidateMode,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Search'),
                          prefixIcon: Icon(Icons.search),
                        ),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Search term required';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          searchTerm = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: appState == AppState.loading ? null : submit,
                        child: Text(
                          appState == AppState.loading
                              ? 'Loading...'
                              : 'Get Result',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

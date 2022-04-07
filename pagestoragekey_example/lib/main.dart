import 'package:flutter/material.dart';
import 'package:pagestoragekey_example/list_grid_view_pagestorage_key_page.dart';
import 'package:pagestoragekey_example/persist_pagestorage_key_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Page Storage Key';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('List/Grid View PageStorage', style: TextStyle(fontSize: 19)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[700],
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ListGridViewPageStorageKeyPage(),
                )),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child:
                    const Text('List/Grid View Custom PageStorage', style: TextStyle(fontSize: 19)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[700],
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PersistPageStorageKeyPage(),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

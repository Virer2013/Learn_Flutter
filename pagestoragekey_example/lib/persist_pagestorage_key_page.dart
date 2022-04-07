import 'package:flutter/material.dart';
import 'package:pagestoragekey_example/main.dart';

final bucketGlobal = PageStorageBucket();

class PersistPageStorageKeyPage extends StatefulWidget {
  const PersistPageStorageKeyPage({Key? key}) : super(key: key);

  @override
  State<PersistPageStorageKeyPage> createState() => _PersistPageStorageKeyPageState();
}

class _PersistPageStorageKeyPageState extends State<PersistPageStorageKeyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      body: PageStorage(
        bucket: bucketGlobal,
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Container(
                  color: Colors.grey[700],
                  child: const _ListPage(
                    key: PageStorageKey('FirstPage'),
                  ),
                );
              case 1:
                return Container(
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'Blank Page',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                );
              case 2:
                return Container(
                  color: Colors.grey[700],
                  child: const _GridPage(
                    key: PageStorageKey('ThirdPage'),
                  ),
                );
              default:
                throw '404';
            }
          },
        ),
      ),
    );
  }
}

class _ListPage extends StatelessWidget {
  const _ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Element - ${index + 1}', style: const TextStyle(fontSize: 30)),
        );
      },
    );
  }
}

class _GridPage extends StatelessWidget {
  const _GridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => GridTile(
        child: Center(
          child: Text(
            'Grid item ${index + 1}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
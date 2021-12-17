import 'package:error_handling_example/provider/user_change_notifier.dart';
import 'package:error_handling_example/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error Handling',
      home: ChangeNotifierProvider(
        create: (_) => UserChangeNotifier(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final userRepository = UserRepository();
  // late Future<List<User>?> userFuture;

  // @override
  // void initState() {
  //   userFuture = userRepository.getUsers();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Handling'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Consumer<UserChangeNotifier>(
              builder: (_, notifier, __) {
                if (notifier.state == NotifierState.initial) {
                  return const Text(
                    'Press the button 👇',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40),
                  );
                } else if (notifier.state == NotifierState.loading) {
                  return const CircularProgressIndicator();
                } else {
                  if (notifier.failure != null) {
                    return Text(
                      notifier.failure.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 40),
                    );
                  } else {
                    return Column(
                      children: notifier.users
                          .map(
                            (user) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                user.name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                }
              },
            ),
            // FutureBuilder<List<User>?> (
            //   future: userFuture,
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const CircularProgressIndicator();
            //     } else if (snapshot.hasError) {
            //       final error = snapshot.error;
            //       return Text(
            //         error.toString(),
            //         textAlign: TextAlign.center,
            //         style: const TextStyle(fontSize: 40),
            //       );
            //     } else if (snapshot.hasData) {
            //       final users = snapshot.data!;
            //       return Column(
            //         children: users
            //             .map(
            //               (user) => Padding(
            //                 padding: const EdgeInsets.all(10.0),
            //                 child: Text(
            //                   user.name,
            //                   style: const TextStyle(
            //                     fontSize: 20.0,
            //                   ),
            //                 ),
            //               ),
            //             )
            //             .toList(),
            //       );
            //     } else {
            //       return const Text(
            //         'Press the button 👇',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(fontSize: 40),
            //       );
            //     }
            //   },
            // ),
            ElevatedButton(
              child: const Text('Get Users'),
              onPressed: () async {
                setState(() {
                  // userFuture = userRepository.getUsers();
                  context.read<UserChangeNotifier>().getUsers();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

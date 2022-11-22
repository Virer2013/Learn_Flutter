import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/main.dart';

// class MyWidget extends ConsumerStatefulWidget {
//   const MyWidget({super.key});

//   @override
//   ConsumerState<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends ConsumerState<MyWidget> {

//   @override
//   void initState() {
//     super.initState();
//     final name = ref.read(nameProvider);
//   }
//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider);
//     return Text(name);
//   }
// }

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Center(
            child: Text(user.age.toString()),
          ),
        ],
      ),
    );
  }
}

import 'package:cubit_network_example/bloc/user_bloc.dart';
import 'package:cubit_network_example/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
    // final UserCubit userCubit = context.read<UserCubit>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          child: Text('Load'),
          onPressed: () {
            userBloc.add(UserLoadEvent());
            // userCubit.fetchUsers();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          child: Text('Clear'),
          onPressed: () {
            userBloc.add(UserClearEvent());
            // userCubit.clearUsers();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        ),
      ],
    );
  }
}

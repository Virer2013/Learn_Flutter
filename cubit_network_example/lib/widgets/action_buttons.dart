// import 'package:bloc_network_example/bloc/user_bloc.dart';
// import 'package:cubit_network_example/bloc/user_event.dart';
import 'package:cubit_network_example/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final UserCubit userCubit = context.bloc<UserCubit>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            userCubit.fetchUsers();
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            userCubit.clearUsers();
          },
          color: Colors.red,
        ),
      ],
    );
  }
}
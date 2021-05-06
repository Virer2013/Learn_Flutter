import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/character_entity.dart';
import '../bloc/person_list_cubit/rick_and_morty_bloc.dart';
import '../bloc/person_list_cubit/rick_and_morty_state.dart';
import 'person_card_widget.dart';

class PersonList extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PersonsListCubit>(context).loadPerson();
        }
      }
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    context.read<PersonsListCubit>().loadPerson();
    
    return BlocBuilder<PersonsListCubit, PersonState>(
        builder: (context, state) {
      if (state is PersonLoading && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<PersonEntity> persons = [];
      bool isLoading = false;

      if (state is PersonLoading) {
        persons = state.oldPersonList;
        isLoading = true;
      } else if (state is PersonLoaded) {
        persons = state.personList;
      }

      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < persons.length)
            return PersonCard(person: persons[index]);
          else {
            Timer(Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: persons.length + (isLoading ? 1 : 0),
      );
    });
  }
}

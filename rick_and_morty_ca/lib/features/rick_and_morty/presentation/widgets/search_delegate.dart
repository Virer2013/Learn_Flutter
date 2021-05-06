import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/character_entity.dart';
import '../bloc/search_bloc/search_bloc.dart';
import '../bloc/search_bloc/search_event.dart';
import '../bloc/search_bloc/search_state.dart';

import 'search_result.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate()
      : super(searchFieldLabel: "Search for characters...");

  final _suggestions = [
    'Example:',
    "Rick",
    "Morty",
    "Summer",
    "Beth",
    "Jerry"
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Theme.of(context).primaryColor,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      primaryColorBrightness: Brightness.dark,
      textTheme: theme.textTheme.copyWith(
        headline6:
            TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back_outlined),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show Search Results here
    print("inside custom search delegate and search query is $query");
    BlocProvider.of<PersonSearchBloc>(context, listen: false)
      ..add(SearchPersons(query));

    return BlocBuilder<PersonSearchBloc, PersonSearchState>(
      builder: (BuildContext context, PersonSearchState state) {
        if (state is PersonSearchLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PersonSearchLoaded) {
          final person = state.persons;
          if (person.isEmpty) {
            return _showErrorText("No Characters with that name Found");
          }
          return Container(
            child: ListView.builder(
              itemCount: person != null ? person.length : 0,
              itemBuilder: (context, int index) {
                PersonEntity result = person[index];
                return SearchResult(personResult: result);
              },
            ),
          );
        } else if (state is PersonSearchError) {
          return _showErrorText(state.message);
        } else
          return Center(
            child: Icon(
              Icons.now_wallpaper,
            ),
          );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 0) {
      return Container();
    }
    return ListView.separated(
      padding: EdgeInsets.all(10.0),
      itemCount: _suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(
          _suggestions[index],
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }

  Widget _showErrorText(String errorMessage) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(errorMessage,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

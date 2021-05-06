import 'package:flutter/material.dart';

import '../../domain/entities/character_entity.dart';
import '../pages/character_detail_screen.dart';
import 'circle_image.dart';

class SearchResult extends StatelessWidget {
  final PersonEntity personResult;

  SearchResult({this.personResult});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PersonPage(person: personResult)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Container(
                child: CircleImage(
                  imageUrl: personResult.image,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                personResult.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 26.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                personResult.location.name,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

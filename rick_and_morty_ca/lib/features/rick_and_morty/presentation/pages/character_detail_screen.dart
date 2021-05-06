import 'package:flutter/material.dart';

import '../../../../core/common/app_colors.dart';
import '../../domain/entities/character_entity.dart';
import '../widgets/circle_image.dart';

class PersonPage extends StatelessWidget {
  final PersonEntity person;

  const PersonPage({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              person.name,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              child: CircleImage(
                imageUrl: person.image,
                width: 260,
                height: 260,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color:
                          person.status == 'Alive' ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  person.status,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 1,
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (person.type.isNotEmpty) ...buildSection('Type:', person.type),
            ...buildSection('Gender:', person.gender),
            ...buildSection(
                'Number of episodes:', person.episode.length.toString()),
            ...buildSection('Species:', person.species),
            ...buildSection('Last known location:', person.location.name),
            ...buildSection('Origin:', person.origin.name),
            ...buildSection('Was created:', person.created.toString()),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildSection(String label, String value) {
  return [
    Text(
      label,
      style: TextStyle(color: AppColors.greyColor),
    ),
    const SizedBox(
      height: 4,
    ),
    Text(
      value,
      style: TextStyle(color: Colors.white),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ),
    const SizedBox(
      height: 12,
    ),
  ];
}

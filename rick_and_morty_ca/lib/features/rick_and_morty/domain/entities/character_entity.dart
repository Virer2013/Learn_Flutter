import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PersonEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final DateTime created;

  const PersonEntity({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.species,
    @required this.type,
    @required this.gender,
    @required this.origin,
    @required this.location,
    @required this.image,
    @required this.episode,
    @required this.created,
  });

  @override
  List<Object> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        created
      ];
}

class Location {
  final String name;
  final String url;

  const Location({this.name, this.url});
}

part of 'map_cubit.dart';

@immutable
abstract class MapsState {}

class MapInitial extends MapsState {}
class PlacesLoaded extends MapsState {
  final List<PlaceSuggestion> places;

  PlacesLoaded(this.places);

}

class PlaceLocationDetailsLoaded extends MapsState {
  final Place place;

  PlaceLocationDetailsLoaded(this.place);

}


class DirectionsLoaded extends MapsState {
  final PlaceDirections placeDirections;

  DirectionsLoaded(this.placeDirections);

}
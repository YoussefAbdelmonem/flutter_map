

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/place_directions.dart';
import '../model/place_model.dart';
import '../model/place_suggestion_model.dart';
import '../web_services/maps_web_servies.dart';

class MapsRepository {
PlacesWebservices placesWebservices;

MapsRepository(this.placesWebservices);

Future<List<PlaceSuggestion>> fetchSuggestions(
    String place, String sessionToken) async {
  final suggestions =
  await placesWebservices.fetchSuggestions(place, sessionToken);

  return suggestions
      .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
      .toList();
}

Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
  final place =
  await placesWebservices.getPlaceLocation(placeId, sessionToken);
  // var readyPlace = Place.fromJson(place);
  return Place.fromJson(place);
}

Future<PlaceDirections> getDirections(
    LatLng origin, LatLng destination) async {
  final directions =
  await placesWebservices.getDirections(origin, destination);

  return PlaceDirections.fromJson(directions);
}
}

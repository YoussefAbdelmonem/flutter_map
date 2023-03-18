import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../data/maps/model/place_directions.dart';
import '../../../../data/maps/model/place_model.dart';
import '../../../../data/maps/model/place_suggestion_model.dart';
import '../../../../data/maps/repo/maps_repo.dart';





part 'map_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepository mapsRepository;

  MapsCubit(this.mapsRepository) : super(MapInitial());

  get mapController => null;

  void emitPlaceSuggestions(String place, String sessionToken) {
    mapsRepository.fetchSuggestions(place, sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }

  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepository.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlaceLocationDetailsLoaded(place));
    });
  }

  void emitPlaceDirections(LatLng origin, LatLng destination) {
    mapsRepository.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }

  void search(String query) async {
    List<Placemark> placemarks =
    await placemarkFromAddress(query);
    Placemark placemark = placemarks.first;
    LatLng latLng = LatLng(placemark.position.latitude,
        placemark.position.longitude);
    mapController?.moveCamera(
        CameraUpdate.newLatLngZoom(latLng, 12));
  }

  placemarkFromAddress(String query) {}


}

class Placemark {
  get position => null;
}

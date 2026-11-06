import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:places/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);

    state = [...state, newPlace];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>((red) => UserPlacesNotifier());

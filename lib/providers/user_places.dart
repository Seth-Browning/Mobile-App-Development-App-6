import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:places/models/place.dart';

import 'dart:io';

import 'package:path_provider/path_provider.dart' as sysPaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image) async {
    final appDir = await sysPaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$filename');

    final newPlace = Place(title: title, image: copiedImage);

    final dbPath = await sql.getDatabasesPath();

    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) async {
        return db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT);');
      },
      version: 1,
    );

    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });

    state = [...state, newPlace];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
      (red) => UserPlacesNotifier(),
    );

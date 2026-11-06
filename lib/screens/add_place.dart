import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/providers/user_places.dart';
import 'package:places/widgets/image_input.dart';
import 'dart:io';

import 'package:places/widgets/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  File? _selectedImage;

  @override
  void dispose() {
    _titleController.dispose();

    super.dispose();
  }

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if(enteredTitle.isEmpty || _selectedImage == null) return;

    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new place')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text('Title')),
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onBackground)
            ),
            SizedBox(height: 16),
            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            },),
            SizedBox(height: 16),
            LocationInput(),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              onPressed: _savePlace,
              label: Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary
                  .withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Text(
            'No Location Chosen',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Get Current Location'),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('Get on Map'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

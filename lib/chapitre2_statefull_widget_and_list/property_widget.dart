import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_flutter/chapitre2_statefull_widget_and_list/property.dart';

class PropertyWidget extends StatelessWidget {
  final Property property;
  const PropertyWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final toSellorRent = property.isToSell ? "To sell" : "To rent" ;
    final flatorHouse = property.isFlat ? "Flat" : "House";
    return ListTile(
      title: Text("$toSellorRent : $flatorHouse of ${property.area} m2"),
      subtitle: Text("${property.rooms} bedrooms - ${property.price} Euros"),
    );
  }
}

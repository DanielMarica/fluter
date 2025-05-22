import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_flutter/chapitre2_statefull_widget_and_list/property.dart';
import 'package:note_flutter/chapitre2_statefull_widget_and_list/property_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  bool isSales = true;
  @override
  Widget build(BuildContext context) {
    final properties = isSales ? propertiesToSell : propertiesToRent;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Rentals",
                  style: TextStyle(fontWeight : FontWeight.bold),
                  ),
                  const SizedBox(width:8),
                  Switch(
                      value: isSales ,
                      onChanged: (value) => setState(() => isSales = !isSales),
                  ),
                  const SizedBox(width: 8),
                  const Text("Sales", style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                ],
              ),
              Expanded(child: ListView.separated(
                  itemCount: properties.length,
                  separatorBuilder: (context,index) => const Divider(),
                  itemBuilder: (context, index) => PropertyWidget(property: properties[index]),
                ),
              ),
            ],
        ),
      )
    );
  }
}

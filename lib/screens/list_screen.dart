
import 'package:flutter/material.dart';

import 'details_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, required this.bikesList});

  final List bikesList;
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Results'),),
      body: widget.bikesList.isEmpty ? ListIsNull() : ListIsNotNull(),
    );
  }

  Widget ListIsNull() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('No results found!', style: TextStyle(fontSize: 25),),
          const SizedBox(height: 150,),
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            hoverColor: Theme.of(context).colorScheme.secondaryContainer,
            ),
        ],
      ),
    );
  }

  Widget ListIsNotNull() {
    return ListView.builder(
        itemCount: widget.bikesList!.length ?? 0,
        itemBuilder:(BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(widget.bikesList![position]['model'], style: const TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Model: ${widget.bikesList![position]['make']}'),
                  Text('Year: ${widget.bikesList![position]['year']}'),
                ],
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (route) => DetailsScreen(
                      bikeDetails: widget.bikesList![position]
                  ))
              ),
            ),
          );
        }
    );
  }
}

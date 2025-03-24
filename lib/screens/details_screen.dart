import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.bikeDetails});
  final Map bikeDetails;
  @override
  Widget build(BuildContext context) {
    List? detailsList = bikeDetails.entries.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: ListView.builder(
        itemCount: detailsList!.length,
        itemBuilder: (context, index) {
          var info = detailsList[index];
          return Card(
            color: Colors.white,
            elevation: 1.0,
            child: ListTile(
              // title: Text('${info.key} : ${info.value}'),
              title: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                    ),
                    children: [
                      TextSpan(text: info.key.toString().toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimaryContainer
                          )
                      ),
                      const TextSpan(text: ' : '),
                      TextSpan(text: info.value.toString().toUpperCase()),
                    ]
                ),

              ),
            ),
          );
        },
      ),
    );
  }
}

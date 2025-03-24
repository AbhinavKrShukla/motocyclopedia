
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motocyclopedia_2/constants.dart';
import 'package:motocyclopedia_2/screens/list_screen.dart';
import 'package:motocyclopedia_2/services/getDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List bikes = [];

  // Text Editing Controllers
  TextEditingController? make = TextEditingController();
  TextEditingController? model = TextEditingController();
  TextEditingController? year = TextEditingController();

  Future search() async {
    bikes = await getDetails(make: make!.text, model: model!.text, year: year!.text);

    Navigator.of(context).push(
        MaterialPageRoute(builder: (route)=>ListScreen(bikesList: bikes,))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MotoCyclopedia',
            style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            Text('Know Your Motorcycle',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 35,),
            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  controller: make,
                  style: searchTextFieldStyle(context),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primaryContainer,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: 'Enter Maker',
                      hintStyle: searchPlaceholderStyle(context)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                controller: model,
                style: searchTextFieldStyle(context),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Enter Model',
                    hintStyle: searchPlaceholderStyle(context)
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                controller: year,
                style: searchTextFieldStyle(context),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: 'Enter Year of Mfg.',
                    hintStyle: searchPlaceholderStyle(context)
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  if((year!.text != '' && (model!.text != '' || make!.text != '')) || (model!.text != '' || make!.text != '')){
                    setState(() {
                      search();
                    });
                  }
                },
                child: const Text('Search')),
          ],
        )
    );
  }
}

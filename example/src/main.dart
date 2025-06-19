import 'package:flutter/material.dart';
import 'package:gome_search/gome_search.dart';

void main() {
  runApp(const MaterialApp(home: SearchExample()));
}

class SearchExample extends StatefulWidget {
  const SearchExample({super.key});

  @override
  State<SearchExample> createState() => _SearchExampleState();
}

class _SearchExampleState extends State<SearchExample> {
  String searchResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gome Search Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Search(
              placeholder: 'Cari sesuatu',
              onSearchChanged: (value) {
                setState(() => searchResult = value);
              },
            ),
            const SizedBox(height: 16),
            Text('Hasil pencarian: $searchResult'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'dart:math' as math;

import 'CustomDrawer.dart';
import 'DetailScreen.dart';
import 'FancyButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>(); // Add this line.
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: Column(children: [
              Text("TITULO"),
              Container(
                height: 160,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        100,
                        (i) => Container(
                              width: 160.0,
                              height: 160.0,
                              color: Color(
                                      (math.Random().nextDouble() * 0xFFFFFF)
                                              .toInt() <<
                                          0)
                                  .withOpacity(1.0),
                            ))),
              ),
              Container(
                height: 160,
                child: ListView(
                    // scrollDirection: Axis.horizontal,
                    children: List.generate(
                        100,
                        (i) => Container(
                              // width: 160.0,
                              height: 20.0,
                              color: Color(
                                      (math.Random().nextDouble() * 0xFFFFFF)
                                              .toInt() <<
                                          0)
                                  .withOpacity(1.0),
                            ))),
              ),
              // _buildSuggestions(),
            ]),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair); // Add this line.

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: FancyButton(
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(name: pair.asPascalCase),
                ),
              );
         },
      ),
      onTap: () {
        // Add 9 lines from here...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
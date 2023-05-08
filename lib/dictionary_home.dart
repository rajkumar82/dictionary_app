import 'package:dictionary_app/views/meaning_widget.dart';
import 'package:flutter/material.dart';

import 'model/word_meaning.dart';
import 'service/dictionary_service.dart';

class DictionaryHome extends StatefulWidget {
  const DictionaryHome({Key? key}) : super(key: key);

  @override
  _DictionaryHomeState createState() => _DictionaryHomeState();
}

class _DictionaryHomeState extends State<DictionaryHome> {
  String? word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(icon: Icon(Icons.search), hintText: 'Enter a word', labelText: 'Search'),
          onSubmitted: (value) {
            debugPrint('Searching for $value');

            setState(() {
              word = value;
            });

            //API call
          },
        ),
      ),
      body: getMeaningsWidget(word),
    );
  }

  Widget getMeaningsWidget(String? word) {
    return word != null
        ? FutureBuilder(
            future: getMeaningsForWord(word),
            builder: (buildContext, AsyncSnapshot<List<WordMeaning>> snapshot) {
              if (snapshot.hasData) {
                return ListView(children: getWordMeaningsWidgets(snapshot.data!));
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            })
        : const Center(
            child: Text('Please type a word and search'),
          );
  }

  List<Widget> getWordMeaningsWidgets(List<WordMeaning> wordMeanings) {
    var widgets = <Widget>[];

    for (var wordMeaning in wordMeanings) {
      var widget = MeaningWidget(wordMeaning: wordMeaning);
      widgets.add(widget);
    }

    return widgets;
  }
}

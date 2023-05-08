import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/word_meaning.dart';

const dictionaryApiUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

Future<List<WordMeaning>> getMeaningsForWord(String word) async {
  var wordMeanings = <WordMeaning>[];
  var dio = Dio();

  var apiUrl = '$dictionaryApiUrl$word';

  var response = await dio.get(apiUrl);

  if (response.statusCode == 200) {
    //
    var wordMeaningsJson = response.data;
    for (var wordMeaningJson in wordMeaningsJson) {
      try {
        var wordMeaningObj = WordMeaning.fromJson(wordMeaningJson);

        wordMeanings.add(wordMeaningObj);
      } catch (error) {
        debugPrint('Exception during parsing $error');
      }
    }
  }

  return wordMeanings;
}

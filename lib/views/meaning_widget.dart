import 'package:flutter/material.dart';

import '../model/word_meaning.dart';

class MeaningWidget extends StatelessWidget {

final WordMeaning? wordMeaning;

const MeaningWidget({ Key? key, required this.wordMeaning }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(),color: Colors.grey),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [

          Text(wordMeaning!.word!,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),

          Text(wordMeaning!.phonetic!, style: const TextStyle(fontStyle: FontStyle.italic),),

          const Text('phonetics'),

          const Text('meaning'),


      ],),
    );
  }
}
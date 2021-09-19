import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function rstQz;
  Result(this.resultScore, this.rstQz);
  String get resultPhrase {
    var rText = "gg";
    if (resultScore <= 8)
      rText = "You are Awesome & innocent";
    else if (resultScore <= 8)
      rText = "your are prety Likeable";
    else if (resultScore <= 12)
      rText = "your are prety Likeable";
    else if (resultScore >= 18)
      rText = "You are Strange ?!";
    else
      rText = "You are Bad!";

    return rText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text("Restart Quiz!"),
            onPressed: rstQz(),
            
            
          ),
        ],
      ),
    );
  }
}

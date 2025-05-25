import 'package:flutter/material.dart';

class EvaluationBar extends StatefulWidget {
  const EvaluationBar({super.key});

  @override
  EvaluationBarState createState() => EvaluationBarState();
}

class EvaluationBarState extends State<EvaluationBar> {
  double rating = 3.2;
  double maxRating = 5;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Evaluations"),
          SizedBox(
            width: screenWidth / 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: LinearProgressIndicator(
                value: rating / maxRating,
                minHeight: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
              ),
            ),
          ),
          Text(rating.toString()),
        ],
      ),
    );
  }
}

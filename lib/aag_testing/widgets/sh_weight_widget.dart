import 'package:flutter/material.dart';

class ShWeightWidget extends StatefulWidget {
  const ShWeightWidget({super.key});

  @override
  State<ShWeightWidget> createState() => _ShWeightWidgetState();
}

class _ShWeightWidgetState extends State<ShWeightWidget> {
  int _leftWeight = 55;
  int _rightWeight = 49;

  void _incrementRightWeight() {
    setState(() {
      _rightWeight++;
    });
  }

  void _decrementLeftWeight() {
    setState(() {
      _leftWeight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My weight",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$_leftWeight',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Icon(
                Icons.monitor_weight,
                size: 50.0,
                color: Colors.orange,
              ),
              Text(
                '$_rightWeight',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: _decrementLeftWeight,
                icon: Icon(Icons.remove_circle_outline),
                iconSize: 30.0,
                color: Colors.orange,
              ),
              IconButton(
                onPressed: _incrementRightWeight,
                icon: Icon(Icons.add_circle_outline),
                iconSize: 30.0,
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

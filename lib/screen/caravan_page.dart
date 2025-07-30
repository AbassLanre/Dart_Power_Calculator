import 'package:flutter/material.dart';
import 'package:power_calc/model/constants.dart';

class CaravanPage extends StatefulWidget {
  const CaravanPage({super.key});

  @override
  _CaravanPageState createState() => _CaravanPageState();
}

class _CaravanPageState extends State<CaravanPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenPage(
      loadName: 'Caravan Camping',
      imageName: 'images/caravan.jpg' ,
      heroTag: 'caravan',
      power: 'power',
      gadget: 'gadget',
      sliverName: 'Caravan Loads',
      position: 3,
    );

  }
}

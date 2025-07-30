import 'package:flutter/material.dart';
import 'package:power_calc/model/constants.dart';

class GardenPage extends StatefulWidget {
  const GardenPage({super.key});

  @override
  _GardenPageState createState() => _GardenPageState();
}

class _GardenPageState extends State<GardenPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenPage(
      loadName: 'Garden & DIY',
      imageName: 'images/garden.jpg' ,
      heroTag: 'garden',
      power: 'power',
      gadget: 'gadget',
      sliverName: 'Garden Loads',
      position: 1,
    );

  }
}

import 'package:flutter/material.dart';
import 'package:power_calc/model/constants.dart';

class IndustryPage extends StatefulWidget {
  const IndustryPage({super.key});

  @override
  _IndustryPageState createState() => _IndustryPageState();
}

class _IndustryPageState extends State<IndustryPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenPage(
      loadName: 'Industrial/Hire Equipment',
      imageName: 'images/industry.jpg' ,
      heroTag: 'industry',
      power: 'power',
      gadget: 'gadget',
      sliverName: 'Industrial Loads',
      position: 0,
    );

  }
}

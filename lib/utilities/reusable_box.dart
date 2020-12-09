import 'package:flutter/material.dart';

class ReUseableImageAsset extends StatelessWidget {
  ReUseableImageAsset({this.assetImage, this.loadType, this.example});

  final AssetImage assetImage;
  final String loadType;
  final String example;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        image: DecorationImage(
          image: assetImage,
          fit: BoxFit.cover,
        ),
      ),
      height: 175,
      width: 175,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(loadType, style: TextStyle(fontFamily: 'Nunito',
              fontWeight: FontWeight.w700 ,color: Colors.white,fontSize: 21.0) ,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(example,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),),
          ),
        ],
      ),);
  }
}

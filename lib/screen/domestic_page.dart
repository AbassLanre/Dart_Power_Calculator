
import 'package:flutter/material.dart';
import 'package:power_calc/model/constants.dart';

class DomesticPage extends StatefulWidget {
  const DomesticPage({super.key});

  @override
  _DomesticPageState createState() => _DomesticPageState();
}

class _DomesticPageState extends State<DomesticPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenPage(
      loadName: 'Domestic & Office',
      imageName: 'images/domestic.jpg' ,
      heroTag: 'domestic',
      power: 'power',
      gadget: 'gadget',
      sliverName: 'Domestic Loads',
      position: 2,
    );

  }
}






























































// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:power_calc/utilities/rounded_button.dart';
//
// class DomesticPage extends StatefulWidget {
//   @override
//   _DomesticPageState createState() => _DomesticPageState();
// }
//
// class _DomesticPageState extends State<DomesticPage> {
//   bool showSpinner = false;
//
//   Future<String> _checkData() async {
//     return await DefaultAssetBundle.of(context)
//         .loadString('assets/webScrappinJson2.json');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<TextEditingController> textEditingController = List();
//
//     //
//     // List<String> controllerValues=List();
//     //
//     // Map<List, String> textFieldControllers = Map();
//     double additionResult = 0;
//     double multiplicationResult = 0;
//
//     return FutureBuilder(
//         future: _checkData(),
//         builder: (context, snapshot) {
//           List newData = json.decode(snapshot.data.toString());
//           Widget domesticListSliver;
//           Widget sliverButton = SliverFillRemaining(
//             hasScrollBody: false,
//             child: Wrap(
//               children:[
//                 Center(
//                   child: CustomRoundButton(
//                     color: Colors.black,
//                     buttonName: 'Calculate',
//                     onPressed: () {
//                     print('button');
//                     for (int i = 0;
//                     i < newData[2]['Domestic & Office'][0]['power'].length;
//                     i++) {
//                       if (textEditingController[i].text == null ||
//                           textEditingController[i].text.isEmpty) {
//                         textEditingController[i].text = 0.toString();
//                       } else {
//                         additionResult = additionResult +
//                             (double.parse(textEditingController[i].text) *
//                                 double.parse(newData[2]['Domestic & Office'][0]
//                                 ['power'][i]));
//                       }
//                       textEditingController[i].clear();
//                     }
//                     multiplicationResult = additionResult * 0.00125;
//                     print(additionResult);
//                     additionResult = 0;
//                     multiplicationResult = 0;
//                     // setState(() {
//                     //   // textEditingController[i].clear();
//                     // });
//                   },),
//                 )],
//             ),
//           );
//           if (snapshot.hasData && newData != null) {
//             print('hasData');
//             domesticListSliver = SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//               textEditingController.add(TextEditingController());
//               // textFieldControllers[textEditingController[0].text]= newData[2]['Domestic & Office'][0]['power'][];
//               return Card(
//                 color: Colors.white,
//                 elevation: 5.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(newData[2]['Domestic & Office'][0]['gadget']
//                             [index]),
//                       ),
//                       Expanded(
//                         child: TextField(
//                           // onTap: (){
//                           //   controllerValues.add(textEditingController.indexOf());
//                           //
//                           // },
//                           controller: textEditingController[index],
//                           style: TextStyle(
//                             color: Colors.black,
//                           ),
//                           keyboardType: TextInputType.number,
//                           textAlign: TextAlign.center,
//                           decoration: InputDecoration(
//                             hintText: 'Enter item quantity',
//                             hintStyle: TextStyle(
//                               color: Colors.black26,
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 10.0, horizontal: 20.0),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: Color(0xFFFAFAFA), width: 2.0),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32.0)),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//                     childCount:
//                         newData[2]['Domestic & Office'][0]['gadget'].length));
//           } else if (snapshot.hasError || newData == null) {
//             print('NoData');
//             domesticListSliver = SliverList(
//               delegate:
//                   SliverChildBuilderDelegate((BuildContext context, int index) {
//                 return CircularProgressIndicator(
//                   backgroundColor: Colors.blueAccent,
//                   strokeWidth: 4.0,
//                 );
//               }),
//             );
//           }
//           return Container(
//             color: Color(0xFFFAFAFA),
//             child: CustomScrollView(
//               physics: BouncingScrollPhysics(),
//               slivers: [
//                 SliverAppBar(
//                   backgroundColor: Colors.black,
//                   expandedHeight: 150.0,
//                   pinned: true,
//                   floating: false,
//                   snap: false,
//                   flexibleSpace: FlexibleSpaceBar(
//                     title: Text('Domestic Loads'),
//                     background: Hero(
//                       tag: 'domestic',
//                       child: Image.asset(
//                         'images/domestic.jpg',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                  domesticListSliver,
//                 sliverButton,
//               ],
//             ),
//           );
//         });
//   }
// }
//
// // Future<String> getJson()async {
// //   return await rootBundle.loadString('assets/webScrappinJson2.json');
// // }
//
// //
// // CustomScrollView(
// // slivers: [
// // SliverAppBar(
// // expandedHeight: 150.0,
// // pinned: true,
// // floating: false,
// // snap: false,
// // flexibleSpace: FlexibleSpaceBar(
// // title: Text('Domestic Loads'),
// // background: Hero(
// // tag: 'domestic',
// // child: Image.asset(
// // 'images/domestic.jpg',
// // fit: BoxFit.cover,
// // ),
// // ),
// // ),
// // ),
// // SliverFixedExtentList(
// // delegate:
// // SliverChildBuilderDelegate((BuildContext context, int index) {
// // textFieldControllers.add(TextEditingController());
// // return Container(
// // color: Colors.white,
// // child: Card(
// // color: Colors.lightBlueAccent,
// // elevation: 5.0,
// // shape: RoundedRectangleBorder(
// // borderRadius: BorderRadius.circular(10.0),
// // ),
// // child: Row(
// // children: [
// // Expanded(
// // child: Text('data'),
// // ),
// // Expanded(
// // child: TextField(
// // style: TextStyle(
// // color: Colors.black,
// // ),
// // keyboardType: TextInputType.number,
// // textAlign: TextAlign.center,
// // decoration: InputDecoration(
// // hintText: 'Enter your email',
// // hintStyle: TextStyle(
// // color: Colors.black26,
// // ),
// // contentPadding: EdgeInsets.symmetric(
// // vertical: 10.0, horizontal: 20.0),
// // border: OutlineInputBorder(
// // borderRadius:
// // BorderRadius.all(Radius.circular(32.0)),
// // ),
// // enabledBorder: OutlineInputBorder(
// // borderSide: BorderSide(
// // color: Colors.lightBlueAccent, width: 1.0),
// // borderRadius:
// // BorderRadius.all(Radius.circular(32.0)),
// // ),
// // focusedBorder: OutlineInputBorder(
// // borderSide: BorderSide(
// // color: Colors.lightBlueAccent, width: 2.0),
// // borderRadius:
// // BorderRadius.all(Radius.circular(32.0)),
// // ),
// // ),
// // ),
// // )
// // ],
// // ),
// // ),
// // );
// // }, childCount: 46),
// // itemExtent: 50.0,
// // )
// // ],
// // );

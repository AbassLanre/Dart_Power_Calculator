import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:power_calc/utilities/rounded_button.dart';
import 'package:power_calc/utilities/style_constants.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({
    super.key,
    required this.heroTag,
    required this.imageName,
    required this.loadName,
    required this.power,
    required this.sliverName,
    required this.gadget,
    required this.position,
  });

  final String loadName;
  final String power;
  final String gadget;
  final String sliverName;
  final String imageName;
  final String heroTag;
  final int position;

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  bool showSpinner = false;

  late Future<String> theData;

  Future<String> _checkData() async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/webScrappinJson2.json');
  }


  @override
  void initState() {
    theData=_checkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> textEditingController = <TextEditingController>[];

    //
    // List<String> controllerValues=List();
    //
    // Map<List, String> textFieldControllers = Map();
    double additionResult = 0;
    double multiplicationResult = 0;
    double value=2.0;

    return FutureBuilder(
        future: theData,
        builder: (context, snapshot) {
          List newData = json.decode(snapshot.data.toString());
          Widget domesticListSliver = const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
          Widget sliverButton = SliverFillRemaining(
            hasScrollBody: false,
            child: Wrap(
              children: [
                Center(
                  child: CustomRoundButton(
                    color: Colors.white,
                    buttonName: 'Calculate',
                    onPressed: () {
                      print('button');
                      for (int i = 0;
                          i <
                              newData[widget.position][widget.loadName][0]
                                      [widget.power]
                                  .length;
                          i++) {
                        if (textEditingController[i].text.isEmpty) {
                          textEditingController[i].text = 0.toString();
                        } else {
                          additionResult = additionResult +
                              (double.parse(textEditingController[i].text) *
                                  double.parse(newData[widget.position]
                                      [widget.loadName][0][widget.power][i]));
                        }
                        textEditingController[i].clear();
                      }
                      multiplicationResult = additionResult * 0.00125;
                      print(multiplicationResult);

                      // setState(() {
                      //   // textEditingController[i].clear();
                      // });
                      alertBox(context, multiplicationResult.toString());
                      additionResult = 0;
                      multiplicationResult = 0;
                    },
                  ),
                )
              ],
            ),
          );
          if (snapshot.hasData) {
            value=0.0;
            print('hasData');
            domesticListSliver = SliverList(
              
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              textEditingController.add(TextEditingController());
              // textFieldControllers[textEditingController[0].text]= newData[2]['Domestic & Office'][0]['power'][];
              return Card(
                color: Colors.white,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(newData[widget.position][widget.loadName][0]
                            [widget.gadget][index],style: kConstantEachItem,),
                      ),
                      Expanded(
                        child: TextField(
                          // onTap: (){
                          //   controllerValues.add(textEditingController.indexOf());
                          //
                          // },
                          controller: textEditingController[index],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Enter item quantity',
                            hintStyle: kConstantEachUnderline,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
                    childCount: newData[widget.position][widget.loadName][0]
                            [widget.gadget]
                        .length));
          } else {
            value=1.0;
            print('NoData');
            domesticListSliver = SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Center(
                  child: CircularProgressIndicator(
                    value: value,
                    backgroundColor: Colors.red,
                    strokeWidth: 4.0,
                  ),
                );
              }),
            );
          }
          return CupertinoPageScaffold(
              backgroundColor: Colors.black,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.black,
                    expandedHeight: 150.0,
                    pinned: true,
                    floating: false,
                    snap: false,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(widget.sliverName,style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      ),),
                      background: Hero(
                        tag: widget.heroTag,
                        child: Image.asset(
                          widget.imageName,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 8.0,
                    ),
                  ),
                  domesticListSliver,
                  sliverButton,
                ],
              ),
            );
        });
  }
}

void alertBox(BuildContext context, String multiplicationResult) {
  var alertDialog = AlertDialog(
    title: Text("Result",style: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w700,
    ),),
    content: Row(
        children: [
          Flexible(child: Text('Required generator power rating: ',
            style: kAlertDialogBox,)),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(child: Text(
              '$multiplicationResult KVA',
              style: kAlertDialogBox),
          ),
        ],
      ),
    actions: <Widget>[
      TextButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: const Text("OK"))
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      });
}

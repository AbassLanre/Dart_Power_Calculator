import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:power_calc/screen/caravan_page.dart';
import 'package:power_calc/screen/domestic_page.dart';
import 'package:power_calc/screen/garage_page.dart';
import 'package:power_calc/screen/industry_page.dart';
import 'package:power_calc/utilities/reusable_box.dart';
import 'package:power_calc/utilities/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    _launchUrl() async {
      final Uri url = Uri.parse('https://stagengineering.com/contact-us/');
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    Widget listViewWidget = Column(
        children: [
      ListView(
        shrinkWrap: true,
        children: [
          Image.asset('images/logo.jpg'),
          ListTile(
            leading: Icon(Icons.widgets_outlined, color: Colors.white,),
            title: Text('Domestic Load',
            style: kDrawerLoads,),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const DomesticPage();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.widgets_outlined, color: Colors.white,),
            title: Text('Industrial Load',
              style: kDrawerLoads,),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const IndustryPage();
              }));
            },
          ),
          //https://stagengineering.com/contact-us/
          ListTile(
            leading: Icon(Icons.widgets_outlined, color: Colors.white,),
            title: Text('Caravan Load',
              style: kDrawerLoads,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const CaravanPage();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.widgets_outlined, color: Colors.white,),
            title: Text('Garden Load',
              style: kDrawerLoads,),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const GardenPage();
              }));
            },
          ),
          const SizedBox(
            height: 50.0,
          ),
          ListTile(
            leading: Icon(Icons.call_end_rounded, color: Colors.white,),
            title: Text('Ask an expert',
              style: kDrawerLoads,),
            onTap: () {
              Navigator.pop(context);
              _launchUrl();
            },
          ),
        ],
      )
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.black),
          child:  Drawer(
            backgroundColor: Colors.black,
            child: SafeArea(
              child: listViewWidget,
            ),
          )),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(color: Color(0xFFBDBDBD), blurRadius: 5.0)
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 15, left: 20.0),
                  child: Text(
                    'Getting a new Generator?',
                    style: kHomePageName,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.0,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(color: Color(0xFFBDBDBD), blurRadius: 5.0)
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 13.0, top: 12),
                  child: Text(
                    'To determine the power rating of the generator you want to purchase,'
                    ' it is important to consider all appliances/equipment '
                    'you may want to operate in your homes or industry or  how many will be used'
                    ' simultaneously and the total power consumption. Most '
                    'appliances have a descriptive plate stating the power rating'
                    ' in watts/KVA. \n\n The Categories of load are distributed below, '
                    'choose a category depending on the type of load you want calculate:',
                    style: kHomePageRead,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.0,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(color: Color(0xFFBDBDBD), blurRadius: 5.0)
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const DomesticPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'domestic',
                                    child: ReUseableImageAsset(
                                      assetImage:
                                          AssetImage('images/domestic.jpg'),
                                      loadType: 'Domestic Load',
                                      example:
                                          'such as fan, lights, air-Conditioner, computers etc.',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const IndustryPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'industry',
                                    child: ReUseableImageAsset(
                                      assetImage:
                                          AssetImage('images/industry.jpg'),
                                      loadType: 'Industrial Load',
                                      example:
                                          'such as lathe, masonry, angle grinder, vacuum pump etc.',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.0,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const CaravanPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'caravan',
                                    child: ReUseableImageAsset(
                                      assetImage:
                                          AssetImage('images/caravan.jpg'),
                                      loadType: 'Caravan Load',
                                      example:
                                          'such as electrolux fridge, caravaner electric kettle etc.',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const GardenPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: 'garden',
                                    child: ReUseableImageAsset(
                                      assetImage:
                                          AssetImage('images/garden.jpg'),
                                      loadType: 'Garden Load',
                                      example:
                                          'such as lawn mower, lawn raker, jig saw etc.',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

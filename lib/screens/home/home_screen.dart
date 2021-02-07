import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hackathon_bread_donate/config/size_config.dart';
import 'package:flutter_hackathon_bread_donate/config/styles/styles.dart';
import 'package:flutter_hackathon_bread_donate/screens/home/custom_modal_sheet.dart';
import 'components/custom_card.dart';
import 'components/vertical_card.dart';
import 'package:http/http.dart' as http;
import 'custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home_page';

  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int avaibleBreadCount = 28423;

  @override
  void initState() {
    super.initState();
    // var res = await http.get(
    //     'https://flutterhackathon21-breaddonate-default-rtdb.firebaseio.com/free.json');
    // avaibleBreadCount = jsonDecode(res.body)['count'];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xffE1E6EB),
      appBar: buildAppBar(),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCard(
                image: Image(
                  image: AssetImage('assets/images/png/bread_icon_black.png'),
                ),
                title: 'Askıdaki Ekmekler',
                number: '${avaibleBreadCount.toString()}',
              ),
              CustomCard(
                image: Image(
                  image: AssetImage('assets/images/png/location.png'),
                ),
                title: 'Aktif Şehir',
                number: '21',
              ),
            ],
          ),
          VerticalCard(
            image: Image.asset('assets/images/png/hand_with_bread.png'),
            number: '215423',
            title: 'Askıdan alınan ekmek sayısı',
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (context) => CustomModalSheet());
            },
            child: Container(
              decoration: donateButtonBoxDecoration,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'Bağışla',
                  style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Comfortaa',
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xffE1E6EB),
      elevation: 0,
      leading: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff5349C4),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 7),
                child: Icon(
                  Icons.menu,
                  size: 45,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

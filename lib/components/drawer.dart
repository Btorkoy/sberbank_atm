import 'package:flutter/material.dart';
import '../screens/my_books_screen.dart';
import '../screens/my_account_screen.dart';
import '../screens/my_content_screen.dart';
import '../screens/my_personal_data_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              // margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(top: 25, left: 15),
              height: 125,
              decoration: BoxDecoration(color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 70,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'БЕРС',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'ТОРКОЙ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.black,
                  ),
                  title: Text('Персональные данные'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyPersonalDataScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.bookmark_border,
                    color: Colors.black,
                  ),
                  title: Text('Мои заказы'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAdvCampanyScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.attach_money,
                    color: Colors.black,
                  ),
                  title: Text('Мой счет'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAccountScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.image,
                    color: Colors.black,
                  ),
                  title: Text('Мои файлы'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyContentScreen()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  title: Text('Выйти'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyAdvCampanyScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

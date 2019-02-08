import 'package:flutter/material.dart';
import 'adv_sended_to_approve_screen.dart';
import '../components/drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class AdvPostingScreen extends StatefulWidget {
  static const ROUTE = 'advPosting';
  @override
  State<StatefulWidget> createState() => AdvPostingScreenState();
}

class AdvPostingScreenState extends State<AdvPostingScreen> {
  @override
  String _selectedMonth = months[DateTime.now().month];
  String _selectedYear = DateTime.now().year.toString();
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
          ))
        : Scaffold(
            appBar: AppBar(
              title: Text('Размещение рекламы'),
              backgroundColor: Colors.green,
            ),
            drawer: MyDrawer(),
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Выберите дату размещения',
                        style: Theme.of(context).textTheme.title,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                        DropdownButton<String>(
                          value: _selectedMonth,
                          items: months.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedMonth = value;
                            });
                          },
                        ),
                        DropdownButton<String>(
                          value: _selectedYear,
                          items: <String>['2019', '2020', '2021', '2022', '2023'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedYear = value;
                            });
                          },
                        ),
                      ]),
                    ],
                  ),
                  Divider(),
                  Column(
                    children: <Widget>[
                      Text(
                        'Установите свою цену',
                        style: Theme.of(context).textTheme.title,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: 100,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(hintText: '2000 руб', hasFloatingPlaceholder: true),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text('мин. цена:'),
                              Text(
                                '2000 руб',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Загрузите файл с вашей рекламой',
                        style: Theme.of(context).textTheme.title,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: getFilePath,
                            child: new Icon(Icons.attach_file),
                          ),
                          Text(this._filePath)
                        ],
                      )
                    ],
                  ),
                  RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text('Отправить на согласование'),
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                          wait(2).then((val) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdvToApproveScreen()));
                          });
                        });
                      })
                ],
              ),
            ),
          );
  }

  Future wait(int sec) => Future.delayed(Duration(seconds: sec));

  var _isLoading = false;
  var _filePath = '';
  void getFilePath() async {
    try {
      File file = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (file == null) {
        return;
      }
      print("File path: " + file.uri.toString());
      setState(() {
        this._filePath = file.uri.toString().split('/').last;
      });
    } on Exception catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  static const months = [
    'Нулябрь',
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];
}

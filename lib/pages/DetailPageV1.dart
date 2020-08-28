import 'package:flutter/material.dart';
//t 'package:flutterapp/models/detail.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic> course;
  List<dynamic> chapter = [];
  bool isLoading = true;
  final fNumber = NumberFormat('#,###');

  _getData(int id) async{
    var url = 'https://api.codingthailand.com/api/course/$id';
    var response = await http.get(url);
    if (response.statusCode == 200) {
       //print(response.body);
      final Map<String, dynamic> detail = convert.jsonDecode(response.body);
      setState(() {
        chapter = detail['data'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      }); //error 400 500
       print('error from backend ${response.statusCode}');
    }
  }

  @override
  void initState() { 
    super.initState();
    // print('init detail page');
    Future.delayed(Duration.zero, () {
      // print('init delay');
      _getData(course['id']);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('buil');
    course = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${course['title']}'),
        //automaticallyImplyLeading: false, :เอาปุ่มกลับออก
        ),
      body:isLoading == true ?
      Center(
        child: CircularProgressIndicator(backgroundColor: Colors.orange),
      ) : ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(chapter[index]['ch_title']),
            subtitle: Text(chapter[index]['ch_dateadd']),
            trailing: Chip(
              label: Text('${fNumber.format(chapter[index]['ch_view'])}') ,
              backgroundColor: Colors.purpleAccent,
            )
          );
        }, 
        separatorBuilder:(BuildContext context, int index) => Divider(),
        itemCount: chapter.length
      ) 
    );
  }
}
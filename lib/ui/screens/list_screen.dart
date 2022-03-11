import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_app_template/ui/user_detail_page.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List _data = [];
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'))
        .then((res) {
      var decoded = utf8.decode(res.bodyBytes);
      var jsonResponse = jsonDecode(decoded);
      print(jsonResponse);
      setState(() {
        _data = jsonResponse;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_data[index]["name"]),
              subtitle: Text(_data[index]["email"]),
              onTap: () => moveToUserDetail(_data[index]),
            );
          }),
    );
  }

  void moveToUserDetail(data) {
    Get.to(UserDetail(data: data));
  }
}

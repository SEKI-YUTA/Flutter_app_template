import 'dart:ffi';

import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  UserDetail({Key? key, required this.data}) : super(key: key);
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data["name"]}'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'name:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 10),
                Text(
                  '${data['name']}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            _infoRow(leadingText: 'accountName', dataText: data['username']),
            _infoRow(leadingText: 'email', dataText: data['email']),
            _infoRow(leadingText: 'phoneNumber', dataText: data['phone']),
          ],
        ),
      ),
    );
  }

  Row _infoRow({required String leadingText, required String dataText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${leadingText}',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(width: 10),
        Text(
          '${dataText}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

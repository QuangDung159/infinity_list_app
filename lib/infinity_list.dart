import 'package:flutter/material.dart';
import 'package:infinity_list_app/services/services.dart';

class InfinityList extends StatelessWidget {
  const InfinityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getListCommentFromAPI(1, 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Text('List'),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return const ListTile(
                leading: Text('asd'),
                title: Text(
                  'Hehe',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                isThreeLine: true,
                subtitle: Text('sub'),
              );
            },
            itemCount: 20,
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_app/blocs/comment_bloc.dart';
import 'package:infinity_list_app/models/comment.dart';

class InfinityList extends StatelessWidget {
  const InfinityList({Key? key}) : super(key: key);

  Widget renderList() {
    return BlocBuilder<CommentBloc, List<Comment>>(
        builder: (context, listComment) {
      return Expanded(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(
              listComment[index].email,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            isThreeLine: true,
            subtitle: Text(listComment[index].body),
          );
        },
        itemCount: listComment.length,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                context.read<CommentBloc>().setListComment(1);
              },
              child: const Text('Press')),
          renderList()
        ],
      ),
    );
  }
}

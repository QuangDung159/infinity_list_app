import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_app/blocs/comment_bloc.dart';
import 'package:infinity_list_app/models/comment.dart';

class InfinityList extends StatefulWidget {
  const InfinityList({Key? key}) : super(key: key);

  @override
  _InfinityListState createState() => _InfinityListState();
}

class _InfinityListState extends State<InfinityList> {
  int _start = 0;
  final _scrollController = ScrollController();

  Widget renderList() {
    return BlocBuilder<CommentBloc, List<Comment>>(
        builder: (context, listComment) {
      return NotificationListener(
        child: Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('${listComment[index].id}'),
              title: Text(
                listComment[index].email,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              isThreeLine: true,
              subtitle: Text(listComment[index].body),
            );
          },
          itemCount: listComment.length,
          controller: _scrollController,
        )),
        onNotification: (t) {
          if (t is ScrollEndNotification) {
            context.read<CommentBloc>().setListComment(_start + 20);
            setState(() {
              _start = _start + 20;
            });
          }
          return false;
        },
      );
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
                context.read<CommentBloc>().setListComment(_start);
              },
              child: const Text('Press')),
          renderList()
        ],
      ),
    );
  }
}

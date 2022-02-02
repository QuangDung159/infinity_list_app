import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_app/models/comment.dart';
import 'package:infinity_list_app/services/services.dart';

class CommentBloc extends Cubit<List<Comment>> {
  CommentBloc() : super([]);
  static const int pageSize = 20;

  void setListComment(page) async {
    print(page);
    List<Comment> listComment = await getListCommentFromAPI(page, pageSize);
    emit(List.from(state)..addAll(listComment));
    print(state);
  }
}

import 'package:equatable/equatable.dart';
import 'package:infinity_list_app/models/comment.dart';

abstract class CommentEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentFetchedEvent extends CommentEvent{
  
}
part of 'lists_bloc.dart';

abstract class ListsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Create extends ListsEvent {
  final String content;
  final String title;
  final Timestamp date;

 Create(this.content, this.title, this.date);
}

class GetData extends ListsEvent{
  GetData();
}

part of 'lists_bloc.dart';

@immutable
abstract class ListsState extends Equatable {}

class ListsAdding extends ListsState {
  @override
  List<Object?> get props => [];
}

class ListsAdded extends ListsState {
  String? id;
  ListsAdded(id);
  @override
  List<Object?> get props => [];
}

class ListsError extends ListsState {
  final String error;

  ListsError(this.error);
  @override
  List<Object?> get props => [error];
}

class ListsLoading extends ListsState {
  @override
  List<Object?> get props => [];
}

class ListsLoaded extends ListsState {
  List<Lists> data;
  ListsLoaded(this.data);
  @override
  List<Object?> get props => [];
}
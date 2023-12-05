import 'package:clippy/src/core_features/todo_list/application/reposetory/ListsRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/lists.dart';

part 'lists_event.dart';

part 'lists_state.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  final ListsRepo listsRepo;

  ListsBloc({required this.listsRepo}) : super(ListsLoading()) {
    on<Create>((event, emit) async {
      emit(ListsAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final id = await listsRepo.create(
            title: event.title, content: event.content, date: event.date);
        emit(ListsAdded(id));
      } catch (e) {
        emit(ListsError(e.toString()));
      }
    });

    on<GetData>((event, emit) async {
      emit(ListsLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final data = await listsRepo.get();
        emit(ListsLoaded(data));
      } catch (e) {
        emit(ListsError(e.toString()));
      }
    });
  }
}

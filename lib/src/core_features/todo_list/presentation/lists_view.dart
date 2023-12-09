import 'dart:convert';

import 'package:clippy/src/common_widgets/cards/simple_card.dart';
import 'package:clippy/src/core_features/todo_list/application/bloc/lists_bloc.dart';
import 'package:clippy/src/core_features/todo_list/data/model/lists.dart';
import 'package:clippy/src/core_features/todo_list/presentation/edit_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListsView extends StatefulWidget {
  const ListsView({Key? key}) : super(key: key);

  @override
  State<ListsView> createState() => _ListsViewState();
}

class _ListsViewState extends State<ListsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListsBloc>(context).add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<ListsBloc, ListsState>(
        builder: (context, state) {
          if (state is ListsLoaded) {
            List<Lists> data = state.data;
            return AlignedGridView.count(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(8),
              itemCount: data.length,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                var date = data[index].date.toDate();
                var formatDate = '${date.day}.${date.month}.${date.year}';
                var myJSON = jsonDecode(data[index].content);
                var description = Document.fromJson(myJSON).getPlainText(0, 20);
                return SimpleCard(
                  title: data[index].title.toString(),
                  description: description,
                  date: formatDate,
                  onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditList(
                          id: data[index].id,
                          title: data[index].title,
                          description: data[index].content,
                        ),
                      ),
                    )
                  },
                );
              },
            );
          } else if (state is ListsLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              blurRadius: 10,
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Material(
            color: Theme.of(context).primaryColor,
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditList(
                      title: 'Title',
                      description: null,
                    ),
                  ),
                )
              },
            ),
          ),
        ),
      ),
    );
  }
}

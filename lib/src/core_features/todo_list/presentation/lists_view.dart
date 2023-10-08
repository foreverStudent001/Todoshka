import 'package:clippy/src/common_widgets/cards/simple_card.dart';
import 'package:clippy/src/core_features/todo_list/presentation/edit_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListsView extends StatefulWidget {
  @override
  State<ListsView> createState() => _ListsViewState();
}

class _ListsViewState extends State<ListsView> {
  int listItemCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AlignedGridView.count(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8),
        itemCount: listItemCount,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return SimpleCard(
            title: 'Title',
            description: 'awf awf awf awglernbvknefe fes nfsej kseg',
            date: '10.08.2023',
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditList(
                    title: 'Title',
                    description: 'awf awf awf awglernbvknefe fes nfsej kseg',
                  ),
                ),
              )
            },
          );
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
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
                setState(() {
                  listItemCount = ++listItemCount;
                })
              },
            ),
          ),
        ),
      ),
    );
  }
}

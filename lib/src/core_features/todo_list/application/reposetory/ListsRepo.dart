import 'package:clippy/src/core_features/todo_list/data/model/lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListsRepo {
  final _firebaseCloud = FirebaseFirestore.instance.collection('lists');

  Future<String?> create({
    required String title,
    required String content,
    required Timestamp date,
  }) async {
    try {
      String? id;
      await _firebaseCloud.add({
        "title": title,
        "content": content,
        "date": date,
      }).then((value) =>
      {
        id = value.id
      });
      return id;
    } on FirebaseException catch (e) {
      print("Error adding to Lists: '${e.code}': ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  Future<List<Lists>> get() async {
    List<Lists> gottenList = [];
    try {
      final data = await FirebaseFirestore.instance.collection('lists').get();

      for (var element in data.docs) {
        var list = element.data();
        list['id'] = element.id;
        print(list);
        continue;
      }
      return gottenList;
    } on FirebaseException catch (e) {
      print("Error adding to Lists: '${e.code}': ${e.message}");
      return gottenList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> update({
    required String id,
    required Map<Object, Object?> list,
  }) async {
    try {
      await _firebaseCloud.doc(id).update(list);
    } on FirebaseException catch (e) {
      print("Error updating list: id: '$id' error code: '${e.code}': ${e.message}");
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

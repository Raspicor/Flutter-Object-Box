import 'package:flutter/material.dart';
import 'local_db.dart';
import 'user_entity.dart';
import 'objectbox.g.dart';

class ViewModel extends ChangeNotifier {
  late final Box<UserEntity> box;
  late final Store store;
  Future<void> init() async {
    final localDB = await LocalDB.create();
    store = localDB.store;
    box = store.box<UserEntity>();
  }

  void writeUser() {
    store.runInTransaction(TxMode.write, () {
      final user = UserEntity(
        userId: "my",
        userName: "name is",
        deptName: "object",
        tenantName: "box",
      );
      box.put(user);
    });
  }

  void readUser() {
    final users = box.getAll();
    if (users.isNotEmpty) {
      for (final user in users) {
        print(user.userId);
        print(user.userName);
        print(user.deptName);
        print(user.tenantName);
      }
    } else {
      print('no data');
    }
  }

  void deleteuser() {
    final users = box.getAll();
    for (var e in users) {
      if (e.userId == 'my') {
        box.remove(e.id);
      }
    }
    print(box.getAll());
  }
}

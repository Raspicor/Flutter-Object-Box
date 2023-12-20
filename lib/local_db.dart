import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'objectbox.g.dart';

class LocalDB {
  late final Store store;

  LocalDB._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }
  static Future<LocalDB> create() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = p.join(directory.path, "obx-demo-relations");
    final store = Store(getObjectBoxModel(), directory: path);
    return LocalDB._create(store);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

class CategoryProvider extends StateNotifier {
  CategoryProvider(super.state);

  Future<void> fetchDataCategory() async {
    final DatabaseReference _database = FirebaseDatabase.instance.ref();
    String _data = "Fetching data...";

    void fetchData() {
      _database.child("data").onValue.listen((event) {
        final data = event.snapshot.value;
        print(data);
      });
    }
  }
}

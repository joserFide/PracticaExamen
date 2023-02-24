import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDjgWlYW94gxxYEskz4JgVmtFZmk7IT83Q",
            authDomain: "modernazul-c3458.firebaseapp.com",
            projectId: "modernazul-c3458",
            storageBucket: "modernazul-c3458.appspot.com",
            messagingSenderId: "885027294102",
            appId: "1:885027294102:web:b0bcfb16d4b0fa32c3abb7",
            measurementId: "G-GED40R4CDG"));
  } else {
    await Firebase.initializeApp();
  }
}

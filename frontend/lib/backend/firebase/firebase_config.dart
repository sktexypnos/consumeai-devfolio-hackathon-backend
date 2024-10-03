import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCgpjbh9-LbdWW8BL2134p2RF62mPtOYLo",
            authDomain: "consumewise-435608.firebaseapp.com",
            projectId: "consumewise-435608",
            storageBucket: "consumewise-435608.appspot.com",
            messagingSenderId: "583144752239",
            appId: "1:583144752239:web:41f8387c922c8f3d56799a",
            measurementId: "G-0S2286S76B"));
  } else {
    await Firebase.initializeApp();
  }
}

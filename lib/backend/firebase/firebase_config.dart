import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBJM8RszWsUTeuSkdUKqJW4a8PtdmiGcA0",
            authDomain: "rb-news-93757.firebaseapp.com",
            projectId: "rb-news-93757",
            storageBucket: "rb-news-93757.firebasestorage.app",
            messagingSenderId: "769005976479",
            appId: "1:769005976479:web:b95ba92babc69715c79baa",
            measurementId: "G-NZ456QYYFD"));
  } else {
    await Firebase.initializeApp();
  }
}

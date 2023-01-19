import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    /// if you want configuration for web from here
    /// and fill your data from web's google-services.json file ///
    // if (KIsWeb) {
    //  // web
    // return const FirebaseOptions(
    // apiKey:'',
    // authDomain:'',
    // databaseURL:'',
    // projectId:'',
    // storageBucket:'',
    // messagingSenderId:'',
    // appId:'',
    // measurementId:''
    // );

    /// also if you want configuration forIOS from here
    /// and fill your data from IOS's google-service.json file ///
    // } else if (Platform.isIOS || Platform.isMacOS) {
    //  // ios and isMacOS
    // return const FirebaseOptions(
    // apiKey:'',
    // authDomain:'',
    // databaseURL:'',
    // projectId:'',
    // storageBucket:'',
    // messagingSenderId:'',
    // appId:'',
    // measurementId:'',
    // );
    // } else {
    // // Android
    /// To do change your data from google-services.json file///
    /// in this configuration we work for android only ///
    return const FirebaseOptions(
        appId: "1:761849461795:android:d0c82511c9290a0ba48596",
        apiKey: "AIzaSyDVVZBk7QR2DGFL4aS45VacBp-bSM_RzG0",
        projectId: "navasankalp-dd551",
        androidClientId:
            "761849461795-db0ct6s8hkmvbf4pphg9gnv1njrju461.apps.googleusercontent.com",
        messagingSenderId: "761849461795",
        authDomain: "navasankalp-dd551.firebaseapp.com");
    //}
  }
}

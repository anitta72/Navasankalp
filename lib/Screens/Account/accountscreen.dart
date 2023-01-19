import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/Account/editprofile_screen.dart';
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';
import 'package:flutter_application_1/Sharedprefs.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';
import 'package:flutter_application_1/model/accountmodel.dart';
import 'package:flutter_application_1/view_model/account_view_model.dart';
import 'package:flutter_application_1/view_model/auth_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../Repository/account_repository.dart';

class Account extends StatefulWidget {
  Account({
    super.key,
  });

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late AccountViewModel accountViewModel;
  late AuthViewModel authViewModel;
  String? user;
  String? dt;
  AccountRepository accountservice = AccountRepository();
  VideoPlayerController? controllerVideo;

  @override
  void initState() {
    // TODO: implement initState
    controllerVideo = VideoPlayerController.asset(
      'video/flag.mp4',
    )
      ..addListener(() {})
      ..initialize().then((_) {
        controllerVideo!.play();
        controllerVideo!.setLooping(true);
        setState(() {});
      });
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  File? image1;

  @override
  Widget build(BuildContext context) {
    authViewModel = Provider.of<AuthViewModel>(context);
    accountViewModel = Provider.of<AccountViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AppBar(
              flexibleSpace: controllerVideo != null &&
                      controllerVideo!.value.isInitialized
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: VideoPlayer(controllerVideo!),
                    )
                  : const SizedBox(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100)),
              ),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(
                      Icons.menu_sharp,
                      color: Colors.black,
                    ),
                  );
                },
              ),
              elevation: 0,
              backgroundColor: Colors.blue[100],
              title: const Text(
                "Account",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>  Notification()),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessageView()),
                    );
                  },
                  icon: const Icon(Icons.notifications_outlined),
                  color: Colors.black,
                ),
              ],
            ),
            Positioned(
              left: 110,
              bottom: -40,
              child: GestureDetector(
                onTap: () {
                  showimageSource(context);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: const BoxDecoration(border: Border()),
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black12),
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: image1 != null
                            ? ClipOval(
                                child: Image.file(
                                image1!,
                                fit: BoxFit.cover,
                              ))
                            : const Icon(
                                Icons.account_circle_outlined,
                                color: Colors.black,
                                size: 60,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      drawer: const Drawer(
        child: NavBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: accountViewModel.fetchAccount(SharedPrefs.phone),
            builder: (context, AsyncSnapshot<AccountModel> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black45)),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Name'),
                          Text(snapshot.data!.name.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black45)),
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Address"),
                            Text(snapshot.data!.address.toString()),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black45)),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mobile Number"),
                          Text(snapshot.data!.phoneNumber.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black45)),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Block committee"),
                          Text(snapshot.data!.block.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black45)),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mandalam Committee"),
                          Text(snapshot.data!.mandalam.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return EditProfileScreen(
                                  name: snapshot.data!.name.toString(),
                                  address: snapshot.data!.address.toString(),
                                  phone: user,
                                );
                              },
                            ));
                          },
                          child: Center(child: const Text("Edit"))),
                    )
                  ],
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey,
                ));
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> showimageSource(BuildContext context) async {
    if (Platform.isAndroid) {
      return showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: 130,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () async {
                  try {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image == null) {
                      return;
                    }
                    final imageTempororay = File(image.path);
                    // final imagePermaent = await saveImagePermantly(image.path);
                    setState(() {
                      image1 = imageTempororay;
                    });
                  } on PlatformException catch (e) {
                    debugPrint("failed to pick image:$e");
                  }

                  // Future<File> saveImagePermantly(String imagepath1) async {
                  //   final directory1 = await getApplicationDocumentsDirectory();
                  //   final name = imagepath1;
                  //   final image2 = File('${directory1.path}/$name');
                  //   return File(imagepath1).copy(image2.path);
                  // }

                  Navigator.of(context).pop(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("camera"),
                onTap: () async {
                  try {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (image == null) {
                      return;
                    }
                    final imageTempororay = File(image.path);
                    setState(() {
                      image1 = imageTempororay;
                    });
                  } on PlatformException catch (e) {
                    debugPrint("failed to pick image:$e");
                  }
                  Navigator.of(context).pop(ImageSource.camera);
                },
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    controllerVideo!.dispose();
  }
}

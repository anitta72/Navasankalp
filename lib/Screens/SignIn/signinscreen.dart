import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/HomeScreen/homescreen.dart';
import 'package:flutter_application_1/Screens/Login/login_control.dart';
import 'package:flutter_application_1/Screens/Login/login_services.dart';
import 'package:flutter_application_1/Screens/Payment/payment.dart';
import 'package:flutter_application_1/Sharedprefs.dart';
import 'package:flutter_application_1/model/authmodel.dart';
import 'package:flutter_application_1/model/blocklistmodel.dart';
import 'package:flutter_application_1/model/mandalamlistmodel.dart';
import 'package:flutter_application_1/view_model/auth_view_model.dart';
import 'package:flutter_application_1/view_model/blocks_view_model.dart';
import 'package:flutter_application_1/view_model/mandalam_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key, required this.phone}) : super(key: key);

  String phone;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late BlocksViewModel blocksViewModel;
  late MandalamViewModel mandalamViewModel;
  late AuthViewModel authViewModel;
  BlockModel? _selectedBlock;
  MandalamModel? _selectedMandalam;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await blocksViewModel.fetchBlock(context);
      await mandalamViewModel.mandalamList;
    });
  }

  // final formkey = GlobalKey<FormState>();

  BlockModel? selectedblock;
  // String? selectedList;
  MandalamModel? selectedmandalam;
  @override
  Widget build(BuildContext context) {
    blocksViewModel = Provider.of<BlocksViewModel>(context);
    mandalamViewModel = Provider.of<MandalamViewModel>(context);
    authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(child: Image.asset("images/Group 1131.png")),
                SizedBox(
                  height: 40,
                ),
                Text("Sign in",
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                Text("Please Sign in to continue",
                    style: TextStyle(fontSize: 11)),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: "Name",
                      labelStyle: TextStyle(fontSize: 12)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 40, 0, 40),
                    hintText: "Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black45)),
                  width: double.infinity,
                  child: Text(widget.phone),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black45)),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Block Commettee'),
                        blocksViewModel.showLoader
                            ? Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                child: CupertinoActivityIndicator(
                                  color: Colors.grey[600],
                                ))
                            : DropdownButton<BlockModel>(
                                items: blocksViewModel.blockList.map((block) {
                                  return DropdownMenuItem(
                                      value: block,
                                      child: Text(block.name.toString()));
                                }).toList(),
                                onChanged: (value) async {
                                  try {
                                    selectedblock = null;
                                    selectedblock = value;

                                    log(value!.name!);
                                    var data = await blocksViewModel.blockList
                                        .map((e) => e.id);
                                    mandalamViewModel.GetMandalamByBlock(
                                        value.id!, context);
                                    setState(() {
                                      selectedmandalam = null;
                                    });
                                  } catch (e) {
                                    log(e.toString());
                                  }
                                },
                                value: selectedblock,
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black45)),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mandalam \nCommittee"),
                      mandalamViewModel.loading
                          ? Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              child: CupertinoActivityIndicator(
                                color: Colors.grey[600],
                              ))
                          : DropdownButton<MandalamModel>(
                              items: mandalamViewModel.mandalamList
                                  .map((mandalamdata) {
                                return DropdownMenuItem(
                                  value: mandalamdata,
                                  child: Text(mandalamdata.name.toString()),
                                );
                              }).toList(),
                              onChanged: (value) async {
                                setState(() {
                                  selectedmandalam = value;
                                });
                                log(value!.name!);
                              },
                              value: selectedmandalam,
                            )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(130, 40)),
                      onPressed: () {
                        checksigin(context);
                      },
                      child: const Text("Next")),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Call customer care'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checksigin(BuildContext context) async {
    final name1 = _nameController.text;
    final address1 = _addressController.text;
    final phone1 = widget.phone;
    final block1 = selectedblock!.name.toString();
    final mandalam = selectedmandalam!.name.toString();

    if (name1.isNotEmpty &&
        address1.isNotEmpty &&
        phone1.isNotEmpty &&
        block1 != null &&
        mandalam != null) {
      LoginControll model = LoginControll(phonenumber: phone1);

      LoginServices login = LoginServices();
      await login.login(model.toJson());
      log(model.toJson().toString());
      var resp = await authViewModel.UpdateUserData(SignInModel(
          phoneNumber: phone1,
          userName: phone1,
          name: name1,
          address: address1,
          block: block1,
          mandalam: mandalam));

      if (phone1 != null || phone1.isNotEmpty) {
        final res = await SharedPreferences.getInstance();
        res.clear();
        res.setString("phone", phone1);
        log(res.getString("phone").toString());
        SharedPrefs.getPhone();
      }

      App(
        phone: phone1,
      );

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    }
  }
}

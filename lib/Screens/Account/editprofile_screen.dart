import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Screens/Account/accountscreen.dart';
import 'package:flutter_application_1/Screens/Login/login_screen.dart';
import 'package:flutter_application_1/Sharedprefs.dart';
import 'package:flutter_application_1/model/authmodel.dart';
import 'package:flutter_application_1/model/mandalamlistmodel.dart';
import 'package:flutter_application_1/view_model/auth_view_model.dart';
import 'package:flutter_application_1/view_model/blocks_view_model.dart';
import 'package:flutter_application_1/view_model/mandalam_view_model.dart';
import 'package:provider/provider.dart';

import '../../model/blocklistmodel.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen(
      {super.key,
      required this.phone,
      required this.name,
      required this.address});

  String? phone;
  String? name;
  String? address;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

final fomKey = GlobalKey<FormState>();

class _EditProfileScreenState extends State<EditProfileScreen> {
  late BlocksViewModel blocksViewModel;
  late MandalamViewModel mandalamViewModel;
  late AuthViewModel authViewModel;

  TextEditingController _nameController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  BlockModel? selectedblock;
  String? selectedList;
  MandalamModel? selectedmandalam;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await blocksViewModel.fetchBlock(context);
      await mandalamViewModel.mandalamList;
    });
  }

  @override
  Widget build(BuildContext context) {
    blocksViewModel = Provider.of<BlocksViewModel>(context);
    mandalamViewModel = Provider.of<MandalamViewModel>(context);
    authViewModel = Provider.of<AuthViewModel>(context);

    String? Name;
    String? Address;

    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/pic.png'), fit: BoxFit.fill)),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 270, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // SizedBox(
                //   height: 20,
                // ),
                // Center(child: Image.asset("images/Group 1131.png")),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: fomKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintText: "Enter new name",
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            labelStyle: TextStyle(fontSize: 12)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 40, 0, 40),
                          hintText: "Enter new address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Address';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(130, 40)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: const Size(130, 40)),
                        onPressed: () {
                          fomKey.currentState!.validate();

                          editprof(
                            _nameController.text,
                            _addressController.text,
                            selectedblock!.name.toString(),
                            selectedmandalam!.name.toString(),
                          );
                        },
                        child: const Text("Update")),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void editprof(
      String name, String address, String block, String mandalam) async {
    var resp = await authViewModel.UpdateUserData(SignInModel(
        phoneNumber: SharedPrefs.phone,
        userName: SharedPrefs.phone,
        name: name,
        address: address,
        block: block,
        mandalam: mandalam));

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Account()));
  }
}

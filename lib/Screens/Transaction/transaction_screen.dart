import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';
import 'package:flutter_application_1/Sharedprefs.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';
import 'package:flutter_application_1/view_model/transaction_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  late TransactionViewModal transactionViewModal;

  // TransactionModal? selectedtransaction;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      transactionViewModal.GetHistoryByPhone(SharedPrefs.phone, context);
      transactionViewModal.historyList;
    });
  }

  @override
  Widget build(BuildContext context) {
    transactionViewModal = Provider.of<TransactionViewModal>(context);
    List amount = transactionViewModal.historyList
        .map(
          (e) => e.amount,
        )
        .toList();
    List paymentId = transactionViewModal.historyList
        .map(
          (e) => e.paymentId,
        )
        .toList();
    List date = transactionViewModal.historyList
        .map(
          (e) => DateTime.tryParse(e.createdAt.toString()),
        )
        .toList();

    List status = transactionViewModal.historyList
        .map(
          (e) => e.status,
        )
        .toList();

    return Scaffold(
      drawer: const Drawer(
        child: NavBar(),
      ),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  return Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu_sharp,
                  color: Colors.black,
                ));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.blue[100],
        title: const Text(
          "Transaction",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessageView()),
              );
            },
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: transactionViewModal.loading
          ? Center(child: CupertinoActivityIndicator())
          : transactionViewModal.TextLoading
              ? Center(
                  child: Text(
                  "No Transactions Done Yet........",
                  style: TextStyle(fontSize: 20),
                ))
              : ListView.builder(
                  itemCount: transactionViewModal.historyList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 8, right: 8, bottom: 2),
                      child: Card(
                        elevation: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 130,
                          width: double.infinity,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Payment ID:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        paymentId[index],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Status:",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            status[index],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color:
                                                    status[index] == "Success"
                                                        ? Colors.green
                                                        : Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Amount:",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              amount[index],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Date:",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        DateFormat('dd-MM-yyyy E').format(
                                          date[index],
                                        ),
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

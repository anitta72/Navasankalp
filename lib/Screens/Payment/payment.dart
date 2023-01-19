import 'dart:developer';
import "package:flutter/material.dart";
import 'package:flutter_application_1/Screens/Notification/notification_details.dart';
import 'package:flutter_application_1/Screens/Transaction/transaction_screen.dart';
import 'package:flutter_application_1/Sharedprefs.dart';
import 'package:flutter_application_1/Widgets/Navbar/navbarscreen.dart';
import 'package:flutter_application_1/view_model/payment_view_model.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class App extends StatelessWidget {
  App({Key? key, this.phone}) : super(key: key);

  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: NavBar(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu_sharp,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessageView()),
              );
            },
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Payment(),
    );
  }
}

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

final fomKey = GlobalKey<FormState>();

class _PaymentState extends State<Payment> {
  late PaymentViewModel paymentModal;
  TextEditingController _Amountcontroller = TextEditingController();
  Razorpay _razorpay = Razorpay();
  @override
  void initState() {
    SharedPrefs.getPhone();

    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    paymentModal = Provider.of<PaymentViewModel>(context);

    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/paymenttt.png'), fit: BoxFit.fill)),
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Form(
              key: fomKey,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _Amountcontroller,
                decoration: InputDecoration(
                  hintText: "Enter a amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        width: 5, color: Color.fromARGB(255, 95, 99, 98)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Amount';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        fomKey.currentState!.validate();
                        openCheckOut();

                        log('Api hit');
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                      child: const Text("Pay Now")),
                  ElevatedButton(
                      onPressed: () async {
                        await SharedPrefs.getPhone();

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TransactionScreen(),
                        ));
                      },
                      child: const Text("Transaction \nScreen"))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  void openCheckOut() async {
    if (_Amountcontroller.text.isEmpty) {
      return;
    }

    var options = {
      'key': 'rzp_live_odrmJ2TVl6Ux2P',
      'amount': (double.parse(_Amountcontroller.text) * 100.roundToDouble())
          .toString(),
      'name': 'Navasagalp',
      'description': '',
      'prefill': {'contact': '${SharedPrefs.phone}', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  PaymentSuccessResponse? response;
  String successresponsepid = "";
  String failureresponsepid = "";

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log(response.paymentId.toString());

    setState(() {
      successresponsepid = response.paymentId.toString();
    });

    paymentModal.paymentResponse.paymentId = response.paymentId;
    paymentModal.paymentResponse.status = "Success";
    paymentModal.paymentResponse.amount = _Amountcontroller.text;
    await paymentModal.payment(context);
    log('Api hit');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        content: Text("Payment Success${response.paymentId}"),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    log(response.message.toString());
    log(response.code.toString());
    log(response.error.toString());

    setState(() {
      failureresponsepid = response.code.toString();
    });
    paymentModal.paymentResponse.paymentId = response.error!["reason"];
    paymentModal.paymentResponse.status = "Failure";
    paymentModal.paymentResponse.amount = _Amountcontroller.text;
    await paymentModal.payment(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        content: Text("Payment Failed  ${response.message}"),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}

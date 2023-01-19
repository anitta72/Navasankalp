// ignore_for_file: require_trailing_commas

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// Message route arguments.
class MessageArguments {
  /// The RemoteMessage
  final RemoteMessage message;

  /// Whether this message caused the application to open.
  final bool openedApplication;

  // ignore: public_member_api_docs
  MessageArguments(this.message, this.openedApplication);
}

/// Displays information about a [RemoteMessage].
class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late MessageArguments? args;
    late RemoteMessage? message;
    late RemoteNotification? notification;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      args = ModalRoute.of(context)?.settings.arguments as MessageArguments;
      message = args.message;
      notification = message.notification;
    } else {
      message = null;
      notification = null;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.blue[200],
        elevation: 0,
        // message.data != null ? message.data.toString() : "No Messages"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            if (notification != null) ...[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    img(
                      notification.android!.imageUrl,
                    ),
                    const Text(
                      'Notification Inf:',
                      style: TextStyle(fontSize: 18),
                    ),
                    viewData(
                      'Title',
                      notification.title,
                    ),
                    viewData(
                      'Body',
                      notification.body,
                    ),
                    viewData(
                        'Sent Time',
                        message?.sentTime != null
                            ? message?.sentTime.toString()
                            : "Time"),
                  ],
                ),
              )
            ],
          ],
        ),
      )),
    );
  }

  /// A single data row.
  Widget viewData(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value ?? 'N/A',
            ),
          ),
        ],
      ),
    );
  }

  Widget img(String? value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: Center(
          child: Image.network(
            value ??
                'https://img.icons8.com/bubbles/2x/appointment-reminders.png',
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget appbar(String? value) {
    return Text(
      value ?? 'N/A',
      style: const TextStyle(fontSize: 16),
    );
  }
}
// TODO Implement this library.
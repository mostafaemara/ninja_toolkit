import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:ninja_toolkit/widgets/note_box.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum PageStatus { loading, success, error }

class NetFlowPage extends StatelessWidget {
  final PageStatus status;
  final String errorMessage;
  final String? disconnectionMessage;
  final Widget child;
  final VoidCallback? onRetry;
  final VoidCallbackAction? onReconnect;

  const NetFlowPage(
      {super.key,
      this.disconnectionMessage,
      required this.status,
      required this.errorMessage,
      required this.child,
      this.onRetry,
      this.onReconnect});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          final isConnectedToInternet =
              snapshot.data?.contains(ConnectivityResult.none) == false;

          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: status == PageStatus.error && (isConnectedToInternet)
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(70),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: NoteBox.error(note: errorMessage),
                    ),
                  )
                : null,
            body: Stack(
              children: [
                Skeletonizer(
                    enabled: status != PageStatus.success, child: child),
                if (disconnectionMessage != null && (!isConnectedToInternet))
                  Center(child: Text(disconnectionMessage!)),
              ],
            ),
          );
        });
  }
}

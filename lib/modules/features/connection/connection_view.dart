import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:train_venturo/config/themes/color.dart';
import 'package:train_venturo/constant/core/assets_const/assets_const.dart';
import 'package:train_venturo/shared/customs/background.dart';
import 'package:train_venturo/shared/customs/primary_text_style.dart';

class ConnectionView extends StatefulWidget {
  final Widget child;
  const ConnectionView({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ConnectionView> createState() => _ConnectionViewState();
}

class _ConnectionViewState extends State<ConnectionView> {
  ConnectivityResult? _connectivityResult;
  late StreamSubscription _connectivitySubscription;

  @override
  initState() {
    super.initState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        _connectivityResult = result;
      });
    });
  }

  @override
  dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return _connectivityResult == ConnectivityResult.none ||
            _connectivityResult == null
        ? Background(
            top: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 190),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      "${AssetsUrl.imgUrl}ic_no_connection.png",
                      scale: 3.5,
                    ),
                  ),
                  const PrimaryTextStyle(
                    size: 26,
                    content: 'No Connection',
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          )
        : widget.child;
  }
}

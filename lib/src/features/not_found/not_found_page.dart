import 'package:flutter/material.dart';

import 'package:flutter_wisy_app/src/features/not_found/empty_placeholder_widget.dart';
import 'package:flutter_wisy_app/src/localization/string_hardcoded.dart';

/// Simple not found page used for 404 errors (page not found)
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyPlaceholderWidget(
        message: '404 - Page not found!'.hardcoded,
      ),
    );
  }
}

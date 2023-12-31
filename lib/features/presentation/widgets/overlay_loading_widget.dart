import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class OverlayLoadingWidget {
  static OverlayEntry? loader;

  void showLoader(BuildContext context) {
    if (loader != null) {
      // Loader is already running
      return;
    }
    final OverlayState? overlayState = Overlay.of(context);
    loader = OverlayEntry(
        builder: (context) => const Material(
              type: MaterialType.transparency,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColour),
                    strokeWidth: 4.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ));
    overlayState!.insert(loader!);
  }

  void hideLoader() {
    if (loader != null) {
      loader!.remove();
      loader = null;
    }
  }
}

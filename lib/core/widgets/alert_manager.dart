import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../theme/app_style.dart';

enum _ToastMode { success, error }

Widget _buildDialog(_ToastMode mode, String message) {
  return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          decoration: BoxDecoration(
              color: AppStyle.colors.darkGrey,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: AppStyle.colors.borderColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (mode == _ToastMode.success)
                Icon(Icons.check_circle_outline, color: AppStyle.colors.green),
              if (mode == _ToastMode.error)
                const Icon(Icons.cancel_outlined, color: Colors.red),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Text(message, style: AppStyle.text.tiny),
              ),
            ],
          )));
}

/// This class is responsible for any modal alert that is displayed on screen.
/// This will include alerts that will disappear after specified amount of time.
class AlertManager {
  /// Convinience method for showing error messages
  static void showErrorMessage(String message, BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showToastWidget(_buildDialog(_ToastMode.error, message),
          context: context,
          animation: StyledToastAnimation.slideFromBottomFade,
          reverseAnimation: StyledToastAnimation.slideToBottomFade,
          dismissOtherToast: false,
          duration: const Duration(seconds: 5));
    });
  }

  /// Convinience method for showing success messages
  static void showSuccessMessage(String message, BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showToastWidget(_buildDialog(_ToastMode.success, message),
          context: context,
          animation: StyledToastAnimation.slideFromBottomFade,
          reverseAnimation: StyledToastAnimation.slideToBottomFade,
          dismissOtherToast: false,
          duration: const Duration(seconds: 5));
    });
  }

  // /// Display the Out Of Fuel modal overlay on the screen
  // static void disclaimerPopup(context, {required Function() onSuccess}) {
  //   ToastFuture disclaimerToast;
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     Widget outOfFuelModal = DisclaimerModal(onBackgroundTap: () {
  //       AlertManager.dismiss(disclaimerToast);
  //     }, onSuccess: () {
  //       AlertManager.dismiss(disclaimerToast);
  //       if (onSuccess != null) {
  //         onSuccess();
  //       }
  //     });

  //     disclaimerToast = showToastWidget(outOfFuelModal,
  //         context: context,
  //         animation: StyledToastAnimation.fadeScale,
  //         reverseAnimation: StyledToastAnimation.fadeScale,
  //         isIgnoring: false,
  //         duration: Duration.zero);
  //   });
  // }

  static void dismiss(ToastFuture t) {
    ToastManager()
        .toastSet
        .toList()
        .firstWhere(
          (v) => v == t,
        )
        .dismiss(showAnim: true);
  }

  static void dismissAll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ToastManager().dismissAll(showAnim: true);
    });
  }
}

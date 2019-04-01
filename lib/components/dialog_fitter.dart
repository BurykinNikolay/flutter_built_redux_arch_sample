
// widget that keeps dialog in the center of visible area
import 'package:flutter/widgets.dart';

class DialogFitter extends StatelessWidget {
  final Widget child;
  final double verticalSpacing;

  DialogFitter({
    Key key,
    this.child,
    this.verticalSpacing = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets + mediaQuery.padding,
        duration: const Duration(milliseconds: 300),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: calculateMaxDialogHeight(mediaQuery)
          ),
          child: child,
        )
    );
  }

  double calculateMaxDialogHeight(MediaQueryData mediaQuery) {
    var screenHeight = mediaQuery.size.height;
    var keyboardHeight = mediaQuery.viewInsets.bottom;
    var systemBarHeight = mediaQuery.padding.top;
    return screenHeight - keyboardHeight - systemBarHeight - verticalSpacing;
  }

}
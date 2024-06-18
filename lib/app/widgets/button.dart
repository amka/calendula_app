import 'package:calendula_app/app/app_config.dart';
import 'package:flutter/material.dart';


enum ButtonVariant {
  base,
  primary,
  secondary,
  transparent,
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onTap,
    this.text,
    this.icon,
    this.variant = ButtonVariant.base,
    this.loading = false,
  });

  final Function()? onTap;
  final String? text;
  final IconData? icon;
  final ButtonVariant variant;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.primary;
    var textColor = Theme.of(context).colorScheme.onPrimary;
    var fontWeight = FontWeight.w400;
    var fontSize = 16.0;

    switch (variant) {
      case ButtonVariant.base:
        color = Theme.of(context).colorScheme.surface;
        textColor = Theme.of(context).colorScheme.onSurfaceVariant;
        break;
      case ButtonVariant.primary:
        color = Theme.of(context).colorScheme.primary;
        textColor = Theme.of(context).colorScheme.onPrimary;
        break;
      case ButtonVariant.secondary:
        color = Theme.of(context).colorScheme.secondary;
        textColor = Theme.of(context).colorScheme.onSecondary;
        break;
      case ButtonVariant.transparent:
        color = Colors.transparent;
        textColor = Theme.of(context).colorScheme.onSurface;
        break;
    }

    return MaterialButton(
      onPressed: loading ? null : onTap,
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConfig.borderRadius)
      ),
      elevation: 0,
      focusElevation: 0,
      color: color,
      disabledColor: color.withAlpha(160),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: textColor.withAlpha(200),
                  strokeWidth: 2,
                ),
              ),
            if (!loading && icon != null)
              Icon(
                icon,
                color: textColor,
              ),
            if (!loading && text != null)
              Text(
                text!,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

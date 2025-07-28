import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? customColor;

  final IconData? leftIcon;
  final VoidCallback? onLeftIconTap;

  final IconData? rightIcon;
  final VoidCallback? onRightIconTap;

  final Color? iconColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.customColor,
    this.leftIcon,
    this.onLeftIconTap,
    this.rightIcon,
    this.onRightIconTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        decoration: BoxDecoration(
          color: customColor ?? AppColors.backgroundLight,
        ),
        child: Row(
          children: [
            // Left Icon
            SizedBox(
              width: 56,
              child:
                  leftIcon != null
                      ? IconButton(
                        icon: Icon(
                          leftIcon,
                          color: iconColor ?? AppColors.backgroundDark,
                        ),
                        onPressed: onLeftIconTap,
                      )
                      : null,
            ),

            // Title
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.backgroundDark,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            // Right Icon
            SizedBox(
              width: 56,
              child:
                  rightIcon != null
                      ? IconButton(
                        icon: Icon(
                          rightIcon,
                          color: iconColor ?? AppColors.backgroundDark,
                        ),
                        onPressed: onRightIconTap,
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}
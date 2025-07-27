import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Search/presentation/search_delegate.dart';
import '../../../common_ui/Widgets/cart_icon_design.dart';
import '../../../constants/colors.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 24,top: 24),
      child: Container(
        height: 72,
        child: Row(
          children: [
            ImageIcon(AssetImage("assets/Images/Left Button.png"),color: EColors.primary,),
            SizedBox(width: 8,),
            Container(
              width: 299,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color.fromRGBO( 229,232,255,1),
              ),
              child: SearchBar(
                elevation: WidgetStatePropertyAll<double>(0),
                leading: ImageIcon(AssetImage('assets/Images/Search.png')),
                hintText: 'Search',
                hintStyle: WidgetStateProperty.resolveWith<TextStyle?>(
                      (Set<WidgetState> states) {
                    return TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(72);
}

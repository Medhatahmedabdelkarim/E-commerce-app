import 'package:demo_app/Search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import '../../../common_ui/Widgets/cart_icon_design.dart';
import '../../../constants/colors.dart';

class CategoryItemAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoryItemAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Container(
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: ImageIcon(
                AssetImage("assets/Images/Left Button.png"),
                color: EColors.primary,
              ),
            ),
            Container(
              width: 253,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color.fromRGBO(229, 232, 255, 1),
              ),
              child: SearchBar(
                elevation: WidgetStatePropertyAll<double>(0),
                leading: ImageIcon(AssetImage('assets/Images/Search.png')),
                hintText: 'Search',
                hintStyle: WidgetStateProperty.resolveWith<TextStyle?>((
                  Set<WidgetState> states,
                ) {
                  return TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  );
                }),
                onTap: () {
                  MaterialPageRoute(
                    builder: (_) => SearchScreen(fromNavMenu: true),
                  );
                },
              ),
            ),

            Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: 36,
                    width: 36,
                    child: Image.asset('assets/Images/Heart Outlined.png'),
                  ),
                ),
                CartIconDesign(),
              ],
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

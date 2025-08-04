import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../navigation/Bloc/navigation_bloc.dart';
import '../manager/search_bloc.dart';
import '../screens/search_screen.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({super.key, required this.fromNavMenu});

  final bool fromNavMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Container(
        height: 72,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (fromNavMenu) {
                  // Navigate to Home tab in bottom navigation
                  context.read<NavigationBloc>().add(OnChangeNav(tabIndex: 0));
                } else {
                  // Just pop normally
                  Navigator.of(context).pop();
                }
              },
              child: ImageIcon(
                AssetImage("assets/Images/Left Button.png"),
                color: EColors.primary,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 299,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color.fromRGBO(229, 232, 255, 1),
              ),
              child: SearchBar(
                onTap: () {
                  Get.to(() => SearchScreen(fromNavMenu: fromNavMenu));
                },
                onChanged: (query) {
                  context.read<SearchBloc>().add(SearchQueryChanged(query));
                },
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    context.read<SearchBloc>().add(
                      SearchSubmitted(value.trim()),
                    );
                  }
                },
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

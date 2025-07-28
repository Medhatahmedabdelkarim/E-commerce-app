import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constants/colors.dart';
import '../manager/search_bloc.dart';
import '../screens/search_screen.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Container(
        height: 72,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: ImageIcon(
                AssetImage("assets/Images/Left Button.png"),
                color: EColors.primary,
              ),
            ),
            SizedBox(width: 8),
            Container(
              width: 299,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color.fromRGBO(229, 232, 255, 1),
              ),
              child: SearchBar(
                onTap: () {
                  Get.to(() => SearchScreen());
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
                autoFocus: true,
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

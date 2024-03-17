import 'package:app_music/colors.dart';
import 'package:flutter/material.dart';

class SidebarComponent extends StatelessWidget {
  const SidebarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rhythmics',
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey2,
                  ),
                ),
              ),
            ),
            ...[
              // Menu
              {'name': 'Menu', 'is_category': true},
              {'name': 'Home', 'is_category': false},
              {'name': 'Search', 'is_category': false},
              {'name': 'Radio', 'is_category': false},
              {'name': 'Podcast', 'is_category': false},
              {'name': 'Music', 'is_category': false},
              {'name': 'Music Videos', 'is_category': false},
              {'name': 'Favorites', 'is_category': false},

              {'spacing': 15.0},

              // Organizations
              {'name': 'Organizations', 'is_category': true},
              {'name': 'About us', 'is_category': false},
              {'name': 'Security', 'is_category': false},
              {'name': 'Help', 'is_category': false},
              {'name': 'Settings', 'is_category': false},

              {'spacing': 100.0},
            ].map((e) {
              if (e.containsKey('spacing')) {
                return SizedBox(height: e['spacing'] as double);
              }

              return InkWell(
                onTap: e['is_category'] == true ? null : () {},
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      e['name'] as String,
                      style: TextStyle(
                        fontSize: 16,
                        color: e['is_category'] == true
                            ? AppColors.grey1
                            : AppColors.grey2,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

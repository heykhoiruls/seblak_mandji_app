import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../components/components_transition.dart';
import '../components/components_list_kids.dart';
import '../components/components_row.dart';
import '../configs/config_apps.dart';
import '../models/model_controller.dart';
import 'page_kids/page_kids_add.dart';

// home sebagai kasir

class PageHome extends StatefulWidget {
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<String>? onSearchTextChanged;
  const PageHome({
    super.key,
    this.onFocusChange,
    this.onSearchTextChanged,
  });

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  String _searchText = '';
  ModelController user = ModelController();
  int selectedCategoryIndex = 0;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: defaultSize * 2),
            ComponentsRow(
              textHint: "Cari Menu . . .",
              icon: const LineIcon.plus(color: colorAccent),
              onFocusChange: (hasFocus) {
                setState(() {
                  _isFocused = hasFocus;
                });
                widget.onFocusChange?.call(_isFocused);
              },
              onTap: () {
                Navigator.push(
                  context,
                  transitionRight(const PageKidsAdd()),
                );
              },
              onSearchTextChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
              isChat: false,
            ),
            const SizedBox(height: defaultSize),
            ComponentsListKids(
              searchText: _searchText,
            ),
          ],
        ),
      ),
    );
  }
}

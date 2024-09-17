import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class MyAnimSearchBar extends StatelessWidget {
  const MyAnimSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
      searchIconColor: Colors.purple,
      width: MediaQuery.of(context).size.width - 55,
      textController: TextEditingController(),
      onSuffixTap: () {},
      onSubmitted: (String) {},
      helpText: "ابحث عن المادة التي تريدها...",
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
      closeSearchOnSuffixTap: true,
      animationDurationInMilli: 600,
      rtl: true,
    );
  }
}

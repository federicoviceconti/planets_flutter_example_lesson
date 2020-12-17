import 'package:flutter/material.dart';
import 'package:project_example/constants/app_colors.dart';

class SearchInputWidget extends StatelessWidget {
  final Function(String) onTextChanged;
  final TextEditingController textController;

  const SearchInputWidget({
    Key key,
    this.onTextChanged,
    this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: TextField(
        maxLines: 1,
        autocorrect: false,
        controller: textController,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: AppColors.lightBlack,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(color: AppColors.lightBlack),
          border: InputBorder.none,
          counterText: "",
        ),
        onChanged: (value) {
          if (onTextChanged != null) {
            onTextChanged(value);
          }
        },
      ),
    );
  }
}

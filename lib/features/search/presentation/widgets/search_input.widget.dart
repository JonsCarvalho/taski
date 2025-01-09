import 'package:flutter/material.dart';
import 'package:task_list/core/constants/custom_colors.constant.dart';
import 'package:task_list/core/constants/strings.constant.dart';

class SearchInput extends StatefulWidget {
  final Function(String)? onChanged;

  const SearchInput({super.key, this.onChanged});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final focusNode = FocusNode();
  bool isFocused = false;
  final controller = TextEditingController();

  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Center(
        child: Builder(builder: (context) {
          return TextFormField(
            focusNode: focusNode,
            onTap: () {
              focusNode.requestFocus();
            },
            onTapOutside: (event) {
              focusNode.unfocus();
            },
            controller: controller,
            cursorColor: CustomColors.blue,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: CustomColors.slatePurple,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              fillColor: CustomColors.paleWhite,
              hintText: Strings.searchInputHint,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CustomColors.mutedAzure,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: CustomColors.blue.withValues(alpha: .5),
                  width: 3,
                ),
              ),
              prefixIcon: Icon(Icons.search),
              prefixIconColor:
                  isFocused ? CustomColors.blue : CustomColors.mutedAzure,
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                  widget.onChanged?.call('');
                },
                icon: Icon(Icons.close_rounded, size: 18),
              ),
              suffixIconColor: isFocused
                  ? CustomColors.slatePurple
                  : CustomColors.mutedAzure,
            ),
            onChanged: widget.onChanged,
          );
        }),
      ),
    );
  }
}

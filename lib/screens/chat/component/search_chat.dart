import 'package:flutter/material.dart';

class SearchChat extends StatefulWidget {
  final Function(String) onChanged;
  const SearchChat({required this.onChanged});

  @override
  State<SearchChat> createState() => _SearchChatState();
}

class _SearchChatState extends State<SearchChat> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(Icons.search_rounded, size: 20,),
          ),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 14, color: Color(0xff999999)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
              borderRadius: BorderRadius.circular(20)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600),
              borderRadius: BorderRadius.circular(20)
          )
      ),
      onChanged: widget.onChanged,
    );
  }
}

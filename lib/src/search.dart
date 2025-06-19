import 'dart:async';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final Function(String text) onSearchChanged;
  final String? searchValue;
  final String? placeholder;

  const Search({
    super.key,
    required this.onSearchChanged,
    this.searchValue,
    this.placeholder,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearchChanged(_controller.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.text = widget.searchValue ?? '';
    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.removeListener(_onSearchChanged);
    _controller.dispose(); // good practice
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged:
          (_) => setState(() {}), // supaya clear button muncul saat ngetik
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon:
            _controller.text.isNotEmpty
                ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    _onSearchChanged();
                  },
                )
                : null,
        hintText:
            '${widget.placeholder != null ? ' ${widget.placeholder}' : 'Search'}...',
      ),
    );
  }
}

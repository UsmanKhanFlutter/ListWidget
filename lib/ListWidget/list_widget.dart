import 'package:flutter/material.dart';
import 'package:list_task/ListWidget/list_item_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  ListWidgetState createState() => ListWidgetState();
}

class ListWidgetState extends State<ListWidget> {
  late ScrollController _scrollController;
  late List<int> counts;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    counts = List.generate(100, (index) => 0);
    _loadCounts();
  }

  Future<void> _loadCounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < counts.length; i++) {
        counts[i] = prefs.getInt('count_$i') ?? 0;
      }
    });
  }

  Future<void> _saveCounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < counts.length; i++) {
      await prefs.setInt('count_$i', counts[i]);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _saveCounts();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: counts.length,
      itemBuilder: (context, index) {
        return ListItemWidget(
          count: counts[index],
          onCountChanged: (newCount) {
            setState(() {
              counts[index] = newCount;
            });
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  final int count;
  final ValueChanged<int> onCountChanged;

  const ListItemWidget({
    super.key,
    required this.count,
    required this.onCountChanged,
  });

  @override
  ListItemWidgetState createState() => ListItemWidgetState();
}

class ListItemWidgetState extends State<ListItemWidget> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(count.toString()),
          MaterialButton(
            onPressed: () {
              setState(() {
                count++;
                widget.onCountChanged(count);
              });
            },
            child: const Text("+"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SummaryBox extends StatefulWidget {
  final String title;
  final List<SummaryBoxItem> summaryBoxItems;
  const SummaryBox({
    super.key,
    required this.title,
    required this.summaryBoxItems,
  });

  @override
  State<SummaryBox> createState() => _SummaryBoxState();
}

class _SummaryBoxState extends State<SummaryBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 10,
        color: Colors.grey.shade100,
        shadowColor: Colors.grey.withOpacity(0.1),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              title(),
              const SizedBox(
                height: 8,
              ),
              detailList()
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Text(
        widget.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget detailList() {
    return Column(
        children: widget.summaryBoxItems.map((e) {
      return DetailItem(summaryBoxItem: e);
    }).toList());
  }
}

class DetailItem extends StatefulWidget {
  final SummaryBoxItem summaryBoxItem;
  const DetailItem({
    super.key,
    required this.summaryBoxItem,
  });

  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  bool bold = false;
  TextStyle active = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  TextStyle inActive = const TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTapDown: (details) {
      //   setState(() {
      //     bold = true;
      //   });
      // },
      // onTapCancel: () {
      //   setState(() {
      //     bold = false;
      //   });
      // },
      // onTap: () {
      //   setState(() {
      //     // bold = false;
      //   });
      // },

      onPanDown: (details) {
        setState(() {
          bold = true;
        });
      },
      onPanCancel: () {
        setState(() {
          bold = false;
        });
      },

      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.summaryBoxItem.title, style: bold ? active : inActive),
            Text(widget.summaryBoxItem.value + " " + widget.summaryBoxItem.unit, style: bold ? active : inActive),
          ],
        ),
      ),
    );
  }
}

class SummaryBoxItem {
  String title;
  String value;
  String unit;
  SummaryBoxItem({required this.title, required this.value, required this.unit});
}

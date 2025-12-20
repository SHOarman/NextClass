import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom3TabButton extends StatelessWidget {
  final List<String> tabs;
  final RxInt selectedIndex;
  final Function(int)? onTabChanged;

  const Custom3TabButton({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedIndex.value == index;

        return Obx(() => GestureDetector(
          onTap: () {
            selectedIndex.value = index;
            if (onTabChanged != null) onTabChanged!(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xff2563EB) : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
      }),
    );
  }
}

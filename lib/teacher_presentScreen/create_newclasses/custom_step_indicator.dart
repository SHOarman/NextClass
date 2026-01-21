import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepTap;
  final List<String> titles;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.onStepTap,
    required this.titles,
  }) : assert(titles.length == 3, "You must provide exactly 3 titles");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, // Enough height for circle + text
      child: Stack(
        children: [
          /// LINE / SLIDER
          Positioned(
            top: 14, // align with circle center
            left: 14,
            right: 14,
            child: Row(
              children: List.generate(2, (index) {
                // There are 3 circles → 2 lines between
                bool isActive = currentStep > index;
                return Expanded(
                  child: Container(
                    height: 3,
                    color: isActive ? Colors.blue : Colors.grey.shade300,
                  ),
                );
              }),
            ),
          ),

          /// CIRCLES + TEXT
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              final bool isCircleActive = index <= currentStep;

              return GestureDetector(
                onTap: () => onStepTap(index),
                child: Column(
                  children: [
                    /// Circle
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCircleActive
                            ? Colors.blue
                            : Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// Text under circle
                    Text(
                      titles[index],
                      style: TextStyle(
                        color: currentStep >= index ? Colors.blue : Colors.grey,
                        fontWeight: currentStep == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

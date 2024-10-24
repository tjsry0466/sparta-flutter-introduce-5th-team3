import 'package:flutter/material.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/AppStyle.dart';
import 'package:introduce_sprta_flutter_3_team/components/common/HexagonSkillChart.dart';

class CapabilitySection extends StatelessWidget {
  final Map<String, double> capabilities;

  const CapabilitySection({
    Key? key,
    required this.capabilities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.sectionPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('나의 역량형', style: AppStyles.sectionTitle),
          Center(
            child: HexagonSkillChart(
              skillValues: capabilities.values.toList(),
              skillLabels: capabilities.keys.toList(),
            ),
          ),
        ],
      ),
    );
  }
}

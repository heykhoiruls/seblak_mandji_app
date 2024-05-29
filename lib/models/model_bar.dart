class ComponentsIndividualBar {
  final int x;
  final double height;
  final double weight;
  const ComponentsIndividualBar({
    required this.x,
    required this.height,
    required this.weight,
  });
}

class Bar {
  final List<double> heights;
  final List<double> weights;

  Bar({
    required this.heights,
    required this.weights,
  }) {
    if (heights.length != weights.length) {
      throw ArgumentError("Heights and weights must have the same length.");
    }
    if (heights.length < 12) {
      heights.addAll(List.filled(12 - heights.length, 0));
    }
    if (weights.length < 12) {
      weights.addAll(List.filled(12 - weights.length, 0));
    }
  }

  List<ComponentsIndividualBar> dataBar = [];

  void initialDataBar() {
    if (heights.isEmpty) {
      throw StateError("Heights list is empty.");
    }
    if (weights.isEmpty) {
      throw StateError("Weights list is empty.");
    }

    int startValue = 1;

    if (heights.length > 12) {
      startValue = heights.length - 11;
    }

    int offset = startValue - 1;

    for (int i = 0; i < 12; i++) {
      int dataIndex = offset + i;
      if (dataIndex < heights.length) {
        dataBar.add(
          ComponentsIndividualBar(
            x: dataIndex + 1,
            height: heights[dataIndex],
            weight: weights[dataIndex],
          ),
        );
      } else {
        dataBar.add(
          ComponentsIndividualBar(
            x: i + 1,
            height: 0,
            weight: 0,
          ),
        );
      }
    }
  }
}

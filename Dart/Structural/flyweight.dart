import 'dart:math';

/// Class representing the intrinsic state of a tree type
class TreeType {
  TreeType({required this.name, required this.color});

  final String name;
  final String color;

  void draw(int x, int y) {
    print('$color $name at ($x, $y).');
  }
}

/// Class Factory to manage and create tree types (Flyweight Factory)
class TreeTypeFactory {
  static Map<String, TreeType> treeTypes = {};

  TreeType getTreeType({required String name, required String color}) {
    String key = '$name-$color';
    TreeType? result = treeTypes[key];

    if (result == null) {
      result = TreeType(name: name, color: color);
      treeTypes[key] = result;
    }

    return result;
  }
}

/// Class representing the extrinsic state of a tree
class Tree {
  Tree({required this.x, required this.y, required this.type});

  final int x;
  final int y;
  final TreeType type;

  void draw() {
    type.draw(x, y);
  }
}

/// Class to create trees and manage the forest
class Forest {
  List<Tree> _trees = [];

  void plantTree({
    required int x,
    required int y,
    required String name,
    required String color,
  }) {
    TreeType type = TreeTypeFactory().getTreeType(name: name, color: color);
    Tree tree = Tree(x: x, y: y, type: type);
    _trees.add(tree);
  }

  void paint() {
    _trees.forEach((tree) => tree.draw());
  }
}

void main() {
  final random = Random();
  final types = ['Willow', 'Maple', 'Black Berry', 'Magnolia', 'Beech'];
  final colors = ['Green', 'Brown', 'Pink'];
  final forest = Forest();

  for (int i = 0; i <= 30; i++) {
    forest.plantTree(
      x: random.nextInt(50),
      y: random.nextInt(50),
      name: types[random.nextInt(5)], // Adjusted index to include all types
      color: colors[random.nextInt(3)], // Adjusted index to include all colors
    );
  }

  forest.paint();

  /// Here is the result:
  /*
  Green Black Berry at (24, 23).
  Brown Willow at (31, 45).
  Green Black Berry at (47, 11).
  Green Black Berry at (38, 11).
  Green Black Berry at (22, 30).
  Green Black Berry at (18, 35).
  Brown Willow at (9, 1).
  Brown Maple at (18, 20).
  Green Magnolia at (31, 32).
  Green Magnolia at (24, 1).
  Green Magnolia at (5, 33).
  Green Black Berry at (44, 1).
  Brown Willow at (4, 3).
  Brown Willow at (24, 32).
  Green Black Berry at (2, 46).
  Brown Maple at (40, 4).
  Green Black Berry at (4, 18).
  Green Magnolia at (29, 37).
  Brown Maple at (18, 29).
  Brown Willow at (23, 29).
  Brown Willow at (20, 6).
  Green Magnolia at (19, 43).
  Green Magnolia at (39, 3).
  Brown Maple at (12, 28).
  Brown Willow at (32, 35).
  Brown Willow at (18, 18).
  Brown Willow at (29, 24).
  Brown Willow at (1, 44).
  Brown Willow at (46, 35).
  Green Black Berry at (34, 35).
  Green Magnolia at (5, 43).
  */
}

import 'package:flutter/material.dart';
import 'dart:math';

class MindMappingGame extends StatefulWidget {
  const MindMappingGame({super.key});

  @override
  State<MindMappingGame> createState() => _MindMappingGameState();
}

class _MindMappingGameState extends State<MindMappingGame> {
  final List<Map<String, dynamic>> _nodes = [
    {'id': 0, 'text': 'Pomysł', 'x': 0.5, 'y': 0.3, 'color': Color(0xFF059669), 'isCenter': true},
  ];

  final List<String> _branchColors = ['0xFFEF4444', '0xFFF59E0B', '0xFF10B981', '0xFF3B82F6', '0xFF8B5CF6', '0xFFEC4899'];

  int _nextId = 1;
  String _centerTopic = 'Mój Pomysł';
  bool _showInstructions = true;

  void _addNode(String text) {
    setState(() {
      final colorIndex = (_nodes.length - 1) % _branchColors.length;
      final color = Color(int.parse(_branchColors[colorIndex]));

      final angle = ((_nodes.length - 1) * 60.0) * pi / 180.0;
      final radius = 0.25;

      _nodes.add({'id': _nextId++, 'text': text, 'x': 0.5 + radius * cos(angle), 'y': 0.3 + radius * sin(angle), 'color': color, 'isCenter': false});
    });
  }

  void _showAddNodeDialog() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.add_circle, color: Color(0xFF059669)),
            SizedBox(width: 12),
            Text('Dodaj gałąź'),
          ],
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 30,
          decoration: InputDecoration(
            hintText: 'Wpisz pomysł...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              _addNode(value);
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                _addNode(controller.text);
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF059669)),
            child: const Text('Dodaj'),
          ),
        ],
      ),
    );
  }

  void _editCenterTopic() {
    final controller = TextEditingController(text: _centerTopic);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Edytuj temat główny'),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 30,
          decoration: InputDecoration(
            hintText: 'Wpisz temat...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Anuluj')),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  _centerTopic = controller.text;
                  _nodes[0]['text'] = controller.text;
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF059669)),
            child: const Text('Zapisz'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mind Mapping'),
        backgroundColor: const Color(0xFF059669),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              setState(() {
                _showInstructions = !_showInstructions;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _nodes.clear();
                _nodes.add({'id': 0, 'text': 'Pomysł', 'x': 0.5, 'y': 0.3, 'color': const Color(0xFF059669), 'isCenter': true});
                _nextId = 1;
                _centerTopic = 'Mój Pomysł';
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_showInstructions)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF059669).withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.account_tree, color: Color(0xFF059669)),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text('Twórz mapę myśli!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Kliknij środek aby zmienić temat główny. Dodawaj gałęzie przyciskiem +', style: TextStyle(fontSize: 13, height: 1.4)),
                ],
              ),
            ),
          Expanded(
            child: Stack(
              children: [
                CustomPaint(size: Size.infinite, painter: _MindMapPainter(_nodes)),
                ..._nodes.map((node) {
                  return Positioned(
                    left: MediaQuery.of(context).size.width * node['x'] - 60,
                    top: MediaQuery.of(context).size.height * 0.6 * node['y'],
                    child: GestureDetector(
                      onTap: node['isCenter'] ? _editCenterTopic : null,
                      child: Container(
                        width: node['isCenter'] ? 140 : 120,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: node['color'],
                          borderRadius: BorderRadius.circular(node['isCenter'] ? 70 : 16),
                          boxShadow: [BoxShadow(color: (node['color'] as Color).withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
                        ),
                        child: Text(
                          node['text'],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: node['isCenter'] ? 16 : 13),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.tips_and_updates, color: Color(0xFF059669)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Gałęzi: ${_nodes.length - 1}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _showAddNodeDialog,
                          icon: const Icon(Icons.add),
                          label: const Text('Dodaj gałąź'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF059669),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MindMapPainter extends CustomPainter {
  final List<Map<String, dynamic>> nodes;

  _MindMapPainter(this.nodes);

  @override
  void paint(Canvas canvas, Size size) {
    if (nodes.length < 2) return;

    final centerNode = nodes[0];
    final centerX = size.width * centerNode['x'];
    final centerY = size.height * 0.6 * centerNode['y'];

    for (int i = 1; i < nodes.length; i++) {
      final node = nodes[i];
      final nodeX = size.width * node['x'];
      final nodeY = size.height * 0.6 * node['y'];

      final paint = Paint()
        ..color = (node['color'] as Color).withOpacity(0.6)
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke;

      canvas.drawLine(Offset(centerX, centerY), Offset(nodeX, nodeY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

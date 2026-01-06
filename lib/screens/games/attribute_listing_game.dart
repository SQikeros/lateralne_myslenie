import 'package:flutter/material.dart';

class AttributeListingGame extends StatefulWidget {
  const AttributeListingGame({super.key});

  @override
  State<AttributeListingGame> createState() => _AttributeListingGameState();
}

class _AttributeListingGameState extends State<AttributeListingGame> {
  final List<Map<String, dynamic>> _objects = [
    {
      'name': 'Krzesło',
      'emoji': '🪑',
      'attributes': {
        'Materiał': ['Drewno', 'Metal', 'Plastik', 'Szkło'],
        'Kolor': ['Brązowy', 'Czarny', 'Biały', 'Kolorowy'],
        'Wysokość': ['Niskie', 'Średnie', 'Wysokie', 'Regulowane'],
        'Styl': ['Klasyczny', 'Nowoczesny', 'Vintage', 'Futurystyczny'],
        'Funkcja': ['Siedzenie', 'Leżenie', 'Biurko', 'Bar'],
      },
    },
    {
      'name': 'Zegarek',
      'emoji': '⌚',
      'attributes': {
        'Typ': ['Mechaniczny', 'Elektroniczny', 'Smart', 'Słoneczny'],
        'Pasek': ['Skóra', 'Metal', 'Guma', 'Tkanina'],
        'Funkcje': ['Tylko czas', 'Data', 'Stoper', 'GPS'],
        'Styl': ['Sportowy', 'Elegancki', 'Casual', 'Militarny'],
        'Rozmiar': ['Mini', 'Standard', 'Duży', 'XXL'],
      },
    },
    {
      'name': 'Kubek',
      'emoji': '☕',
      'attributes': {
        'Materiał': ['Ceramika', 'Szkło', 'Metal', 'Biodegradowalny'],
        'Rozmiar': ['Espresso', 'Standard', 'Jumbo', 'Termos'],
        'Uchwyt': ['Klasyczny', 'Ergonomiczny', 'Bez uchwytu', 'Dwa uchwyty'],
        'Funkcja': ['Zwykły', 'Termiczny', 'Podgrzewający', 'Chłodzący'],
        'Wzór': ['Jednolity', 'Ze zdjęciem', 'Z cytatem', 'Zmienny'],
      },
    },
  ];

  int _selectedObjectIndex = 0;
  final Map<String, String> _selectedAttributes = {};

  @override
  Widget build(BuildContext context) {
    final currentObject = _objects[_selectedObjectIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Attribute Listing'), backgroundColor: const Color(0xFF3B82F6), foregroundColor: Colors.white),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: const Color(0xFF3B82F6).withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.tune, color: Color(0xFF3B82F6)),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text('Mix & Match!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text('Wybieraj różne cechy i twórz innowacyjne kombinacje! Co by było, gdyby...', style: TextStyle(height: 1.5)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_objects.length, (index) {
                    final object = _objects[index];
                    final isSelected = _selectedObjectIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedObjectIndex = index;
                          _selectedAttributes.clear();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF3B82F6), width: isSelected ? 2 : 1),
                        ),
                        child: Row(
                          children: [
                            Text(object['emoji'], style: const TextStyle(fontSize: 32)),
                            const SizedBox(width: 12),
                            Text(
                              object['name'],
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isSelected ? Colors.white : Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(currentObject['emoji'], style: const TextStyle(fontSize: 60)),
                    const SizedBox(height: 12),
                    Text(
                      currentObject['name'],
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Wybierz cechy:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ...(currentObject['attributes'] as Map<String, List<String>>).entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF3B82F6)),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: entry.value.map((option) {
                        final isSelected = _selectedAttributes[entry.key] == option;
                        return ChoiceChip(
                          label: Text(option),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedAttributes[entry.key] = option;
                              } else {
                                _selectedAttributes.remove(entry.key);
                              }
                            });
                          },
                          selectedColor: const Color(0xFF3B82F6),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }),
              if (_selectedAttributes.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF10B981), width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.auto_awesome, color: Color(0xFF10B981)),
                          const SizedBox(width: 8),
                          const Text('Twoja innowacja:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${currentObject['name']}: ${_selectedAttributes.values.join(', ')}',
                        style: const TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16),
                      const Text('Jak to można wykorzystać?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Opisz zastosowanie tej kombinacji...',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

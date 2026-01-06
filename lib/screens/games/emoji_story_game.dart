import 'package:flutter/material.dart';

class EmojiStoryGame extends StatefulWidget {
  const EmojiStoryGame({super.key});

  @override
  State<EmojiStoryGame> createState() => _EmojiStoryGameState();
}

class _EmojiStoryGameState extends State<EmojiStoryGame> {
  final List<List<String>> _emojiCategories = [
    ['😀', '😂', '😍', '😎', '😢', '😡', '🤔', '😴'],
    ['👨', '👩', '👦', '👧', '👶', '🧓', '👨‍💼', '👩‍🎨'],
    ['🐶', '🐱', '🐭', '🐹', '🐰', '🦊', '🐻', '🐼'],
    ['🍕', '🍔', '🍰', '🍦', '🍎', '🍌', '🥗', '🍕'],
    ['🏠', '🏢', '🏫', '🏥', '🏰', '🗼', '🌉', '⛪'],
    ['🚗', '🚕', '🚌', '🚎', '🏎️', '🚓', '🚑', '🚒'],
    ['⚽', '🏀', '🎾', '🏐', '🎱', '🎮', '🎲', '🎯'],
    ['🌟', '⭐', '✨', '💫', '🔥', '💧', '🌈', '⚡'],
  ];

  final List<String> _categoryNames = ['Emocje', 'Ludzie', 'Zwierzęta', 'Jedzenie', 'Miejsca', 'Transport', 'Aktywności', 'Inne'];

  String _story = '';
  final List<String> _storyEmojis = [];
  int _selectedCategory = 0;

  void _addEmoji(String emoji) {
    setState(() {
      _storyEmojis.add(emoji);
    });
  }

  void _removeLastEmoji() {
    if (_storyEmojis.isNotEmpty) {
      setState(() {
        _storyEmojis.removeLast();
      });
    }
  }

  void _clearStory() {
    setState(() {
      _storyEmojis.clear();
      _story = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emoji Story'),
        backgroundColor: const Color(0xFFFBBF24),
        foregroundColor: Colors.black87,
        actions: [if (_storyEmojis.isNotEmpty) IconButton(icon: const Icon(Icons.delete_outline), onPressed: _clearStory)],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: const Color(0xFFFBBF24).withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.emoji_emotions, color: Color(0xFFFBBF24)),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text('Stwórz historię!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text('Wybieraj emoji i buduj kreatywną historię. Następnie opisz co się wydarzyło!', style: TextStyle(height: 1.5)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFFBBF24), width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Twoja historia:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              if (_storyEmojis.isNotEmpty)
                                IconButton(icon: const Icon(Icons.backspace_outlined), color: Colors.red, onPressed: _removeLastEmoji),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(color: const Color(0xFFFBBF24).withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                            constraints: const BoxConstraints(minHeight: 80),
                            child: _storyEmojis.isEmpty
                                ? const Center(
                                    child: Text('Zacznij dodawać emoji...', style: TextStyle(color: Colors.grey, fontSize: 16)),
                                  )
                                : Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: _storyEmojis.map((emoji) {
                                      return Text(emoji, style: const TextStyle(fontSize: 36));
                                    }).toList(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    if (_storyEmojis.length >= 3) ...[
                      const SizedBox(height: 24),
                      const Text('Opisz swoją historię:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Co się wydarzyło w Twojej historii?',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xFFFBBF24), width: 2),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        onChanged: (value) {
                          setState(() {
                            _story = value;
                          });
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      child: Row(
                        children: List.generate(_categoryNames.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ChoiceChip(
                              label: Text(_categoryNames[index]),
                              selected: _selectedCategory == index,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() {
                                    _selectedCategory = index;
                                  });
                                }
                              },
                              selectedColor: const Color(0xFFFBBF24),
                              labelStyle: TextStyle(
                                color: _selectedCategory == index ? Colors.black87 : Colors.grey[700],
                                fontWeight: _selectedCategory == index ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    Container(
                      height: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: _emojiCategories[_selectedCategory].length,
                        itemBuilder: (context, index) {
                          final emoji = _emojiCategories[_selectedCategory][index];
                          return GestureDetector(
                            onTap: () => _addEmoji(emoji),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFBBF24).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFFBBF24).withOpacity(0.3)),
                              ),
                              child: Center(child: Text(emoji, style: const TextStyle(fontSize: 36))),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'games/random_connection_game.dart';
import 'games/reversal_game.dart';
import 'games/provocation_game.dart';
import 'games/analogies_game.dart';
import 'games/scamper_game.dart';
import 'games/attribute_listing_game.dart';
import 'games/six_hats_game.dart';
import 'games/mind_mapping_game.dart';
import 'games/word_sprint_game.dart';
import 'games/emoji_story_game.dart';
import 'games/reverse_engineering_game.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wybierz Technikę'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF6366F1).withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            children: [
              const SizedBox(height: 10),
              _buildSectionHeader('🎯 Klasyczne Techniki', Colors.purple.shade900),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Losowe Połączenia',
                subtitle: 'Metoda losowego wejścia',
                description: 'Łącz niepowiązane pojęcia',
                icon: Icons.shuffle,
                color: const Color(0xFFEC4899),
                onTap: () => _navigateToGame(context, const RandomConnectionGame()),
              ),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Odwróć Problem',
                subtitle: 'Technika odwrócenia',
                description: 'Zobacz problem od drugiej strony',
                icon: Icons.flip,
                color: const Color(0xFF8B5CF6),
                onTap: () => _navigateToGame(context, const ReversalGame()),
              ),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Prowokacja',
                subtitle: 'Technika prowokacji',
                description: 'Kwestionuj oczywistości',
                icon: Icons.emoji_objects,
                color: const Color(0xFF06B6D4),
                onTap: () => _navigateToGame(context, const ProvocationGame()),
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('🎮 Interaktywne Wyzwania', Colors.orange.shade900),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Analogie',
                subtitle: 'Myślenie analogiczne',
                description: 'Klikaj karty i odkrywaj analogie',
                icon: Icons.compare_arrows,
                color: const Color(0xFFEF4444),
                onTap: () => _navigateToGame(context, const AnalogiesGame()),
              ),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Wyzwanie SCAMPER',
                subtitle: 'Metoda SCAMPER',
                description: 'Swipe przez 7 pytań',
                icon: Icons.auto_awesome,
                color: const Color(0xFFF59E0B),
                onTap: () => _navigateToGame(context, const ScamperGame()),
              ),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Sześć Kapeluszy Myślenia',
                subtitle: 'Metoda sześciu kapeluszy',
                description: '6 perspektyw myślenia',
                icon: Icons.psychology,
                color: const Color(0xFF10B981),
                onTap: () => _navigateToGame(context, const SixHatsGame()),
              ),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Lista Cech',
                subtitle: 'Mieszaj i dopasowuj',
                description: 'Modyfikuj cechy obiektów',
                icon: Icons.tune,
                color: const Color(0xFF3B82F6),
                onTap: () => _navigateToGame(context, const AttributeListingGame()),
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('⚡ Express (30-60s)', Colors.red.shade900),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Sprint Słowny',
                subtitle: 'Wyzwanie 60 sekund',
                description: 'Ile skojarzeń w 60 sekund?',
                icon: Icons.flash_on,
                color: const Color(0xFFDC2626),
                onTap: () => _navigateToGame(context, const WordSprintGame()),
              ),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Historia Emoji',
                subtitle: 'Opowiadanie wizualne',
                description: 'Opowiedz historię emoji',
                icon: Icons.emoji_emotions,
                color: const Color(0xFFFBBF24),
                onTap: () => _navigateToGame(context, const EmojiStoryGame()),
              ),
              const SizedBox(height: 12),
              _buildGameCard(
                context,
                title: 'Inżynieria Wsteczna',
                subtitle: 'Odkrywanie funkcji',
                description: 'Odkryj zastosowanie przedmiotu',
                icon: Icons.search,
                color: const Color(0xFF8B5CF6),
                onTap: () => _navigateToGame(context, const ReverseEngineeringGame()),
              ),
              const SizedBox(height: 24),
              //TODO narazie nie dodaje bo troche zepsuta ta mapa więc zakomentuje

              // _buildSectionHeader('🚀 Zaawansowane', Colors.blue.shade900),
              // const SizedBox(height: 12),
              // _buildGameCard(
              //   context,
              //   title: 'Mapa Myśli',
              //   subtitle: 'Burza mózgów wizualna',
              //   description: 'Twórz mapę myśli',
              //   icon: Icons.account_tree,
              //   color: const Color(0xFF059669),
              //   onTap: () => _navigateToGame(context, const MindMappingGame()),
              // ),
              const SizedBox(height: 32),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 40,
                        color: Color(0xFF6366F1),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '10 Technik Kreatywnego Myślenia',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Od klasycznych metod po interaktywne wyzwania - trenuj kreatywność przez zabawę!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToGame(BuildContext context, Widget game) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => game),
    );
  }

  Widget _buildGameCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required String description,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[700],
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: color,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
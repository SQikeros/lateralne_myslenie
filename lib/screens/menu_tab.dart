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
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [const Color(0xFF6366F1).withOpacity(0.12), Colors.white]),
        ),
        child: ListView(
          padding: EdgeInsets.only(bottom: bottomPadding + 24),
          children: [
            const SizedBox(height: 8),
            _buildTopHeader(context),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  _buildSectionHeader('⚡ Express (30–60s)', Colors.red.shade900),
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
                  const SizedBox(height: 28),
                  _buildAuthorCard(),
                  const SizedBox(height: 18),
                  _buildInfoCard(),
                  const SizedBox(height: 10),

                  // TODO: mapa myśli (zakomentowana jak u Ciebie)
                  // const SizedBox(height: 24),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: top + 8, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            'Wybierz technikę',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFF111827), letterSpacing: -0.5),
          ),
          const SizedBox(height: 6),
          Text(
            'Trenuj kreatywność w formie krótkich wyzwań. Klikasz, grasz, myślisz i cyk, mózg rośnie 💪🧠',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade800, height: 1.35),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.9)),
              boxShadow: [BoxShadow(blurRadius: 14, offset: const Offset(0, 8), color: Colors.black.withOpacity(0.05))],
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_outline, color: Color(0xFF6366F1)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Tip: Nie oceniaj pomysłów w trakcie zadania. Nawet głupie odpowiedzi są paliwem dla dobrych.',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade900),
                  ),
                ),
              ],
            ),
          ),
        ],
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
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  void _navigateToGame(BuildContext context, Widget game) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => game));
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
      shadowColor: Colors.black.withOpacity(0.12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [color.withOpacity(0.12), color.withOpacity(0.05)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(blurRadius: 12, offset: const Offset(0, 8), color: color.withOpacity(0.25))],
                ),
                child: Icon(icon, size: 30, color: Colors.white),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF111827)),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 7),
                    Text(description, style: TextStyle(fontSize: 13, color: Colors.grey.shade800, height: 1.25)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: color, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthorCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [const Color(0xFF6366F1).withOpacity(0.14), const Color(0xFFEC4899).withOpacity(0.09)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white),
        boxShadow: [BoxShadow(blurRadius: 18, offset: const Offset(0, 10), color: Colors.black.withOpacity(0.06))],
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(color: const Color(0xFF6366F1), borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.person, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dlaczego to działa?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF111827)),
                ),
                const SizedBox(height: 6),
                Text(
                  'Lateralne myślenie omija schematy. Zamiast jednej poprawnej odpowiedzi szukasz nowych dróg.',
                  style: TextStyle(fontSize: 13, height: 1.35, color: Colors.grey.shade900),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.auto_awesome, color: Color(0xFFEC4899)),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(color: const Color(0xFF6366F1).withOpacity(0.12), borderRadius: BorderRadius.circular(14)),
              child: const Icon(Icons.info_outline, color: Color(0xFF6366F1)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'O technikach',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF111827)),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Od klasycznych metod po szybkie wyzwania trenuj kreatywność przez zabawę. Najlepsze efekty? 5 minut dziennie.',
                    style: TextStyle(fontSize: 13, height: 1.35, color: Colors.grey.shade800),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const GreenPointApp());
}

/// ==================== APP ROOT ====================
class GreenPointApp extends StatelessWidget {
  const GreenPointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenPoint',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.green,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green),
      ),
      home: const MainNavigation(),
    );
  }
}

/// ==================== COLORS ====================
class AppColors {
  static const green = Color(0xFF2E8B4E);
  static const greenDark = Color(0xFF1E6B3A);
  static const greenLight = Color(0xFFE3F3E6);
  static const greenSoft = Color(0xFFF2FAF3);
  static const bronze = Color(0xFFC98A4B);
  static const silver = Color(0xFF9AA7B0);
  static const gold = Color(0xFFE0A93B);
  static const grey = Color(0xFF9AA5A1);
}

/// ==================== DATA MODELS ====================
class Achievement {
  final String title;
  final IconData icon;
  final Color color;
  final bool unlocked;
  const Achievement({
    required this.title,
    required this.icon,
    required this.color,
    this.unlocked = true,
  });
}

class HistoryItem {
  final String title;
  final String date;
  final String time;
  final String place;
  final int xp;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  const HistoryItem({
    required this.title,
    required this.date,
    required this.time,
    required this.place,
    required this.xp,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
  });
}

/// ==================== MOCK DATA ====================
final List<Achievement> allAchievements = [
  const Achievement(
    title: 'Eco Starter',
    icon: Icons.eco,
    color: AppColors.bronze,
  ),
  const Achievement(
    title: 'Green Shopper',
    icon: Icons.shopping_bag,
    color: AppColors.bronze,
  ),
  const Achievement(
    title: 'Eco Explorer',
    icon: Icons.location_on,
    color: AppColors.silver,
  ),
  const Achievement(
    title: 'No Plastic',
    icon: Icons.card_giftcard,
    color: AppColors.gold,
  ),
  const Achievement(
    title: 'Eco Hero',
    icon: Icons.lock,
    color: AppColors.grey,
    unlocked: false,
  ),
  const Achievement(
    title: 'Water Saver',
    icon: Icons.water_drop,
    color: AppColors.bronze,
  ),
  const Achievement(
    title: 'Recycle Pro',
    icon: Icons.recycling,
    color: AppColors.silver,
  ),
  const Achievement(
    title: 'Bike Rider',
    icon: Icons.pedal_bike,
    color: AppColors.bronze,
  ),
  const Achievement(
    title: 'Solar Fan',
    icon: Icons.solar_power,
    color: AppColors.gold,
  ),
  const Achievement(
    title: 'Tree Planter',
    icon: Icons.park,
    color: AppColors.grey,
    unlocked: false,
  ),
];

final List<HistoryItem> allHistory = [
  const HistoryItem(
    title: 'สแกน QR code ที่ร้านกระเจี๊ยบ',
    date: '02/09/2568',
    time: '14:32',
    place: 'Cha-ji Coffee',
    xp: 10,
    icon: Icons.qr_code_scanner,
    iconColor: AppColors.green,
    iconBg: AppColors.greenLight,
  ),
  const HistoryItem(
    title: 'สแกน QR code ที่ร้านลูกชิ้นอ้วน',
    date: '01/09/2568',
    time: '10:18',
    place: 'ร้านลูกชิ้นอ้วน',
    xp: 5,
    icon: Icons.qr_code_scanner,
    iconColor: AppColors.green,
    iconBg: AppColors.greenLight,
  ),
  const HistoryItem(
    title: 'แลกกระบอกน้ำตราหมี',
    date: '03/08/2568',
    time: '17:45',
    place: 'GreenPoint Shop',
    xp: -50,
    icon: Icons.card_giftcard,
    iconColor: Colors.red,
    iconBg: Color(0xFFFDEAEA),
  ),
  const HistoryItem(
    title: 'โบนัสกิจกรรม แต้ม x2',
    date: '28/07/2568',
    time: '09:20',
    place: 'งาน Green Life',
    xp: 20,
    icon: Icons.star,
    iconColor: Colors.amber,
    iconBg: Color(0xFFFFF6DD),
  ),
  const HistoryItem(
    title: 'สแกน QR code ที่ร้านผักดี',
    date: '25/07/2568',
    time: '11:05',
    place: 'ร้านผักดี',
    xp: 10,
    icon: Icons.qr_code_scanner,
    iconColor: AppColors.green,
    iconBg: AppColors.greenLight,
  ),
  const HistoryItem(
    title: 'แลกถุงผ้าลดโลกร้อน',
    date: '20/07/2568',
    time: '13:15',
    place: 'GreenPoint Shop',
    xp: -30,
    icon: Icons.card_giftcard,
    iconColor: Colors.red,
    iconBg: Color(0xFFFDEAEA),
  ),
  const HistoryItem(
    title: 'เชิญชวนเพื่อนเข้าร่วม',
    date: '15/07/2568',
    time: '19:40',
    place: 'GreenPoint App',
    xp: 15,
    icon: Icons.person_add,
    iconColor: AppColors.green,
    iconBg: AppColors.greenLight,
  ),
];

/// ==================== MAIN NAVIGATION (BOTTOM BAR) ====================
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 3; // เริ่มที่แท็บ Profile เหมือนภาพตัวอย่าง

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const PlaceholderPage(title: 'Home', icon: Icons.home),
      const PlaceholderPage(title: 'Partner Store', icon: Icons.storefront),
      const PlaceholderPage(title: 'Scan', icon: Icons.qr_code_scanner),
      const ProfilePage(),
    ];

    return Scaffold(
      body: SafeArea(child: pages[_index]),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    final items = [
      _NavItem('Home', Icons.home_outlined, Icons.home),
      _NavItem('Partner Store', Icons.storefront_outlined, Icons.storefront),
      _NavItem('Scan', Icons.qr_code_scanner_outlined, Icons.qr_code_scanner),
      _NavItem('Profile', Icons.person_outline, Icons.person),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (i) {
              final selected = _index == i;
              final item = items[i];
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => setState(() => _index = i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      selected ? item.filledIcon : item.icon,
                      color: selected ? AppColors.green : Colors.grey,
                      size: 26,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 12,
                        color: selected ? AppColors.green : Colors.grey,
                        fontWeight: selected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final IconData icon;
  final IconData filledIcon;
  _NavItem(this.label, this.icon, this.filledIcon);
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  final IconData icon;
  const PlaceholderPage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: AppColors.green),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('หน้านี้กำลังพัฒนา', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

/// ==================== PROFILE PAGE ====================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildProfileCard(),
          const SizedBox(height: 16),
          _buildMascotCard(),
          const SizedBox(height: 16),
          _buildStreakCard(),
          const SizedBox(height: 20),
          _buildAchievementsSection(context),
          const SizedBox(height: 20),
          _buildHistorySection(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.eco, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 10),
            const Text(
              'GreenPoint',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.greenDark,
              ),
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.notifications_none,
              size: 28,
              color: Colors.black87,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.greenSoft,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.greenLight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/profile.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'phattharawadee',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.greenLight,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.eco, size: 12, color: AppColors.green),
                          SizedBox(width: 3),
                          Text(
                            'Level 5',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.greenDark,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'รักษ์โลกในแบบของเรา 🌱',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: const [
                    Text(
                      '350 XP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greenDark,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '/ 500 XP',
                      style: TextStyle(fontSize: 13, color: Colors.black45),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 350 / 500,
                    minHeight: 8,
                    backgroundColor: const Color(0xFFDDEBDF),
                    valueColor: const AlwaysStoppedAnimation(AppColors.green),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'อีก 150 XP เพื่อเลื่อนเป็น Level 6',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMascotCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.greenLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.recycling,
              color: AppColors.green,
              size: 30,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'ยอดเยี่ยมมาก! คุณกำลังช่วยโลก\nไปพร้อมกับสร้างสิ่งดีๆ ให้ตัวเอง',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.eco, color: AppColors.green, size: 26),
        ],
      ),
    );
  }

  Widget _buildStreakCard() {
    const days = ['จ.', 'อ.', 'พ.', 'พฤ.', 'ศ.', 'ส.', 'อา.'];
    const checked = [true, true, true, true, true, true, false];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: AppColors.greenLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.local_fire_department,
                  color: Colors.orange,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ใช้แอปต่อเนื่อง',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '12 วัน',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'เก่งมาก! รักษ์โลกอย่างต่อเนื่อง',
            style: TextStyle(fontSize: 12, color: Colors.black45),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(days.length, (i) {
              final done = checked[i];
              return Column(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: done ? AppColors.green : const Color(0xFFEFEFEF),
                      shape: BoxShape.circle,
                    ),
                    child: done
                        ? const Icon(Icons.check, color: Colors.white, size: 16)
                        : null,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    days[i],
                    style: const TextStyle(fontSize: 11, color: Colors.black54),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(BuildContext context) {
    final preview = allAchievements.take(5).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Achievements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AchievementsAllPage(),
                  ),
                );
              },
              child: Row(
                children: const [
                  Text(
                    'ดูทั้งหมด',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.chevron_right, color: AppColors.green, size: 18),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 118,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: preview.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, i) =>
                AchievementBadge(achievement: preview[i]),
          ),
        ),
      ],
    );
  }

  Widget _buildHistorySection(BuildContext context) {
    final preview = allHistory.take(4).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'ประวัติการทำรายการ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryAllPage()),
                );
              },
              child: Row(
                children: const [
                  Text(
                    'ดูทั้งหมด',
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.chevron_right, color: AppColors.green, size: 18),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Column(children: preview.map((h) => HistoryTile(item: h)).toList()),
      ],
    );
  }
}

/// ==================== ACHIEVEMENT BADGE WIDGET ====================
class AchievementBadge extends StatelessWidget {
  final Achievement achievement;
  const AchievementBadge({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: achievement.unlocked
                  ? achievement.color.withOpacity(0.18)
                  : const Color(0xFFECECEC),
              border: Border.all(
                color: achievement.unlocked
                    ? achievement.color
                    : const Color(0xFFD5D5D5),
                width: 2,
              ),
            ),
            child: Icon(
              achievement.unlocked ? achievement.icon : Icons.lock,
              color: achievement.unlocked ? achievement.color : Colors.grey,
              size: 26,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 34,
            child: Text(
              achievement.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

/// ==================== HISTORY TILE WIDGET ====================
class HistoryTile extends StatelessWidget {
  final HistoryItem item;
  const HistoryTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isPositive = item.xp >= 0;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(item.title),
            content: Text(
              '${item.date} • ${item.time}\n${item.place}\n${isPositive ? '+' : ''}${item.xp} XP',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('ปิด'),
              ),
            ],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: item.iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: item.iconColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${item.date} • ${item.time} • ${item.place}',
                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${isPositive ? '+' : ''}${item.xp} XP',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isPositive ? AppColors.green : Colors.red,
              ),
            ),
            const SizedBox(width: 2),
            const Icon(Icons.chevron_right, color: Colors.black26, size: 20),
          ],
        ),
      ),
    );
  }
}

/// ==================== ACHIEVEMENTS: ดูทั้งหมด ====================
class AchievementsAllPage extends StatelessWidget {
  const AchievementsAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements ทั้งหมด'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allAchievements.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, i) {
            final a = allAchievements[i];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: a.unlocked
                        ? a.color.withOpacity(0.18)
                        : const Color(0xFFECECEC),
                    border: Border.all(
                      color: a.unlocked ? a.color : const Color(0xFFD5D5D5),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    a.unlocked ? a.icon : Icons.lock,
                    color: a.unlocked ? a.color : Colors.grey,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  a.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  a.unlocked ? 'ปลดล็อกแล้ว' : 'ยังไม่ปลดล็อก',
                  style: TextStyle(
                    fontSize: 10,
                    color: a.unlocked ? AppColors.green : Colors.grey,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// ==================== HISTORY: ดูทั้งหมด ====================
class HistoryAllPage extends StatelessWidget {
  const HistoryAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการทำรายการทั้งหมด'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        itemCount: allHistory.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) => HistoryTile(item: allHistory[i]),
      ),
    );
  }
}

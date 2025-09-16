import 'package:flutter/material.dart';
import 'package:meetx/constants/color.dart';
import 'package:meetx/constants/textstyle.dart';
import 'package:meetx/screens/payment/pay_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  void _openFilters(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => const _FiltersSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('MeetX', style: TextStyleClass.interBold(size: 20.0, color: ColorConst.appColorFF)),
            const SizedBox(width: 8),
            const Icon(Icons.favorite, color: Colors.redAccent),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () => _openFilters(context), icon: const Icon(Icons.tune)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _BoostBanner(onBoost: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PayScreen()));
            }),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Discover people nearby', style: TextStyleClass.interBold(size: 18.0, color: ColorConst.black09)),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: .72,
              ),
              itemCount: 8,
              itemBuilder: (_, i) => _UserCard(index: i),
            ),
          ),
        ],
      ),
    );
  }
}

class _FiltersSheet extends StatefulWidget {
  const _FiltersSheet({super.key});
  @override
  State<_FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<_FiltersSheet> {
  final chips = ['Nearby', 'New', 'Top rated', 'Online now', 'Verified', '18–25', '26–35', '<10km'];
  final Set<String> selected = {};
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filters', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: -8,
            children: chips.map((label) {
              final isSel = selected.contains(label);
              return ChoiceChip(label: Text(label), selected: isSel, onSelected: (_){
                setState(() { if (isSel) selected.remove(label); else selected.add(label); });
              });
            }).toList(),
          ),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Apply'))),
        ],
      ),
    );
  }
}

class _BoostBanner extends StatelessWidget {
  const _BoostBanner({super.key, this.onBoost});
  final VoidCallback? onBoost;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            const Icon(Icons.flash_on, color: Colors.redAccent, size: 22),
            const SizedBox(width: 10),
            const Expanded(child: Text('Boost your profile · 1h on top')),
            TextButton(onPressed: onBoost, child: const Text('Boost')),
          ],
        ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.grey.shade300),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xCC000000), Color(0x00000000)]),
              ),
              child: const Text('User, 24 · 3 km', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
    );
  }
}

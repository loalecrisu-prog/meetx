import 'package:flutter/material.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});
  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final PageController _controller = PageController();
  void _next() => _controller.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  void _skip() => _next();
  void _like() { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Liked! (demo)'))); _next(); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Encounters')),
      body: Column(children: [
        Expanded(child: PageView.builder(controller: _controller, itemCount: 20, itemBuilder: (_,i)=>_SwipeCard(index:i))),
        Padding(padding: const EdgeInsets.symmetric(horizontal:24, vertical:16), child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _RoundBtn(icon: Icons.close, onTap: _skip),
          _RoundBtn(icon: Icons.favorite, onTap: _like, isPrimary: true),
        ]))
      ]),
    );
  }
}
class _SwipeCard extends StatelessWidget {
  const _SwipeCard({required this.index}); final int index;
  @override Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16), child: Card(clipBehavior: Clip.antiAlias, child: Stack(fit: StackFit.expand, children:[
      Container(color: Colors.grey.shade300),
      Align(alignment: Alignment.bottomLeft, child: Container(width: double.infinity, padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors:[Color(0xCC000000), Color(0x00000000)])),
        child: const Text('User · 22 · 4 km', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)))),
    ])));
  }
}
class _RoundBtn extends StatelessWidget {
  const _RoundBtn({required this.icon, required this.onTap, this.isPrimary=false}); final IconData icon; final VoidCallback onTap; final bool isPrimary;
  @override Widget build(BuildContext context) => InkResponse(onTap:onTap, radius:36, child: Container(width:64,height:64,decoration:BoxDecoration(color:isPrimary?Colors.redAccent:Colors.white,shape:BoxShape.circle, boxShadow:[BoxShadow(blurRadius:16,color:Colors.black.withOpacity(.08),offset:Offset(0,8))]), child: Icon(icon,color:isPrimary?Colors.white:Colors.black)));
}

import 'package:flutter/material.dart';

import '../components/components_home_header.dart';
import '../components/components_outlet.dart';

class PageChat extends StatelessWidget {
  const PageChat({super.key});
  // chat sebagai beranda

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ComponentsHomeHeader(),
            // ComponentsOutlet(
            // --- ComponentsTransaction(),
            // --- ComponentsPerformace(),
            // ),
            ComponentsOutlet()
          ],
        ),
      ),
    );
  }
}

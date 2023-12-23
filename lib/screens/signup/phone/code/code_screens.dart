import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'component/body.dart';

class CodeScreen extends StatelessWidget {
  final TabController tabController;
  const CodeScreen({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 96),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
            child: AppBar(
              // leading: backButton(),
              leading: BackToScreenButton(
                    tabController: tabController,
                  ),
            ),
          ),
        ),
      body: Body(
        tabController: tabController,
      ),
    );
  }
}

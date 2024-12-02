import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_project_controller.dart';

class DetailProjectView extends GetView<DetailProjectController> {
  const DetailProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailProjectView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailProjectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

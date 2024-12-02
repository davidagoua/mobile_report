import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZStack([
          Image.asset(
            "assets/images/login1.jpg",
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          VStack([
            "Bienvenue sur l'application"
                .text
                .center
                .size(20)
                .make()
                .centered(),
            10.heightBox,
            Obx(() => controller.error.value.isNotEmpty
                ? controller.error.value.text.red500.make().centered()
                : SizedBox()),
            20.heightBox,
            Form(
              key: controller.formKey,
              child: VStack(
                [
                  TextFormField(
                    decoration: getTFStyle('Nom'),
                    controller: controller.nom_controller,
                    validator: (value) =>
                        value!.isEmpty ? 'Veuillez entrer un nom' : null,
                  ),
                  Obx(() => TextFormField(
                        decoration: getTFStyle('Mot de passe',
                            suffix: Icon(controller.showPassword()
                                    ? Icons.lock_open
                                    : Icons.lock)
                                .onTap(controller.showPassword.toggle)),
                        controller: controller.password_controller,
                        obscureText: !controller.showPassword.value,
                      )),
                  Obx(() => GFButton(
                        fullWidthButton: true,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        onPressed: controller.validerEtEnvoyer,
                        child: controller.loading.value
                            ? CircularProgressIndicator(
                                color: Vx.white,
                              ).centered().expand()
                            : "Se connecter".text.make(),
                        size: GFSize.LARGE,
                        color: Color.fromARGB(255, 4, 72, 8),
                        blockButton: true,
                      ).w(double.maxFinite).centered())
                ],
                spacing: 10,
              ),
            )
          ]).p(10).card.make().p(20).centered()
        ]),
      ),
    );
  }

  InputDecoration getTFStyle(String label,
      {bool? isObscure = false, Widget? suffix = null}) {
    return InputDecoration(
        label: "${label}".text.make(),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero)),
        suffix: suffix,
      );
  }
}

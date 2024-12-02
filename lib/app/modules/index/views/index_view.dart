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

      body:  Center(
        child: ZStack([
          VStack([
            "Bienvenue sur l'application".text.center.size(18).make().centered(),
            20.heightBox,
            Form(
              key: controller.formKey,
              child: VStack([
                TextFormField(
                  decoration: getTFStyle('Nom'),
                  controller: controller.nom_controller,
                  validator: (value) => value!.isEmpty ? 'Veuillez entrer un nom' : null,
                ),
                TextFormField(
                  decoration: getTFStyle('Mot de passe'),
                  controller: controller.password_controller,
                  obscureText: true,
                ),
                Obx(()=>
                  GFButton(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    onPressed: controller.validerEtEnvoyer,
                    child: controller.loading.value ? CircularProgressIndicator(color: Vx.white,).centered().expand() : "Se connecter".text.make(),
                    size: GFSize.LARGE,
                    color: Colors.green,
                    blockButton: true,
                  ).centered()
                )
              ], spacing: 10,),
            )
          ]).p(10)
        ]),
      ),
    );
  }

  InputDecoration getTFStyle(String label, {bool? isObscure = false}){
    return InputDecoration(
        label: "${label}".text.make(),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.zero))
    );
  }
}



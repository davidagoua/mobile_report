import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/producteur_form_controller.dart';



enum Genre {HOMME, FEMME}


class ProducteurFormView extends GetView<ProducteurFormController> {
  const ProducteurFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProducteurFormView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: VStack([
          TextFormField(
            controller: controller.nom_controller,
            decoration: this.getTFStyle("Nom"),
          ).marginOnly(bottom: 20),

          TextFormField(
            controller: controller.nom_controller,
            decoration: this.getTFStyle("Prénoms"),
          ).marginOnly(bottom: 20),

          VStack([
            "Genre".text.make(),
            10.heightBox,
            HStack([
              HStack([
                Radio(value: 'Homme', groupValue: 'sexe', onChanged: (value)=>{
                  controller.sexe_controller(value.toString())
                }),
                'Homme'.text.make()
              ]).expand(),
              HStack([
                Radio(value: 'Femme', groupValue: 'sexe', onChanged: (value)=>{
                  controller.sexe_controller(value.toString())
                }),
                'Femme'.text.make()
              ]).expand()
            ]).marginOnly(bottom: 20),
          ]),

          TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            controller: controller.telephone_controller,
            decoration: this.getTFStyle("Numéro de téléphone"),
          ).marginOnly(bottom: 20),
          
          InputDatePickerFormField(
            onDateSaved: (DateTime date) => controller.date_naissance_controller.text = date.toIso8601String(),
            firstDate: DateTime.now().subtract(Duration(days: 160 * 365)),
            lastDate: DateTime.now().add(Duration(days: 160 * 365)),
            fieldLabelText: "Date de naissance",
          ).marginOnly(bottom: 20),

          TextFormField(
            controller: controller.lieu_naissance_controller,
            decoration: this.getTFStyle("Lieu de naissance"),
          ).marginOnly(bottom: 20),

          VStack([
            "Coopérative".text.make(),
            10.heightBox,
            DropdownButtonFormField(
                  isExpanded: false,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  borderRadius: BorderRadius.circular(5),
                  decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(243, 243, 243, 1),
                      border: InputBorder.none
                  ),
                  isDense: true,
                  items: [
                    "Côte d'ivoire",
                    "Benin",
                    "Togo",
                    "Mali",
                    "Sénégal",
                  ].map((String value)=> DropdownMenuItem(value: value, child: value.text.make(),)).toList(),
                  onChanged: (item)=>{
                    controller.cooperative_controller.text = item ?? "Côte d'ivoire"
                  },

                ),
          ]),
          Spacer(),
          30.heightBox,
          GFButton(
            size: GFSize.LARGE,
            onPressed: () {
              
            },
            blockButton: true,
            color: Vx.green700,
            child: "Enrégistrer".text.make().pSymmetric(h: 3),
          )
        ]).p(25),
      ),
    );
  }


  InputDecoration getTFStyle(String label, {bool? isObscure = false}){
    return InputDecoration(
      label: "${label}".text.make(),
      border: OutlineInputBorder()
    );
  }
}

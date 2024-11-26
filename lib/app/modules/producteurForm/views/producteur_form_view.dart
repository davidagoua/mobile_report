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
      backgroundColor: Vx.white,
      appBar: AppBar(
        title: const Text('Ajouter un producteur'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: VStack([
          
          HStack([
            SizedBox(
              width: Get.width / 2.3,
              child: TextFormField(
                controller: controller.nom_controller,
                decoration: this.getTFStyle("Nom"),
              ),
            ),
            Spacer(),
            SizedBox(
              width: Get.width / 2.3,
              child: TextFormField(
                controller: controller.nom_controller,
                decoration: this.getTFStyle("Prénoms"),
              ),
            ),
            
          ], alignment: MainAxisAlignment.spaceBetween,).marginOnly(bottom: 20),
          

          TextFormField(
            keyboardType: TextInputType.numberWithOptions(),
            controller: controller.telephone_controller,
            decoration: this.getTFStyle("Numéro de téléphone"),
          ).marginOnly(bottom: 20),

          VStack([
            "Genre".text.make(),
            10.heightBox,
            HStack([
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Vx.gray500)
                ),
               child: HStack([
                Radio(value: 'Homme', groupValue: 'sexe', onChanged: (value)=>{
                  controller.sexe_controller(value.toString())
                }),
                'Homme'.text.make()
              ])).expand(),
              
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Vx.gray500)
                ),
               child: HStack([
                Radio(value: 'Homme', groupValue: 'sexe', onChanged: (value)=>{
                  controller.sexe_controller(value.toString())
                }),
                'Homme'.text.make()
              ])).expand()
            ], spacing: 12,).marginOnly(bottom: 20),
          ]),
          
          
          
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
            Container(
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: DropdownButtonFormField(
                  isExpanded: false,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  borderRadius: BorderRadius.circular(0),
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
            ),
          ]),
          
          60.heightBox,
          HStack([
            GFButton(
              borderShape: ContinuousRectangleBorder(),
              borderSide: BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
              size: GFSize.LARGE,
              onPressed: () {
                
              },
              color: Vx.white,
              child: "Enrégistrer".text.color(Theme.of(context).primaryColor).make().pSymmetric(h: 3),
            ).expand(),
            GFButton(
              borderShape: ContinuousRectangleBorder(),
              size: GFSize.LARGE,
              onPressed: () {
                
              },
              color: Theme.of(context).primaryColor,
              child: "Enrégistrer".text.make().pSymmetric(h: 3),
            ).expand(),
          ], spacing: 5,)
        ]).scrollVertical().p(25),
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
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:mobile_report/app/data/models/producteur_model.dart';
import '../controllers/producteur_form_controller.dart';




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
      /*
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
      */
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: VStack(spacing: 10, [
              HStack([
                SizedBox(
                  width: Get.width / 2.3,
                  child: TextFormField(
                    decoration: getTFStyle('Nom'),
                    controller: controller.nom_controller,
                    validator: (value) => value!.isEmpty ? 'Veuillez entrer un nom' : null,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: Get.width / 2.3,
                  child: TextFormField(
                    decoration: getTFStyle('Prénom'),
                    controller: controller.prenoms_controller,
                    validator: (value) => value!.isEmpty ? 'Veuillez entrer un prénom' : null,
                  ),
                )
              ]),
              DropdownButtonFormField<Genre>(
                decoration: getTFStyle('Sexe'),
                items: Genre.values.map((Genre genre) {
                  return DropdownMenuItem<Genre>(
                    value: genre,
                    child: Text(genre.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (value) => controller.sexe_controller.value = value,
                validator: (value) => value == null ? 'Veuillez sélectionner un sexe' : null,
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                decoration: getTFStyle('Téléphone'),
                controller: controller.telephone_controller,
                validator: (value) => value!.isEmpty ? 'Veuillez entrer un numéro de téléphone' : null,
              ),
              HStack([
                SizedBox(
                  width: Get.width * 1/2.3,
                  child: TextFormField(
                    controller: controller.date_naissance_controller,
                    decoration: getTFStyle('Date de Naissance'),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        
                        controller.date_naissance_controller.text = pickedDate.toString();
                      }
                    },
                  
                    readOnly: true,
                    validator: (value) => value == null ? 'Veuillez sélectionner une date' : null,
                  )),
                
                Spacer(),
                SizedBox(
                  width: Get.width * 1/2.3,
                  child: TextFormField(
                    decoration: getTFStyle('Lieu de Naissance'),
                    controller: controller.lieu_naissance_controller,
                    validator: (value) => value!.isEmpty ? 'Veuillez entrer un lieu de naissance' : null,
                  ),
                ),
              ]),
              GFButton(
                borderShape: ContinuousRectangleBorder(),
                size: GFSize.LARGE,
                blockButton: true,
                onPressed: controller.validerEtEnvoyer,
                color: Theme.of(context).primaryColor,
                child: "Enrégistrer".text.make().pSymmetric(h: 3),
              )
              // Ajoutez des champs pour photo, cooperative et projet si nécessaire
              
            ],
          ),
        ),
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

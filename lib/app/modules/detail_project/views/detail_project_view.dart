import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_report/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/detail_project_controller.dart';

class DetailProjectView extends GetView<DetailProjectController> {
  const DetailProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[800],
        onPressed: ()=>{
          Get.toNamed(Routes.PRODUCTEUR_FORM, arguments: controller.project)
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text('${controller.project!['name']}'),
        centerTitle: true,
      ),
      body: VStack([
        Container(
          child: VStack([
            15.heightBox,
            HStack([
              VStack([
                Obx(()=> "${controller.producteurs.length}".text.size(20).white.make()),
                "producteur(s)".text.white.make()
              ], crossAlignment: CrossAxisAlignment.center,),
              VStack([
                "${controller.project!['parcelles']?.length ?? '0'}".text.size(20).white.make(),
                "parcelle(s)".text.white.make()
              ], crossAlignment: CrossAxisAlignment.center,),
            ], alignment: MainAxisAlignment.spaceEvenly,).w(double.maxFinite),
            10.heightBox,
            GFButton(
                onPressed: ()=>{
                  controller.sync()
                },
                color: Colors.white,

                blockButton: true,
                child: Obx(()=>
                controller.isSync.value ? CircularProgressIndicator(color: Vx.green800,).centered().expand() : "Synchroniser".text.green800.make()
                )
            ),
          ]).p(10),
        ).card.green800.make(),
        10.heightBox,
        HStack([
          "Membres".text.size(20).bold.make(),
          Spacer(),
          Icon(Icons.refresh).onTap(controller.reloadProducteurs)
        ]).paddingAll(15),
        10.heightBox,
        Expanded(
          child: Obx(()=> ListView.builder(
            itemCount: controller.producteurs.length,
            itemBuilder: (context, index){
              return ListTile(
                onTap: ()=> Get.toNamed(Routes.PARCELLE_FORM, arguments: {'producteur':controller.producteurs[index], 'project': controller.project}),
                title: Text(controller.producteurs[index].nom! + " " + controller.producteurs[index].prenom!),
                subtitle: Text(controller.producteurs[index].telephone! + " | " + controller.producteurs[index].cooperative.toString()),
                trailing: Icon(Icons.arrow_forward_ios),
              );
            },
          ))
        )
      ]).paddingAll(15),
    );
  }
}

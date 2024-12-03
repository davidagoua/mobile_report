import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:mobile_report/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],


      body: SafeArea(
        child: VStack([
          HStack([
          Obx(()=>"Bienvenue, ${controller.auth.current_user.value.username}".text.size(18).bold.make().centered()),
            Spacer(),
            IconButton(
              onPressed: (){
                controller.auth.logout();
                Get.offAllNamed(Routes.INDEX);
              },
              icon: Icon(Icons.logout)
            )
          ]).pOnly(bottom: 20),


          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(10),
            child: VStack([
              "En attente de synchronisation".text.white.make().centered(),
              10.heightBox,
              HStack([
                VStack([
                  "0".text.size(20).white.make(),
                  "producteur(s)".text.white.make()
                ], crossAlignment: CrossAxisAlignment.center,),
                VStack([
                  "0".text.size(20).white.make(),
                  "parcelle(s)".text.white.make()
                ], crossAlignment: CrossAxisAlignment.center,),
              ], alignment: MainAxisAlignment.spaceEvenly,).w(double.maxFinite),
              10.heightBox,
              GFButton(
                onPressed: ()=>{
                  controller.setupProjects()
                },
                color: Colors.white,

                blockButton: true,
                child: Obx(()=>
                  controller.isSyncronizing.value ? CircularProgressIndicator(color: Vx.green800,).centered().expand() : "Synchroniser".text.green800.make()
                )
              )
            ]),
          ).card.p4.green800.make(),
          10.heightBox,
          HStack([
            "Projets".text.size(20).bold.make(),
            Spacer(),
            IconButton(
              onPressed: ()=>{
                controller.setupProjects()
              },
              icon: Icon(Icons.refresh)
            )
          ]).pOnly(bottom: 10),
          Obx(()=>
            controller.projects.isEmpty ? "Aucun projet".text.make().centered() : ListView.builder(
              shrinkWrap: true,
              itemCount: controller.projects.length,
              itemBuilder: (context, index){
                return getProjectView(controller.projects[index]);
              }
            )
          )
        ]).paddingAll(15),
      ),
    );
  }


  Widget getProjectView(Map<String, dynamic> project){
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(10),
        child: Icon(Icons.folder, color: Colors.white,),
      ).card.color(Colors.green[800]!).make(),
      title: project['name'].toString().text.make(),
      subtitle: project['description'].toString().text.gray800.make(),
      trailing: Container(
        child: Icon(Icons.chevron_right),
      ),
    ).card.white.make().onTap(()=>Get.toNamed(Routes.DETAIL_PROJECT, arguments: project)
    );
  }
}

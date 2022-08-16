import 'package:car_counter/vehicles_counter/vehicle_controller.dart';
import 'package:car_counter/vehicles_counter/vehiclelist_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class VehiclesCountScreen extends StatefulWidget {
  const VehiclesCountScreen({Key? key}) : super(key: key);

  @override
  State<VehiclesCountScreen> createState() => _VehiclesCountScreenState();
}

class _VehiclesCountScreenState extends State<VehiclesCountScreen> {
  var controller = VehicleListController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.loadVehicles();
  }

  @override
  Widget build(BuildContext context) {
    int itemSize = 130;
    double itemsDistance = 20;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int itemsPerRow = screenWidth ~/ (itemSize+itemsDistance);
    return Scaffold(
      key: _scaffoldKey,
      body: Observer(
          builder: (_) => Padding(
                padding: const EdgeInsets.all(25.0),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width-110,
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: itemsPerRow < 1 ? 1 : itemsPerRow,
                              crossAxisSpacing: itemsDistance,
                              mainAxisSpacing: itemsDistance,
                              childAspectRatio: 1),
                          itemCount: controller.vehicleList.length,
                          itemBuilder: (ctx, index) {
                            return VehicleCard(controller.vehicleList[index]);
                          }),
                    ),
                    SizedBox(width: 10,),
                    VerticalDivider(
                      width: 2,
                      thickness: 2,
                    ),
                    Container(
                      child: Center(
                        child: GestureDetector(
                          onTap: (){
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: Stack(
                            children: [
                              Transform(
                                transform: Matrix4.translationValues(23, 0, 0),
                                  child: Icon(Icons.save_rounded, size: 30,)
                              ),
                              Transform(
                                  transform: Matrix4.translationValues(0, -4, 0),
                                  child: Icon(Icons.keyboard_arrow_left, size: 39, color: Colors.black,)
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
      endDrawer: RightDrawer(controller),
      drawerEdgeDragWidth: 80,
    );
  }
}

class VehicleCard extends StatelessWidget {
  VehicleCountController vehicleController;


  VehicleCard(this.vehicleController);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        vehicleController.incrementCount();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 3)
            ]),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Stack(
              children: [
                //TOP Black
                Container(
                  height: (constraints.maxHeight/4),
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Stack(
                    children: [
                      Positioned(
                          left: -7,
                          top: -5,
                          child: IconButton(
                            icon: Icon(Icons.remove_circle_outline_rounded, color: Colors.white, size: 20,),
                            onPressed: (){
                              print('ué');
                              vehicleController.decrementCount();
                            },
                          )
                      ),
                      Center(
                        child: Text(
                          vehicleController.getName().toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              color: Colors.white
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Botton Left Black
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: (constraints.maxHeight/1.6),
                    width: (constraints.maxWidth/2.3),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Observer(
                          builder: (BuildContext context) {
                            return Text(
                                vehicleController.count.toString(),
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                            );
                          },
                        )

                      ],
                    ),
                  ),
                ),

                //Botton Right Green
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: (constraints.maxHeight/1.6),
                    width: (constraints.maxWidth/2.3),
                    decoration: BoxDecoration(
                        color: COLOR1,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10))),
                    child: Image.asset(vehicleController.getImagePath()),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class RightDrawer extends StatelessWidget{
  VehicleListController VLController;

  RightDrawer(this.VLController);

  Widget build(BuildContext context) {

    int value = 0;
    var items = List<DropdownMenuItem<int>>.generate(
      24*4,
      (i){
        return DropdownMenuItem<int>(
          value: i,
          child: Text("${i~/4<10?"0"+(i~/4).toString():i~/4}:${i%4 == 0 ? "00" : (i%4)*15}",style:TextStyle(color:Colors.black),),
        );
      }
    );

    return Container(
      width: 200,
      child: Drawer(
        child: ListView(
          children: [
            Center(
              child: DropdownButtonFormField(
                  items: items,
                  hint: Text('Horário'),
                  isExpanded: true,
                  onChanged: (item){
                    print(item);
                    VLController.positionOnList = item as int;
                  }
              ),
            ),
            IconButton(
                onPressed: (){
                  VLController.saveList();
                },
                icon: Icon(Icons.drive_file_rename_outline))
          ],
        ),
      ),
    );
  }
  
}
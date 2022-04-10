import 'package:get/get.dart';
import 'package:flutter/material.dart';


void main()
  => runApp(GetMaterialApp(home: Home()));

class Counter extends GetxController {
  RxInt connt = 0.obs;

  void add() {
    connt++;
  }
}

class Home extends StatelessWidget {
  final conter = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Getx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('${conter.connt}',
              style: TextStyle(fontSize: 50,color: Colors.green),)),
            ElevatedButton(onPressed: (){
                Get.to(OtherScreen());
            },
                child: Text('Go to Other Screen')),
            ElevatedButton(onPressed: (){
              Get.to(ThirdScreend());
            },
                child: Text('Go to ThirdScreend Screen'))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          conter.add();
        },
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  final Counter otherConter =  Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
      ),
      body: Center(
        child: Obx(
          ()=> Text('${otherConter.connt}',
          style: TextStyle(fontSize: 50,color: Colors.red),),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          otherConter.add();
        },
      ),
    );
  }
}

class ThirdScreend extends StatelessWidget {
  const ThirdScreend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("Show Snackbar"),
            onPressed: () {
              Get.snackbar('Hi', 'Blah hehe ',
                  snackPosition: SnackPosition.TOP,
                  colorText: Colors.black);
            },
          ),
          ElevatedButton(
            child: Text("Back Snackbar"),
            onPressed: () {
              Get.back();
              },
          ),
        ],
        )
      );



  }
}








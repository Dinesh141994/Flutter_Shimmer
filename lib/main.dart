import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:shimmer/shimmer.dart';

main()=>runApp(MaterialApp(home: MyApp(),));
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight=MediaQuery.of(context).size.height;
    double deviceWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Shimmer"),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context,index){
          return Container(
        height: deviceHeight / 3.9,
        width: deviceWidth / 1.1,
        margin: EdgeInsets.all(10.0),
        child: TransitionToImage(
          height: deviceHeight / 3.9,
          width: deviceWidth / 1.1,
          image: AdvancedNetworkImage(
              "https://image.shutterstock.com/image-photo/beautiful-autumn-scene-hintersee-lake-600w-747646759.jpg", timeoutDuration: Duration(minutes: 2)),fit: BoxFit.fill,
          loadingWidget: Shimmer.fromColors(
            baseColor: Colors.black12,
            highlightColor: Colors.white10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amberAccent)
            ),
          ),
          placeholder: Container(
            height: deviceHeight / 3.9,
            width: deviceWidth / 1.1,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/error_placeholder.jpg"),fit: BoxFit.fill)),
          ),
          duration: Duration(milliseconds: 300),
        ),
        );
        },itemCount: 10,),
      ),
    );
  }
}

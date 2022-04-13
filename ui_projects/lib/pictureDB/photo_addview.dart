import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui_projects/animation/parallax/parallax_animation.dart';
import 'package:ui_projects/pictureDB/Picture.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  State<PhotoView> createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {


  late List<File> pictures = [];
  late List<String> texts = [];
  List<String> pictureTimes = [];

  bool deleteButtonVis = false;
  bool imageTextVis = false;
  bool editImageTextVis = false;
  late int idx;
  String ? Path = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ParallaxArea(
            child: PageView.builder(
              itemCount: pictures.length+1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if(index == pictures.length){
                  return Center(//same tor moton kono pic na thakle icon show korbe
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                      onPressed: () {
                        addPicture();
                      },
                    ),
                  );
                } else {
                  return ParallaxWidget(
                    child: Stack(//pic thakle stack first e pic er upor delete button
                      children: [
                        InkWell(
                          onDoubleTap: (){
                            setState(() {
                              deleteButtonVis = changeBoolean(deleteButtonVis);
                            });
                          },
                          child: Center(
                            child: Text(
                              "PAGE ${index + 1}",
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        deleteButton(index),
                      ],
                    ),
                    overflowWidthFactor: 1,
                    background: Image.file(pictures[index]),

                  );
                }

              }),
          ),
        Align(//niche add korar button
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: (){
              addPicture();
            },
            child: const Icon(Icons.add_a_photo),
          ),
        ),
      ]),
    );
  }



  Widget deleteButton(int index) {//delete button widget making
    return Visibility(
      visible: deleteButtonVis,
      child: Positioned(
        right: 20,
        top: 20,
        child: IconButton(
          icon: const Icon(
              Icons.delete,
              color: Colors.black,
              size: 40,
          ),
          onPressed: () {
            print("$pictures \n$pictureTimes");
            getFilePath();
            print(Path);
          },
        ),
      ),
    );
  }

  bool changeBoolean(bool value){//visibility change
    if(value) {
      return false;
    } else {
      return true;
    }
  }

  Future addPicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) {print("no image found sir!"); return;}


    setState(() {
       // pictures[idx] = File(image.path);
       pictures.add(File(image.path));
       pictureTimes.add(DateFormat.Hms().format(DateTime.now()));
       Path = image.path;

    });
  }

  Future<void> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath';///demoTextFile.txt'; // 3
    print(appDocumentsPath);
    setState(() {
      //path = filePath;
    });
  }

}









/*

Widget imageView(int index) {

    if(pictures.isNotEmpty){
      return Image.file(pictures[index]);

    }
    else {
      return
        const Icon(Icons.add_a_photo,
        size: 80,);

    }
  }


Image.asset(
        "assets/images/img.png",
        fit: BoxFit.cover,
      );


  Widget parallax(){
    return
    ParallaxArea(
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ParallaxWidget(
              child: Center(
                child: Text(
                  "PAGE ${index + 1}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              overflowWidthFactor: 1,
              background: Image.asset(
                "assets/images/iroh.jpg",
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }


  Widget stacking(){
    return Stack(
      children: [
        InkWell(
            onDoubleTap: (){
              if(deleteButtonVis) {
                setState(() {
                  deleteButtonVis = false;
                });
              } else {
                setState(() {
                  deleteButtonVis = true;
                });
              }
            },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: (){},
            child: const Icon(Icons.add_a_photo),
          ),
        ),
      ],
    );
  }
 */
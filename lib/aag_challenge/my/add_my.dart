import 'dart:io';

import 'package:athlete_go/aag_challenge/my/logic/my_hive_model.dart';
import 'package:athlete_go/aag_challenge/my/logic/my_repo.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_btm.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:athlete_go/core/aag_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddMy extends StatefulWidget {
  const AddMy({super.key});

  @override
  State<AddMy> createState() => _AddMyState();
}

class _AddMyState extends State<AddMy> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerTime = TextEditingController();
  final TextEditingController _controllerKcal = TextEditingController();
  final TextEditingController _controllerDes = TextEditingController();

  bool get continueColor {
    return (_controllerName.text.isNotEmpty &&
            _controllerTime.text.isNotEmpty &&
            _controllerKcal.text.isNotEmpty &&
            _controllerDes.text.isNotEmpty &&
            photo != null)
        ? true
        : false;
  }

  File? _image;
  Uint8List? _bytes;
  String? photo;

  Future pickImage() async {
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile == null) return null;

      setState(() => _image = File(pickedFile.path));
      _bytes = _image!.readAsBytesSync();
      photo = String.fromCharCodes(_bytes!);
    } on PlatformException catch (e) {
      Text('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: const BackButton(),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Add chellenge',
          style: AagAppFonts.s20w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              InkWell(
                onTap: () {
                  setState(() {
                    pickImage();
                  });
                },
                child: _image == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(0.r),
                        child: Image.asset(
                          'assets/images/addPhoto.png',
                          width: double.infinity,
                          height: 234.h,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.file(
                          _image!,
                          width: double.infinity,
                          height: 234.h,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Chellenge name',
                style: AagAppFonts.s14w500,
              ),
              SizedBox(height: 6.h),
              AagTextField(
                controller: _controllerName,
                onChanged: (p0) {
                  setState(() {});
                },
                hintText: 'Chellenge name',
                maxLine: 1,
              ),
              SizedBox(height: 12.h),
              Text(
                'Time',
                style: AagAppFonts.s14w500,
              ),
              SizedBox(height: 6.h),
              AagTextField(
                textInputType: TextInputType.number,
                controller: _controllerTime,
                onChanged: (p0) {
                  setState(() {});
                },
                hintText: 'Time',
                maxLine: 1,
              ),
              SizedBox(height: 12.h),
              Text(
                'Calories',
                style: AagAppFonts.s14w500,
              ),
              SizedBox(height: 6.h),
              AagTextField(
                textInputType: TextInputType.number,
                controller: _controllerKcal,
                onChanged: (p0) {
                  setState(() {});
                },
                hintText: 'Calories',
                maxLine: 1,
              ),
              SizedBox(height: 12.h),
              Text(
                'Description',
                style: AagAppFonts.s14w500,
              ),
              SizedBox(height: 6.h),
              AagTextField(
                controller: _controllerDes,
                onChanged: (p0) {
                  setState(() {});
                },
                hintText: 'Description',
                maxLine: 2,
              ),
              SizedBox(height: 12.h),
              InkWell(
                onTap: () async {
                  if (continueColor) {
                    MyHiveModel myHiveModel = MyHiveModel(
                      id: DateTime.now().millisecondsSinceEpoch,
                      name: _controllerName.text,
                      time: int.tryParse(_controllerTime.text) ?? 0,
                      kcal: int.tryParse(_controllerKcal.text) ?? 0,
                      description: _controllerDes.text,
                      image: photo!,
                    );
                    await MyRepoImpl().setMy(myHiveModel);
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const AagDownBar(
                          indexScr: 1,
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                              position: offsetAnimation, child: child);
                        },
                      ),
                      (route) => false,
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: continueColor
                        ? AagAppColors.blue
                        : AagAppColors.blue.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Add Chellenge',
                      style: TextStyle(
                        fontSize: 22.h,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

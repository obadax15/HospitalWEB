import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/radiograph_cubit/radiograph_cubit.dart';
import 'package:hospital/bussines_logic/radiograph_cubit/radiograph_cubit.dart';


import 'package:hospital/constances/mycolor.dart';

class RadiographResponseScreen extends StatefulWidget {
  const RadiographResponseScreen({super.key, required this.id});

  final int id ;

  @override
  State<RadiographResponseScreen> createState() =>
      _RadiographResponseScreenState();
}

class _RadiographResponseScreenState extends State<RadiographResponseScreen> {
  PlatformFile? _pdfFile ;
  PlatformFile? _imageFile ;

  void pickPdf() async {
    // html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    // uploadInput.accept = '.pdf';
    // uploadInput.click();
    //
    // uploadInput.onChange.listen((e) {
    //   final files = uploadInput.files;
    //   if (files?.length == 1) {
    //     final file = files?.first;
    //     setState(() {
    //       _fileName = file?.name;
    //       _file2 = file!;
    //     });
    //     // Process the file further as needed
    //     print('Picked PDF file: ${file?.name}');
    //   }
    // });
    FilePickerResult? pdfResult = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (pdfResult != null && pdfResult.files.isNotEmpty) {
      setState(() {
        _pdfFile = pdfResult.files.first;
      });
    }
  }

  void pickImage() async {
    // // Create an input element for file picking
    // html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    // uploadInput.accept = 'image/*'; // Accept images only
    // uploadInput.click(); // Trigger the file picker
    //
    // // Listen for the file selection
    // uploadInput.onChange.listen((e) {
    //   final files = uploadInput.files;
    //   if (files?.length == 1) {
    //     final file = files?.first;
    //     setState(() {
    //       _fileName1 = file?.name;
    //       _imageFile = file;
    //       _imageUrl =
    //           html.Url.createObjectUrl(file); // Create a URL for the image
    //     });
    //     print('Picked image file: ${file?.name}');
    //   }
    // });
    // Pick Image file
    FilePickerResult? imageResult = await FilePicker.platform.pickFiles(type: FileType.image);
    if (imageResult != null && imageResult.files.isNotEmpty) {
      setState(() {
        _imageFile = imageResult.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: MyColor.myBlue,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'images/img_4.png',
                    height: width / 20,
                    width: width / 10,
                  )),
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.messenger,
                    color: MyColor.mykhli,
                    size: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'الرد',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 500,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: MyColor.mykhli),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.file_present,
                          color: MyColor.mykhli,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'تحميل التقرير',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              pickPdf();
                            },
                            icon: Icon(
                              _pdfFile == null
                                  ? Icons.file_download
                                  : Icons.check,
                              color: MyColor.mykhli,
                              size: 25,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.image,
                          color: MyColor.mykhli,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'تحميل الصورة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            pickImage();
                          },
                          icon: Icon(
                            _imageFile == null
                                ? Icons.file_download
                                : Icons.check,
                            color: MyColor.mykhli,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<RadiographCubit, RadiographState>(
                listener: (context, state) {
                  if (state.radiographStatus == RadiographStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('done successfully'),)) ;
                  }
                },
                builder: (context, state) {
                  return InkWell(
                    onTap: () async {
                      await BlocProvider.of<RadiographCubit>(context).addResponse(widget.id,_imageFile! , _pdfFile!) ;
                    },
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: MyColor.mykhli,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "تم",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

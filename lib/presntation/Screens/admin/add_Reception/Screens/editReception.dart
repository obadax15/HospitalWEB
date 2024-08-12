import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/reception_cubit/reception_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/addreception.dart';

class EditReception extends StatefulWidget {

  final bool isediting;
   List<String> specialists = [
    "Cardiologist",
    "Dermatologist",
    "Neurologist",
    "Orthopedic",
    "Pediatrician"
  ];
  final Map? details;
  final int? id ;

   EditReception({super.key, required this.isediting, this.details, this.id});

  @override
  State<EditReception> createState() => _EditReceptionState();
}

class _EditReceptionState extends State<EditReception> {
  ReceptionController receptionController=ReceptionController();
  @override
  void initState() {
    if (widget.details != null) {
      receptionController.controllers[1].text = widget.details!['fullName'];
      receptionController.controllers[3].text = widget.details!['phoneNumber'];
      receptionController.controllers[2].text = widget.details!['fatherName'];
      receptionController.controllers[0].text = widget.details!['motherName'];
      receptionController.controllers[4].text = widget.details!['internationalNumber'];
      receptionController.controllers[5].text = widget.details!['currentLocation'];
      receptionController.controllers[7].text = widget.details!['gender']== 1 ? 'Male' : "Female";
      receptionController.controllers[6].text = widget.details!['birthdate'];
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ReceptionCubit>(context).getReceptionDetails(widget.id!);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> people = [
      'اسم ونسبة الأم',
      '',
      'اسم ونسبة الأب',

      'الرقم  الشخصي',
      'الرقم  الوطني  ',
      'العنوان',
      'تاريخ الولادة',
      'الجنس',
    ];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(175, 216, 251, 0.3),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30, top: 30),
            child: AppBarContianer(width, height),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: height / 120, crossAxisSpacing: width / 30,
              ),
              itemCount: receptionController.controllers.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width / 13,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          index == 1 ? 'الاسم الثلاثي' : people[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 3,
                      height: height / 18,
                      child: index==8?TextFormField(controller: receptionController.controllers[8],):TextFieldToAddInformationReception(index),
                    ),
                  ],
                );
              },
            ),
          ),
          ButtonToAddReception(height, width),
        ],
      ),
    );
  }

  Container AppBarContianer(double width, double height) {
    return Container(
      width: width,
      height: height / 12,
      decoration: BoxDecoration(
        boxShadow: MyColor.boxshadow,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Center(
          child: Text(
        widget.isediting == true ? ' السكرتارية ${receptionController.controllers[1].text}' : 'أضافة سكرتارية',
        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget ButtonToAddReception(double height, double width) {
    return BlocListener<ReceptionCubit, ReceptionState>(
  listener: (context, state) {
    if(state.receptionStatus==ReceptionStatus.success&& widget.isediting==false){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reception created successfully"))) ;
    }
    // TODO: implement listener
  },
  child: Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(bottom: height / 17, right: width / 13),
        decoration: BoxDecoration(
          boxShadow:MyColor.boxshadow,
          color: const Color.fromRGBO(65, 99, 142, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        height: height / 20,
        width: width / 8,
        child: Center(
          child: InkWell(
            onTap:widget.isediting==false? ()async {
              await BlocProvider.of<ReceptionCubit>(context).createReception(
                  receptionController.controllers[1].text,
                  receptionController.controllers[3].text,
                  receptionController.controllers[2].text,
                  receptionController.controllers[0].text,
                  receptionController.controllers[4].text,
                  receptionController.controllers[5].text,
                  receptionController.controllers[7].text,
                  receptionController.controllers[6].text,
                );
            }: () async {
    await BlocProvider.of<ReceptionCubit>(context).edit_Reception(
        receptionController.controllers[1].text,
        receptionController.controllers[3].text,
        receptionController.controllers[2].text,
        receptionController.controllers[0].text,
        receptionController.controllers[4].text,
        receptionController.controllers[5].text,
        receptionController.controllers[7].text,
        receptionController.controllers[6].text,
    widget.id!
    );},
            child: Text(
              widget.isediting == true ? 'تعديل' : 'انشاء حساب',
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    ),
);
  }

  TextFormField TextFieldToAddInformationReception(int index) {
    return TextFormField(
      controller: receptionController.controllers[index],
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromRGBO(173, 173, 173, 1), width: 1.0),
          borderRadius: BorderRadius.circular(8.0), // Customize borderRadius
        ),
      ),
    );


  }
  String? selectedSpecialist;

  Future<void> _showSpecialistDialog() async {
    final String? specialist = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Specialist'),
          content: SingleChildScrollView(
            child: ListBody(
              children: widget.specialists.map((String specialist) {
                return ListTile(
                  title: Text(specialist),
                  onTap: () {
                    Navigator.pop(context, specialist);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (specialist != null) {
      setState(() {
        selectedSpecialist = specialist;
      });
    }
}}

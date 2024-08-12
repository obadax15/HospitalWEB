import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/bussines_logic/add_lab_emp_cubit/add_lab_emp_cubit.dart';
import 'package:hospital/bussines_logic/reception_cubit/reception_cubit.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/addreception.dart';
import 'package:hospital/presntation/Screens/choose-labrotary-screen/widget/lab_controller.dart';

class Add_Lab_Forms extends StatefulWidget {

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

  Add_Lab_Forms({super.key, required this.isediting, this.details, this.id});

  @override
  State<Add_Lab_Forms> createState() => _Add_Lab_Forms();
}

class _Add_Lab_Forms extends State<Add_Lab_Forms> {
  LabController labController=LabController();
  @override
  void initState() {
    if (widget.details != null) {
      labController.controllers[1].text = widget.details!['fullName'];
      labController.controllers[3].text = widget.details!['phoneNumber'];
      labController.controllers[2].text = widget.details!['fatherName'];
      labController.controllers[0].text = widget.details!['motherName'];
      labController.controllers[4].text = widget.details!['internationalNumber'];
      labController.controllers[5].text = widget.details!['currentLocation'];
      labController.controllers[7].text = widget.details!['gender']== 1 ? 'Male' : "Female";
      labController.controllers[6].text = widget.details!['birthdate'];
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<AddLabEmpCubit>(context).getLabEmpDetails(widget.id!);
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
              itemCount: labController.controllers.length,
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
                      child: index==8?TextFormField(controller: labController.controllers[8],):TextFieldToAddInformationReception(index),
                    ),
                  ],
                );
              },
            ),
          ),
          ButtonToAddLabEmp(height, width),
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
            widget.isediting == true ? ' مخبري ${labController.controllers[1].text}' : 'أضافة موظف مخبري',
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget ButtonToAddLabEmp(double height, double width) {
    return BlocListener<AddLabEmpCubit, Add_Lab_Emp_State>(
      listener: (context, state) {
        if(state.add_lab_emp_status==Add_Lab_Emp_Status.success && widget.isediting==false){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("LabEmp created successfully"))) ;
        }
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
              onTap:widget.isediting==false?

                  () async {
                await BlocProvider.of<AddLabEmpCubit>(context).createLabEmp(
                  labController.controllers[1].text,
                  labController.controllers[3].text,
                  labController.controllers[2].text,
                  labController.controllers[0].text,
                  labController.controllers[4].text,
                  labController.controllers[5].text,
                  labController.controllers[7].text,
                  labController.controllers[6].text,
                );
              }: () async {
                await BlocProvider.of<AddLabEmpCubit>(context).edit_Lab_Emp(
                  labController.controllers[1].text,
                  labController.controllers[3].text,
                  labController.controllers[2].text,
                  labController.controllers[0].text,
                  labController.controllers[4].text,
                  labController.controllers[5].text,
                  labController.controllers[7].text,
                  labController.controllers[6].text,
                  widget.id!
                );
              },
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
      controller: labController.controllers[index],
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

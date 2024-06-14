import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/constances/mycolor.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/editReception.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/addreception.dart';

class ShowReception extends StatefulWidget {
  @override
  _ShowReceptionState createState() => _ShowReceptionState();
}

class _ShowReceptionState extends State<ShowReception> {
  final List<Character> characters =[];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> pathofimages = ['images/img_1.png', 'images/img_2.png', 'images/img_3.png','images/img_2.png','images/img_2.png','images/img_2.png','images/img_2.png','images/img_2.png'];

    return Column(
      children: [
        Container( margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
          decoration: BoxDecoration(
    boxShadow: MyColor.boxshadow,
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      color: Colors.white,
    ),
          height: 50,width:width/1.2,
        child: TextField(
          controller: _searchController,

          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search_outlined),
            hintText: 'Search Reception',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
          ),
          style: const TextStyle(color: Colors.black,),
          onChanged: (value) {
            setState(() {});
          },

        ),
      ),
        const SizedBox(height: 100,),
        Expanded(
          child: GridView.builder(
            physics:const BouncingScrollPhysics() ,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 5, // Number of columns
              childAspectRatio: 1, crossAxisSpacing:0,),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              final searchText = _searchController.text.toLowerCase();
              final characterName = character.controllers[1].text.toLowerCase();
              if (searchText.isNotEmpty && !characterName.contains(searchText)) {
                return const SizedBox.shrink();
              }
              return Dismissible(

                key: Key(characterName),
                onDismissed: (direction) {
                  setState(() {
                    characters.removeAt(index);
                  });
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Container(width:width/7,height: height/5,
                  decoration: BoxDecoration(
                    boxShadow: MyColor.boxshadow,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    hoverColor: Colors.transparent,
                    child: Column(
                      children: [
                        Image.asset(pathofimages.isNotEmpty?
                          pathofimages[index]:'',
                          height: height/7,
                          width: width/7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(characterName.isNotEmpty ? characterName : 'Reception ${index + 1}',style: TextStyle(fontSize: width/80),),

                          ],
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CharacterEditScreen(
                            isediting: characterName.isNotEmpty

                                ?true:false,
                            character: character,

                            onSave: (_) {
                              setState(() {});
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

              );
            },
          ),
        ),
        ElevatedButton(onPressed: () {
    _addNewCharacter();
    }, child: const Icon(Icons.add),),



      ],


    );
  }

  void _addNewCharacter() {
    setState(() {
      characters.add(Character());
    });
  }
}
// onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => CharacterEditScreen(
//         isediting: characterName.isNotEmpty
//
//             ?true:false,
//         character: character,
//
//         onSave: (_) {
//           setState(() {});
//           Navigator.pop(context);
//         },
//       ),
//     ),
//   );
// },
// child: ListTile(
// title: Text(characterName.isNotEmpty
// ? characterName
//     : 'Reception ${index + 1}'),
//
// ),
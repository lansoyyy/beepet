import 'package:beepet/screens/tabs/my_pets/edit_pet_profile_tab.dart';
import 'package:beepet/screens/tabs/pet_record/table_tab.dart';
import 'package:beepet/utils/colors.dart';
import 'package:beepet/widgets/button_widget.dart';
import 'package:beepet/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PetRecordTab extends StatefulWidget {
  var data;

  PetRecordTab({super.key, required this.data});

  @override
  State<PetRecordTab> createState() => _PetRecordTabState();
}

class _PetRecordTabState extends State<PetRecordTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back1.png'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.teal[300],
                        width: double.infinity,
                        height: 50,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              TextBold(
                                  text: 'BeePet',
                                  fontSize: 24,
                                  color: Colors.white),
                              const SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 75),
                        child: Center(
                          child: Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  minRadius: 35,
                                  maxRadius: 35,
                                  backgroundImage: AssetImage(
                                    'assets/images/pet.png',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextBold(
                                    text: 'Pet name: ${widget.data['name']}',
                                    fontSize: 14,
                                    color: solid),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextBold(
                                    text: 'Breed: ${widget.data['breed']}',
                                    fontSize: 14,
                                    color: solid),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextBold(
                                    text: 'Gender: ${widget.data['gender']}',
                                    fontSize: 14,
                                    color: solid),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextBold(
                                    text:
                                        'Birthday: ${widget.data['birthday']}',
                                    fontSize: 14,
                                    color: solid),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ButtonWidget(
                      fontSize: 16,
                      fontColor: solid,
                      width: 100,
                      height: 35,
                      color: Colors.white,
                      label: 'Records',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TableTab(
                                  data: widget.data,
                                )));
                      }),
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                color: primary,
                width: double.infinity,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

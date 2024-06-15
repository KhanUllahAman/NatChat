import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:natchatt/second.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  final List<bool> _checkboxValues = List<bool>.filled(50, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xfff4f0fa),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 70.0,
              color: const Color(0xfff4f0fa),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Text(
                    'Share Contact',
                    style: GoogleFonts.manrope(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[Color(0xFF5A04E5), Color(0xFFAF02F9)],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    child: TextButton(onPressed: () {
                      Get.to(Second());
                    },
                      child: Text('Share',
                      style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors
                            .white,
                      ),)
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search',
                    style: GoogleFonts.manrope(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Icon(Iconsax.search_normal),
                ],
              ),
            ),
            const SizedBox(height: 5.0), // Added space between sections
            Expanded(
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/person1.png'),
                          ),
                          title: Text(
                            'Adrian',
                            style: GoogleFonts.manrope(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            'Hi there! I am using NatChatt',
                            style: GoogleFonts.manrope(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff999999)),
                          ),
                          trailing: CustomCheckbox(
                            value: _checkboxValues[index],
                            onChanged: (bool? value) {
                              setState(() {
                                _checkboxValues[index] = value!;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 270.0, // set your desired width here
                          child: Divider(
                            color: const Color.fromARGB(255, 217, 214, 214),
                            // thickness: 1.0,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          gradient: value
              ? const LinearGradient(
                  colors: [
                    Color(0xFF5A04E5), // #5A04E5
                    Color(0xFFAF02F9), // #AF02F9
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: value ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 16.0,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
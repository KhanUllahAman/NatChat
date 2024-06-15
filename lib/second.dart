import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:natchatt/third.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final List<bool> _checkboxValues = [true, false, false];

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
                      Get.to(ContactListPage());
                    },
                      child: Text(
                        'Share',
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            _buildDynamicSizedCard([
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person2.png'),
                ),
                title: Text(
                  'Kristin',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildContactDetail('Mobile', '+44 20 7183 9879', true, 0),
              _buildDivider(),
              _buildContactDetail('Birthday', '16 June 1986', true, 1),
              _buildDivider(),
              _buildContactDetail('Address', 'New York', false, 2),
            ]),
            _buildDynamicSizedCard([
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person2.png'),
                ),
                title: Text(
                  'Kristin',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildContactDetail('Mobile', '+44 20 7183 9879', true, 0),
            ]),
            _buildDynamicSizedCard([
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person2.png'),
                ),
                title: Text(
                  'Kristin',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildContactDetail('Mobile', '+44 20 7183 9879', true, 0),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicSizedCard(List<Widget> children) {
    return IntrinsicHeight(
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 280,
      child: Divider(
        color: Color.fromARGB(255, 217, 214, 214),
      ),
    );
  }

  Widget _buildContactDetail(String title, String detail, bool checked, int index) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xff5A04E5),
        ),
      ),
      subtitle: Text(
        detail,
        style: GoogleFonts.manrope(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: CustomCheckbox(
        value: _checkboxValues[index],
        onChanged: (bool? value) {
          setState(() {
            _checkboxValues[index] = value!;
          });
        },
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
                    Color(0xFF5A04E5),
                    Color(0xFFAF02F9),
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
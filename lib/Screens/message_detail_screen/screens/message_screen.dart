import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:natchatt/Screens/widgets/message_left_card.dart';
import 'package:natchatt/Screens/widgets/message_right_card.dart';
import 'package:natchatt/Screens/widgets/message_stack_left.dart';
import 'package:natchatt/Screens/widgets/message_stack_right.dart'; // Make sure to import the Iconsax package

class MessageScreenDetail extends StatelessWidget {
  const MessageScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Color(0xFF5A04E5), Color(0xFFAF02F9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    color: Colors
                        .white, // Icon color to be white so the shader mask will be visible
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Color(0xFF5A04E5), Color(0xFFAF02F9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors
                          .white, // Text color to be white so the shader mask will be visible
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/person1.png'),
              radius: 25,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adrian',
                  style: GoogleFonts.manrope(
                    color: Color(0xff303131),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'last seen recently',
                  style: GoogleFonts.manrope(
                    color: Color(0xff999999),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xFF5A04E5), Color(0xFFAF02F9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: IconButton(
                icon: Icon(Iconsax.call),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xFF5A04E5), Color(0xFFAF02F9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: IconButton(
                icon: Icon(Iconsax.video),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  MessageCardLeft(),
                  SizedBox(
                    height: 20,
                  ),
                  MessageCardRight(),
                  SizedBox(
                    height: 20,
                  ),
                  MessageStackCardLeft(),
                  SizedBox(
                    height: 20,
                  ),
                  MessageStackCardRight(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18.0),
              color: Colors.white, // Changing the background color to red
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.attach_file_outlined,
                      color: Color(0xffAF02F9),
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ok see you soon',
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Color(0xffAF02F9),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF5A04E5), Color(0xFFAF02F9)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      color: Colors.white, // Icon color
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

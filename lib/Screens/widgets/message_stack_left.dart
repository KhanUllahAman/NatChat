import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageStackCardLeft extends StatelessWidget {
  const MessageStackCardLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align the card to the left
        children: [
          Container(
            // width: 500,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFAF02F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF8F00CC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none, // Allow overflowing
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/person2.png'),
                            radius: 25,
                          ),
                          Positioned(
                            left: 20,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/person4.png'),
                              radius: 25,
                            ),
                          ),
                          Positioned(
                            left: 40,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/person5.png'),
                              radius: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 50), // Adjusted width to fit the text properly
                      Text(
                        'Kristin and 2 others\ncontacts',
                        style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View all",
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 300),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '2:01 PM',
                  style: GoogleFonts.manrope(
                    color: Color(0xff303131),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

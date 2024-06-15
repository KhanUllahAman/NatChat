import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:natchatt/Screens/message_detail_screen/screens/message_screen.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  final List<Map<String, String>> contacts = [
    {"name": "Kristin", "image": 'assets/images/person2.png'},
    {"name": "Richard", "image": 'assets/images/person1.png'},
    {"name": "Dianne", "image": 'assets/images/person3.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xfff4f0fa),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 70.0,
              color: const Color(0xfff4f0fa),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    'Contacts',
                    style: GoogleFonts.manrope(
                      fontSize: 20, 
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(width: 24), // To balance the space on the right
                ],
              ),
            ),
            // Search Bar
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
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.manrope(
                          fontSize: 16, 
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Iconsax.search_normal),
                ],
              ),
            ),
            const SizedBox(height: 5.0), // Space between sections
            // Contact List
            Expanded(
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(contacts[index]['image']!),
                          ),
                          title: Text(
                            contacts[index]['name']!,
                            style: GoogleFonts.manrope(
                              fontSize: 16, 
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.grey,
                          ),
                          onTap: () {
                                                    Get.to(MessageScreenDetail());

                          },
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 217, 214, 214),
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
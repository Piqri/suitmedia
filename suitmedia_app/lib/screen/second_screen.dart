import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_project/model/profile_model.dart';
import 'package:suitmedia_project/screen/third_screen.dart';
import 'package:suitmedia_project/utils/font_util.dart';

import '../model/user_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: FontUtil.appfont,
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF554AF0),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 32, bottom: 32),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Consumer<DataUser>(
                      builder: (context, provider, child) {
                        return Text(
                          provider.inputUser?.firstName.toString() ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Container(child: Consumer<DataUser>(
                builder: (context, value, child) {
                  return Text(
                    "${value.dataUser?.firstName.toString() ?? "Selected User Name"} ${value.dataUser?.lastName.toString() ?? ""}",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 24),
                    ),
                  );
                },
              )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B637B),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThirdScreen(),
                      ),
                    );
                  },
                  child: const Text('Choose a User'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

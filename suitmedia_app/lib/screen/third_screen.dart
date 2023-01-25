import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_project/model/profile_model.dart';
import 'package:suitmedia_project/model/user_model.dart';
import 'package:suitmedia_project/screen/second_screen.dart';
import 'package:suitmedia_project/view_model/user_view_model.dart';

import '../utils/font_util.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late Future<User> futureUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUser = UserViewModel().getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Third Screen',
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
      body: FutureBuilder<User>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return SizedBox(
                child: ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<DataUser>(context, listen: false)
                            .addUser(snapshot.data!.data![index]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            snapshot.data!.data![index].avatar.toString(),
                          ),
                        ),
                        title: Text(
                          snapshot.data!.data![index].firstName.toString() +
                              ' ' +
                              snapshot.data!.data![index].lastName.toString(),
                        ),
                        subtitle:
                            Text(snapshot.data!.data![index].email.toString()),
                      ),
                    );
                  },
                ),
              );
            }
          }
          return const Text('Tidak ada data');
        },
      ),
    );
  }
}

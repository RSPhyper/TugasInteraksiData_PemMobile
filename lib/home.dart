import 'package:flutter/material.dart';
import 'controller.dart';
import 'Json/Json.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 147, 147, 147),
        title: Text("Interaksi Data Dari Json"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<List<Test>>(
        future: getTests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            final List<Test> testList = snapshot.data!;
            return ListView.builder(
              itemCount: testList.length,
              itemBuilder: (context, index) {
                Test testData = testList[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromARGB(255, 147, 147, 147)),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("UserId        : ${testData.userId}",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 238, 238, 238))),
                                Text("Id                : ${testData.id}",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                Text(
                                  "TestData   : ${testData.title}",
                                  overflow: TextOverflow.visible,
                                  softWrap: true,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                Text("completed : ${testData.completed}",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Gagal memuat data");
          } else {
            return Text("Tidak ada data");
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void incrementCounter() {
    setState(() {
      count = count + 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Staggered Grid Demo"),
            backgroundColor: Colors.green,
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),

              child: Column(
                children: [
                  Text("Count: $count", style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const SizedBox(height: 10),




                  //✅ Staggered Grid View   স্ট্যাগার্ড
                  StaggeredGrid.count(
                    crossAxisCount: 6,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Image.network(
                          "https://picsum.photos/300/300",
                          fit: BoxFit.cover,
                        ),
                      ),

                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: Image.network(
                          "https://picsum.photos/300/400",
                          fit: BoxFit.cover,
                        ),
                      ),

                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: Image.network(
                          "https://picsum.photos/300/350",
                          fit: BoxFit.cover,
                        ),
                      ),

                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: Image.network(
                          "https://picsum.photos/300/450",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),


                  Text("StaggeredGrid End"),

                  MasonryGridView.count(     //✅ Masonry Grid View   মেসনারি
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Image.network('https://picsum.photos/300/450'),
                            const Text('Image!'),
                          ],
                        ),
                      );
                    },
                  ),



                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                          ),
                          title: Container(
                            height: 16,
                            color: Colors.white,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: 12,
                              width: 120,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),


                ],
              ),
            ),
          ),


          floatingActionButton: FloatingActionButton(
            onPressed: () {
              incrementCounter();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Increment Counter")),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
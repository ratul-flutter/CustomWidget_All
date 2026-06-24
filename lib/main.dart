import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  MyApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Ocean(
              imageURL:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkCGrhADwglWT766Pa9NXeOe74pc0fNIBsyX1kxs63OfQHHVgO6XCAoWDA&s=10",
              top: "Top Destination",
              title: "Tourist Capital of Bangladesh",
              location: "southeastern region",
              description: "Cox's Bazar is famous for hosting the\nworld's longest unbroken natural sandy \nbeach, stretching over 120 kilometers\nalong the Bay of Bengal.",
            ),
            SizedBox(height: 30),
            Ocean(
              imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJNPy4n09xByUQdG28Dj7ZjLaqQRrOT0NU4KsYmQ5cViOwtKSby_h7BehN&s=10",
              top: "Top Destination",
              title: "The Kingdom of Clouds",
              location: "Southeastern Hill Region",
              description: "Bandarban is home to the highest peaks\nin Bangladesh,pristine waterfalls, and the \nbreathtaking beauty of Nilgiri ",
            ),
            SizedBox(height: 30),
            Ocean(
                imageURL: "https://upload.wikimedia.org/wikipedia/commons/7/73/Hanging_bridge_of_Rangamati%2C_Bangladesh._.jpg",
                top: "Lake",
                title: "The Scenic Lake City", // সীনিক = মনোরম,প্রাকৃতিক দৃশ্যসমৃদ্ধ,, মনোরম হ্রদের শহর
                location: "Chittagong Hill Tracts",
                description: "Rangamati is famous for the mesmerizing\nKaptai Lake, he iconic Hanging Bridge, and \nSajek Valley—the beautiful queen of hills nestled amidst\nfloating clouds")
          ],
        ),
      ),
    );
  }
}




class Ocean extends StatelessWidget {
  final String imageURL;
  final String top;
  final String title;
  final String location;
  final String description;

  const Ocean({
    super.key,
    required this.imageURL,
    required this.top,
    required this.title,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(imageURL),
            fit: BoxFit.cover,
          ),
          boxShadow: [ BoxShadow(
            color: Colors.black,
            blurRadius: 20.6,
            offset: Offset(0,2),
          )]
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: [
                Colors.black54.withValues(alpha: 0.01),
                Colors.black54.withValues(alpha: 0.20),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(top, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                //  const SizedBox(height: 6),

                Text(title, style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                ),
                //const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.yellow, size: 30),
                    SizedBox(width: 8),
                    Text(location, style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    ),
                  ],
                ),
                // মাঝখানে একটু গ্যাপ দেওয়ার জন্য (ডিজাইন সুন্দর রাখবে)
                const SizedBox(height: 50),


                Text(description,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.travel_explore),
                      label: const Text("Explore"),
                    ),
                    const SizedBox(width: 24),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.play_arrow, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.45),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.favorite, color: Colors.red),
                    ),
                    SizedBox(width: 15),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.45),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.inbox, color: Colors.yellow),
                    )
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.20),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      )
                  ),
                  child: Column(
                    children: [
                      Text("4.9 Rating", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text("10k Reviews",style: TextStyle(
                            color: Colors.white,
                          ),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

  }
}
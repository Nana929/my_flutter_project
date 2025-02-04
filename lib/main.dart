import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            // padding of the whole page
            child: Padding(
      padding: EdgeInsets.fromLTRB(12, 30, 12, 20),

      // 1 column 8 rows
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // The Column( ) uses SpaceBetween for the layout

        children: [
          // 1st row: text to the center
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                Text("browse categories".toUpperCase(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    )),
              ],
            ),
          ]),

          // 2nd row: text to the left
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              // expand text
              child: Column(
                children: [
                  Text(
                    "Not sure about exactly which recipe you're looking for? "
                    "Do a search, or dive into our most popular categories.",
                    style: TextStyle(fontSize: 15, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ]),

          // 3rd row: text to the center
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                Text("by meat".toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2)),
              ],
            ),
          ]),

          // 4th row: meat images
          Row(
              // 1 row, 4 columns
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, // The rows of images use SpaceAround to put spacing around them.
              children: [
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage('images/beef.jpg'),
                          radius: 46),
                      Text("beef".toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              // add shadow to the text
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 6.0,
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage('images/chicken.jpg'),
                          radius: 46),
                      Text(
                        "chicken".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            // add shadow to the text
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 6.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage('images/pork.jpg'),
                          radius: 46),
                      Text("pork".toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              // add shadow to the text
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 6.0,
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage('images/seafood.jpg'),
                          radius: 46),
                      Text("seafood".toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              // add shadow to the text
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 6.0,
                                color: Colors.black,
                              ),
                            ],
                          )),
                    ],
                  ),
                ]),
              ]),

          // 5th row: text to the center
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                Text("by course".toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2)),
              ],
            ),
          ]),

          // 6th row: course images
          Row(
              // 1 row, 4 columns
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, // The rows of images use SpaceAround to put spacing around them.
              children: [
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/main-dishes.jpg'),
                              radius: 46),
                          Text("Main Dishes", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                              backgroundImage: AssetImage('images/salad.jpg'),
                              radius: 46),
                          Text("Salad", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/side-dishes.jpg'),
                              radius: 46),
                          Text("Side Dishes", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/crockpot.jpg'),
                              radius: 46),
                          Text("Crockpot", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ]),
              ]),

          // 7th row: text to the center
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                Text("by dessert".toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2)),
              ],
            ),
          ]),

          // 8th row: dessert images
          Row(
              // 1 row, 4 columns
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, // The rows of images use SpaceAround to put spacing around them.
              children: [
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/ice—cream.jpg'),
                              radius: 46),
                          Text("Ice Cream", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/brownies.jpg'),
                              radius: 46),
                          Text("Brownies", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          CircleAvatar( 
                              backgroundImage: AssetImage('images/pie.jpg'),
                              radius: 46),
                          Text("Pies", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Column(children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                              backgroundImage: AssetImage('images/cookies.jpg'),
                              radius: 46),
                          Text("Cookies", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ]),
              ]),
        ],
      ),
    )));
  }
}

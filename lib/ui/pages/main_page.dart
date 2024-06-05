part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _NavigationExampleState createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<MainPage> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const <Widget>[
          // HomePage(),
          // FormPage(),
          // ProfilePage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // BoxShadow container
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: softGreyColor,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            // Actual navigation bar container
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: softGreyColor,
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    indicatorColor: Colors.transparent,
                    labelTextStyle: WidgetStateProperty.all(
                      TextStyle(color: blueColor),
                    ),
                    iconTheme: WidgetStateProperty.all(
                      IconThemeData(color: blueColor),
                    ),
                  ),
                  child: NavigationBar(
                    backgroundColor: whiteColor,
                    labelBehavior: labelBehavior,
                    selectedIndex: currentPageIndex,
                    onDestinationSelected: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    destinations: <Widget>[
                      NavigationDestination(
                        icon: Icon(Icons.home_outlined, color: blueColor),
                        label: 'Home',
                        selectedIcon: Icon(Icons.home, color: blueColor),
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.article_outlined, color: blueColor),
                        label: 'Form',
                        selectedIcon:
                            Icon(Icons.article_rounded, color: blueColor),
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.person_outline, color: blueColor),
                        label: 'Profile',
                        selectedIcon: Icon(Icons.person, color: blueColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
runApp(const ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
const ResponsiveApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Responsive Website',
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: Colors.indigo,
),
useMaterial3: true,
),
home: const HomePage(),
);
}
}

class HomePage extends StatefulWidget {
const HomePage({super.key});

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int selectedIndex = 0;

final List<String> menuItems = [
'Home',
'About',
'Services',
'Contact',
];

void navigateTo(int index) {
setState(() {
selectedIndex = index;
});
}

@override
Widget build(BuildContext context) {
return LayoutBuilder(
builder: (context, constraints) {
final bool isMobile = constraints.maxWidth < 700;

return Scaffold(
drawer: isMobile
? Drawer(
child: SafeArea(
child: Column(
children: [
const DrawerHeader(
child: Center(
child: Text(
'MY WEBSITE',
style: TextStyle(
fontSize: 25,
fontWeight: FontWeight.bold,
),
),
),
),
...List.generate(
menuItems.length,
(index) => ListTile(
leading: Icon(
[
Icons.home,
Icons.info,
Icons.work,
Icons.mail,
][index],
),
title: Text(menuItems[index]),
selected: selectedIndex == index,
onTap: () {
navigateTo(index);
Navigator.pop(context);
},
),
),
],
),
),
)
    : null,

body: SafeArea(
child: Column(
children: [
// HEADER
Container(
width: double.infinity,
padding: EdgeInsets.symmetric(
horizontal: isMobile ? 16 : 50,
vertical: 16,
),
color: Colors.indigo,
child: Row(
children: [
if (isMobile)
Builder(
builder: (context) => IconButton(
onPressed: () {
Scaffold.of(context).openDrawer();
},
icon: const Icon(
Icons.menu,
color: Colors.white,
),
),
),
const Icon(
Icons.language,
size: 32,
color: Colors.white,
),
const SizedBox(width: 10),
const Expanded(
child: Text(
'My Website',
style: TextStyle(
color: Colors.white,
fontSize: 23,
fontWeight: FontWeight.bold,
),
),
),
if (!isMobile)
Row(
children: List.generate(
menuItems.length,
(index) => TextButton(
onPressed: () => navigateTo(index),
child: Text(
menuItems[index],
style: TextStyle(
color: selectedIndex == index
? Colors.amber
    : Colors.white,
fontSize: 16,
),
),
),
),
),
],
),
),

// MAIN BODY
Expanded(
child: SingleChildScrollView(
child: Center(
child: ConstrainedBox(
constraints: const BoxConstraints(
maxWidth: 1200,
),
child: Padding(
padding: EdgeInsets.all(
isMobile ? 20 : 45,
),
child: Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Text(
[
'Welcome to Our Website',
'About Us',
'Our Services',
'Contact Us',
][selectedIndex],
style: TextStyle(
fontSize: isMobile ? 29 : 42,
fontWeight: FontWeight.bold,
color: Colors.indigo,
),
),
const SizedBox(height: 16),
Text(
[
'Build beautiful, responsive applications '
'for web, Android and iOS using Flutter.',
'We create modern and responsive '
'applications for every screen size.',
'Explore our development, design and '
'cross-platform application services.',
'Get in touch with our team to discuss '
'your next application.',
][selectedIndex],
style: const TextStyle(
fontSize: 17,
height: 1.7,
),
),
const SizedBox(height: 30),

// RESPONSIVE CONTENT CARDS
Wrap(
spacing: 20,
runSpacing: 20,
children: [
_buildCard(
Icons.devices,
'Responsive Design',
'Adapts to mobile, tablet and desktop.',
constraints.maxWidth,
),
_buildCard(
Icons.speed,
'Fast Performance',
'One Flutter codebase for multiple platforms.',
constraints.maxWidth,
),
_buildCard(
Icons.palette,
'Modern UI',
'Clean layouts with reusable components.',
constraints.maxWidth,
),
],
),
const SizedBox(height: 35),

SizedBox(
width: isMobile
? double.infinity
    : 200,
height: 48,
child: ElevatedButton(
onPressed: () {
navigateTo(2);
},
child: const Text('Explore Services'),
),
),
],
),
),
),
),
),
),

// FOOTER
Container(
width: double.infinity,
color: const Color(0xFF172554),
padding: EdgeInsets.symmetric(
horizontal: isMobile ? 20 : 50,
vertical: 24,
),
child: isMobile
? const Column(
children: [
Icon(
Icons.language,
color: Colors.white,
size: 30,
),
SizedBox(height: 10),
Text(
'My Website',
style: TextStyle(
color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 8),
Text(
'Built with Flutter',
style: TextStyle(
color: Colors.white70,
),
),
SizedBox(height: 12),
Text(
'© 2026 My Website. All rights reserved.',
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.white70,
fontSize: 12,
),
),
],
)
    : const Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
Text(
'© 2026 My Website. All rights reserved.',
style: TextStyle(
color: Colors.white70,
),
),
Text(
'Built with Flutter',
style: TextStyle(
color: Colors.white,
),
),
],
),
),
],
),
),
);
},
);
}

Widget _buildCard(
IconData icon,
String title,
String description,
double screenWidth,
) {
final double cardWidth = screenWidth < 500
? screenWidth - 40
    : screenWidth < 900
? (screenWidth - 90) / 2
    : 340;

return SizedBox(
width: cardWidth.clamp(220.0, 340.0),
child: Card(
elevation: 3,
child: Padding(
padding: const EdgeInsets.all(24),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(
icon,
size: 42,
color: Colors.indigo,
),
const SizedBox(height: 16),
Text(
title,
style: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 10),
Text(
description,
style: const TextStyle(
fontSize: 15,
height: 1.5,
),
),
],
),
),
),
);
}
}

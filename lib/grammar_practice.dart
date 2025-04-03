import 'package:flutter/material.dart';

// 🧠 1. Function using List
String getFruitList(){
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  return fruits.join(', ');
}

// 🧠 2. Function using Map
String getUserInfo(){
  Map<String, dynamic> user = {
    'name': 'Harry',
    'age': 28,
    'country': 'New Zealand',
  };
  return "Name: ${user['name']}, Age: ${user['age']}, Country: ${user['country']}";
}

// 🧠 3. Function using switch-case
String getDayMessage(String day){
  switch (day) {
    case 'Monday':
      return "Start of the week!";
    case 'Friday':
      return "Almost weekend!";
    case 'Saturday':
    case 'Sunday':
      return "It's weekend!";
    default:
      return "Just another day.";
  }
}

class Person{
  String name;
  int age;

  Person(this.name, this.age);

  String introduce() {
    return "My name is $name and I'm $age years old.";
  }
}

// 🧠 Function using if/else
String checkAge(int age){
  if (age >= 18) {
    return "You're an adult.";
  } else {
    return "You're a minor.";
  }
}

// 🧠 Function using a for loop
String listNumbers(){
  String result = "";
  for (int i = 1; i<= 5; i++){
    result +="$i ";
  }
  return result.trim();
}

class GrammarPracticePage extends StatefulWidget {
  const GrammarPracticePage({super.key});

  @override
  State<GrammarPracticePage> createState() => _GrammarPracticePageState();
}

class _GrammarPracticePageState extends State<GrammarPracticePage> {
  final TextEditingController nameController = TextEditingController();
  String greetingMessage = "Enter your name and press the button";

  void updateGreeting(){
    setState(() {
      String name = nameController.text.trim();
      if (name.isEmpty){
        greetingMessage = "Please enter a name!";
      } else {
        greetingMessage = "Hello, $name!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StatefulWidget Practice")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "What's your name?",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height:16),
            TextField(
              controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: updateGreeting,
              child: const Text("Say Hello"),
            ),
            const SizedBox(height: 30),
            Text(
              greetingMessage,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      )
    );
  }
}

//// old one commented out to test code.

// class GrammarPracticePage extends StatelessWidget {
//   const GrammarPracticePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final greeting = getGreeting("Harry");
//     final ageCheck = checkAge(20);
//     final numbers = listNumbers();
//
//     final fruits = getFruitList();
//     final userInfo = getUserInfo();
//     final dayMessage = getDayMessage("Friday");
//     final person = Person("Harry", 28).introduce();
//
//     //Scaffold : the base layout structure of your screen. without this, screen would be blank and unmanaged.
//     return Scaffold(
//       appBar: AppBar(title: const Text("Grammar harry practice")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0), // padding: adds space around a widget.
//         child: Column( // Column : layout widget that arrages its children vertically.
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(greeting, style: const TextStyle(fontSize: 24)),
//             // SizedBox : widget that gives fixed space or fixed size between or around widgets.
//             const SizedBox(height: 50),
//             Text("🍎 Fruit List: $fruits", style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 16),
//             Text("👤 User Info: $userInfo", style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 16),
//             Text("📆 Message for Friday: $dayMessage", style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 16),
//             Text("🙋‍♂️ From Person class: $person", style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 24),
//             const Text("🎯 Try creating your own List, Map, class, or switch!", style: TextStyle(fontSize: 16)),
//           ],
//         ),
//       ),
//     );
//   }
// }
String getGreeting(String name) {
  return "Hello, $name!";
}
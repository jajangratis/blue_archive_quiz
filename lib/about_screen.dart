import 'package:blue_archive_quiz/components/back_button.dart';
import 'package:blue_archive_quiz/components/title_text.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const BackIconButton(),
          title: const TitleText(input: "About",),
          backgroundColor: const Color.fromARGB(255, 139, 193, 237),
          centerTitle: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 139, 193, 237)
            ),
          child:Column(
            mainAxisSize: MainAxisSize.max, // Adjusts size based on content
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              Image.asset(
                'assets/images/Sensei_Doodle_Icon.webp', 
                width: 300,
                // color: const Color.fromARGB(86, 64, 123, 200),
              ),
              const SizedBox(height: 30,),
              Text(
                textAlign: TextAlign.center,
                "Aplikasi tentang quiz singkat blue archive dimana user akan disuguhkan dengan berberapa pertanyaan dengan gambar dan user bisa memilih jawaban yang tepat, aplikasi ini digunakan sebagai demo untuk tugas akhir dicoding",  
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:Theme.of(context).colorScheme.onSurface)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
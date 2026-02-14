// main.dart
import 'package:flutter/material.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maruf Akter Jon'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Projects'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Contact'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          HeroSection(),
          SizedBox(height: 24),
          SkillsSection(),
          SizedBox(height: 24),
          ProjectsSection(),
          SizedBox(height: 24),
          ContactSection(),
          SizedBox(height: 24),
          FooterSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I’m Maruf 👋',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          'Flutter Developer • UI/UX Enthusiast • Problem Solver',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 14),
        Text(
          'I build fast, responsive apps using Flutter. I love clean UI, '
          'smooth user experience, and simple code.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.work),
              label: const Text('View Projects'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.mail),
              label: const Text('Contact Me'),
            ),
          ],
        ),
      ],
    );

    final avatar = CircleAvatar(
      radius: 70,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Icon(
        Icons.person,
        size: 70,
        color: Theme.of(context).colorScheme.primary,
      ),
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: isWide
            ? Row(
                children: [
                  Expanded(child: intro),
                  const SizedBox(width: 18),
                  avatar,
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  avatar,
                  const SizedBox(height: 16),
                  intro,
                ],
              ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'REST API',
      'State Management',
      'Git/GitHub',
      'UI Design',
    ];

    return SectionCard(
      title: 'Skills',
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: skills
            .map(
              (s) => Chip(
                label: Text(s),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: 'To-Do App',
        description: 'A simple to-do app with add, edit, delete tasks.',
        tech: const ['Flutter', 'Dart'],
      ),
      Project(
        title: 'Weather App',
        description: 'Shows live weather using an API and clean UI.',
        tech: const ['Flutter', 'REST API'],
      ),
      Project(
        title: 'Portfolio Website',
        description: 'Responsive portfolio made using Flutter web.',
        tech: const ['Flutter Web'],
      ),
    ];

    return SectionCard(
      title: 'Projects',
      child: Column(
        children: projects
            .map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProjectTile(project: p),
                ))
            .toList(),
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(project.description),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.tech.map((t) => Chip(label: Text(t))).toList(),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.link),
                  label: const Text('Live Demo'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.code),
                  label: const Text('Source Code'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Contact',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email: marufakterjon@gmail.com'),
          const SizedBox(height: 8),
          const Text('Location: Your City, Country'),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.mail),
                label: const Text('Email Me'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.facebook),
                label: const Text('Facebook'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.language),
                label: const Text('Website'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '© ${DateTime.now().year} Maruf Akter Jon — Built with Flutter',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final List<String> tech;

  Project({
    required this.title,
    required this.description,
    required this.tech,
  });
}

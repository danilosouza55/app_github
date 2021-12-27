import 'package:app_github/src/domain/usecases/search.dart';
import 'package:app_github/src/presenter/theme/home_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<Search>(context);
    final user = search.user;

    if (user != null) {
      return HomeTheme(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100,
                  child: ClipOval(
                    child: Image.network(
                      user.avatarUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      user.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      user.bio,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_add_alt,
                        ),
                        Text(
                          ' ${user.followers} followers',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ' ${user.following} following',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                user.company,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                user.email,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                user.login,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Text(
        'Sem dados',
      );
    }
  }
}

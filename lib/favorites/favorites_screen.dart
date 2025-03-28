import 'package:azakarstream/drama/watch_video_screen.dart';
import 'package:flutter/material.dart';
import 'favorite_manager.dart'; // Import the favorite manager
import '../dashboard/movie_details_screen.dart'; // Import the movie details screen
import '../dashboard/dashboard_screen.dart'; // Import your dashboard screen
import '../profile/profile_screen.dart'; // Import your profile screen

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final int _selectedIndex = 1; // Index for Favorites tab (0-indexed)

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
    else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const FavoriteScreen()),
          );
        }
    else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
    else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WatchVideoScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDarkMode
              ? [
                  const Color(0xFF660066),
                  const Color(0xFF4d004d),
                  const Color(0xFF330033),
                  const Color(0xFF1a001a),
                  const Color(0xFF993366),
                  const Color(0xFF000000),
                ]
              : [
                  const Color(0xFFf9e6ff),
                  const Color(0xFFf9e6ff),
                  const Color(0xFFf2ccff),
                  const Color(0xFFecb3ff),
                  const Color(0xFFe699ff),
                  const Color(0xFFdf80ff),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Favorites'),
          backgroundColor: const Color(0xFF4d0066),
          foregroundColor: const Color(0xFFF5EFE6),
        ),
        body: favoriteManager.favoriteMovies.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Your favorite movies will appear here.',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d0066),
                        foregroundColor: const Color(0xFFF5EFE6),
                      ),
                      child: const Text('Explore Movies'),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: favoriteManager.favoriteMovies.length,
                itemBuilder: (context, index) {
                  final movie = favoriteManager.favoriteMovies[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12.0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          movie['imageUrl']!,
                          width: 70,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        movie['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            "Genre: ${movie['genre']}",
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            favoriteManager.toggleFavorite(movie);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${movie['title']} removed from favorites.",
                                style: const TextStyle(fontSize: 14),
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                              title: movie['title']!,
                              genre: movie['genre']!,
                              duration: movie['duration']!,
                              rating: movie['rating']!,
                              description: movie['description']!,
                              imageUrl: movie['imageUrl']!,
                              videoUrl: movie['videoUrl']!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_fill),
          label: 'Segments',
        ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: const Color(0xFF4d0066),
          selectedItemColor: const Color(0xFFF5EFE6),
          unselectedItemColor: const Color(0xFFF5EFE6).withOpacity(0.5),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
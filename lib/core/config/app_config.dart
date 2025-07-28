class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;
  AppConfig._internal();

  // Base url
  String get baseUrl => 'http://173.249.35.253:3000';

  
  // Supabase configuration
  String get supabaseUrl => 'https://lknomrmcfhlhviewxvxq.supabase.co';
  String get supabaseAnonKey => 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxrbm9tcm1jZmhsaHZpZXd4dnhxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM2MTU1NjAsImV4cCI6MjA2OTE5MTU2MH0.3YfJTHVjAK66jrnmvKfvWRARma9YYQhW0IScTOQ6i5k'; 

  // Auth endpoints
  String get loginEndpoint => '$baseUrl/auth/login';
  String get registerEndpoint => '$baseUrl/auth/register';

  //dummy json
  String get todoEndpoint => 'http://dummyjson.com/todos';

  // Course endpoints
  String get getAllCoursesEndpoint => '$baseUrl/course';
  String getCourseDetails(int id) => '$baseUrl/course/$id';

  String get getAllTakenEndpoint => '$baseUrl/categoery';

  // Author
  String get getAllAuthorsEndpoint => '$baseUrl/author';
  String getAuthorCoursesEndpoint(String id) => '$baseUrl/author/$id/courses';
  String getAuthorById(String id) => '$baseUrl/author/$id';

  // Skill
  String get getAllSkillsEndpoint => '$baseUrl/skill';

  // Category
  String get getAllCategoriesEndpoint => '$baseUrl/category';

  Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Duration get connectionTimeout => const Duration(seconds: 30);
  Duration get receiveTimeout => const Duration(seconds: 30);
}
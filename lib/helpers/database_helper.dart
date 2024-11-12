import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_data.db');
    return await openDatabase(
      path,
      version: 2, // Incrementa a versão para executar as novas criações de tabela
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            password TEXT,
            is_admin INTEGER DEFAULT 0
          )
        ''');
        await db.execute('''
          CREATE TABLE cars(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            model TEXT,
            year INTEGER,
            price_per_day REAL
          )
        ''');

        // Insere automaticamente o administrador padrão
        await db.insert('users', {
          'username': 'admin',
          'password': 'admin',
          'is_admin': 1,
        });
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS cars(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              model TEXT,
              year INTEGER,
              price_per_day REAL
            )
          ''');
          await db.execute('''
            ALTER TABLE users ADD COLUMN is_admin INTEGER DEFAULT 0
          ''');

          // Verifica se o administrador já existe antes de inseri-lo
          List<Map<String, dynamic>> adminCheck = await db.query(
            'users',
            where: 'username = ?',
            whereArgs: ['admin'],
          );

          if (adminCheck.isEmpty) {
            await db.insert('users', {
              'username': 'admin',
              'password': 'admin',
              'is_admin': 1,
            });
          }
        }
      },
    );
  }

  // Método para registrar um usuário
  Future<int> registerUser(String username, String password, {bool isAdmin = false}) async {
    final db = await database;
    try {
      int result = await db.insert(
        'users',
        {
          'username': username,
          'password': password,
          'is_admin': isAdmin ? 1 : 0
        },
      );
      if (kDebugMode) {
        print('User registered with ID: $result');
      }
      return result; // Retorna o ID do novo registro
    } catch (e) {
      if (kDebugMode) {
        print('Error registering user: $e');
      }
      return -1; // Indica que o usuário já existe ou houve erro
    }
  }

  // Método para verificar login
  Future<bool> loginUser(String username, String password) async {
    final db = await database;
    try {
      List<Map<String, dynamic>> result = await db.query(
        'users',
        where: 'username = ? AND password = ?',
        whereArgs: [username, password],
      );
      if (kDebugMode) {
        print('Login query result: $result');
      }
      return result.isNotEmpty; // Retorna true se o usuário for encontrado
    } catch (e) {
      if (kDebugMode) {
        print('Error during login: $e');
      }
      return false; // Indica erro durante a consulta
    }
  }

  // Método para verificar se o usuário é administrador
  Future<bool> isAdmin(String username) async {
    final db = await database;
    try {
      List<Map<String, dynamic>> result = await db.query(
        'users',
        where: 'username = ? AND is_admin = 1',
        whereArgs: [username],
      );
      return result.isNotEmpty;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking admin status: $e');
      }
      return false;
    }
  }

  Future<void> printAllUsers() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query('users');
    for (var user in result) {
      if (kDebugMode) {
        print('User: ${user['username']}, Password: ${user['password']}, Is Admin: ${user['is_admin']}');
      }
    }
  }

  // Método para adicionar um carro
  Future<int> addCar(String name, String model, int year, double pricePerDay) async {
    final db = await database;
    return await db.insert('cars', {
      'name': name,
      'model': model,
      'year': year,
      'price_per_day': pricePerDay,
    });
  }

  // Método para buscar todos os carros
  Future<List<Map<String, dynamic>>> getCars() async {
    final db = await database;
    return await db.query('cars');
  }
}

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/apartment_model.dart';
import 'models/notice_model.dart';
import 'models/user_details_model.dart';
import 'models/visitor_details_model.dart';


// ignore: prefer_typing_uninitialized_variables
var database;
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  String dbPath = await getDatabasesPath();
   database = openDatabase(
    
    join(await getDatabasesPath(), 'nexus.db'),
   
    onCreate: (db, version) async{
     
      await db.execute(
        '''CREATE TABLE visitors(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, number VARCHAR(12),imagepath VARCHAR(100),type VARCHAR(20),duration VARCHAR(20),intime VARCHAR(20),inDate VARCHAR(20),outtime VARCHAR(20),outdate VARCHAR(20),elapsed VARCHAR(20))''',
      );
      await db.execute(
        '''CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, firstname TEXT, lastname TEXT,number VARCHAR(12),imagepath VARCHAR(100),gender VARCHAR(30),role VARCHAR(20),email VARCHAR(50),flatno VARCHAR(20),blockName VARCHAR(20),ventureName VARCHAR(20))''',
      );
     await db.execute(
        '''CREATE TABLE apartments(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, fullname TEXT,contactnumber VARCHAR(12),stayingperson VARCHAR(20),whichflore VARCHAR(20),flatno VARCHAR(20))''',
      );
       await db.execute(
        '''CREATE TABLE notice(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT,description VARCHAR(100),startDate VARCHAR(40),endDate VARCHAR(20),createdby VARCHAR(20))''',
      );
    },
    
    version: 1,
  );
 
  visList = await visit();
  flatList=await apartment();
  userList=await user();
  noticeList=await notice();
  //visList.add(fido);
 // ignore: avoid_print
 print('database path is'+ dbPath);
}

Future<String> alterTable() async {
  final db = await database;
  var count = await db.execute("ALTER TABLE visitors ADD COLUMN apartmentName VARCHAR(50)");
// ignore: avoid_print
  print(await database.query('visitors'));
  return count;
}

// Define a function that inserts data into the database
  Future<void> insertVisitor(VisitorData visitor) async {
    
    final db = await database;
    await db.insert(
      'visitors',
      visitor.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // ignore: avoid_print
    print('inserted  is '+ visitor.toString());
  }
  
  Future<List<VisitorData>> visit() async {
  
    final db = await database;

    
    final List<Map<String, dynamic>> maps = await db.query('visitors');
// ignore: avoid_print
    print(' List of visitors are'+maps.toString());

    List<VisitorData> visitlist=  List.generate(maps.length, (i) {
      return VisitorData (
        id: (maps[i]['id'].toString()),
        visitorName: maps[i]['name'].toString(),
        visitorNumber: maps[i]['number'].toString(),
        visitorImage: maps[i]['imagepath'].toString(),
        typeOfVisitor: maps[i]['type'].toString(),
        expectedDuration: maps[i]['duration'].toString(),
        inTime: maps[i]['intime'].toString(),
        inDate: maps[i]['inDate'].toString(),
        outTime: maps[i]['outtime'].toString(),
        outDate: maps[i]['outdate'].toString(),
        timeElapsed: maps[i]['elasped'].toString(),

      );
    });
    
    visList = visitlist;
    return visitlist;
  }

  Future<void> insertUser(UserProfileData user) async {
    
    final db = await database;
   
     await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // ignore: avoid_print
    print('inserted  is '+ user.toString());
  }

Future<List<UserProfileData>> user() async {
  
    final db = await database;

    
    final List<Map<String, dynamic>> maps = await db.query('users');
// ignore: avoid_print
    print(' List of users are'+maps.toString());

    List<UserProfileData> userslist=  List.generate(maps.length, (i) {
      return UserProfileData (
        id: (maps[i]['id'].toString()),
        firstName: maps[i]['firstname'].toString(),
        lastName: maps[i]['lastname'].toString(),
        role: maps[i]['role'].toString(),
        number: maps[i]['number'].toString(),
        emailId: maps[i]['email'].toString(),
        ventureName: maps[i]['ventureName'].toString(),
        flatNo: maps[i]['flatno'].toString(),
        blockName: maps[i]['blockName'].toString(),
        image: maps[i]['imagepath'].toString(),
        gender: maps[i]['gender'].toString(),

      );
    });
    
    userList = userslist;
    return userslist;
  }

Future<void> insertFlat(ApartmentData apartment) async {
    
    final db = await database;
   
     await db.insert(
      'apartments',
      apartment.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // ignore: avoid_print
    print('inserted  is '+ apartment.toString());
  }

  
//apartment module for to get list of data
  Future<List<ApartmentData>> apartment() async {
  
    final db = await database;

    
    final List<Map<String, dynamic>> maps = await db.query('apartments');
// ignore: avoid_print
    print(' List of flats are'+maps.toString());

    List<ApartmentData> apartmentslist=  List.generate(maps.length, (i) {
      return ApartmentData (
        id: (maps[i]['id'].toString()),
        relationship: maps[i]['relationship'].toString(),
        name: maps[i]['name'].toString(),
        mobilenumber: maps[i]['mobilenumber'].toString(),
        flatno: maps[i]['flatno'].toString(),
        floor: maps[i]['floor'].toString(),
        
      );
    });
    
    flatList = apartmentslist;
    return apartmentslist;
  }


Future<void> updateFlat(ApartmentData apartment) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'apartments',
      apartment.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [apartment.id],
    );
    // ignore: avoid_print
    print('updated apartment details'+ apartment.id.toString());
  }
  // A method that retrieves all the visitors from the visitors table.
  
Future<void> insertNotice(NoticeData notice) async {
    
    final db = await database;
    await db.insert(
      'notice',
      notice.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // ignore: avoid_print
    print('inserted  is '+ notice.toString());
  }
  
  Future<List<NoticeData>> notice() async {
  
    final db = await database;

    
    final List<Map<String, dynamic>> maps = await db.query('notice');
// ignore: avoid_print
    print(' List of notices are'+maps.toString());

    List<NoticeData> noticelist=  List.generate(maps.length, (i) {
      return NoticeData (
        id: (maps[i]['id'].toString()),
        title: maps[i]['title'].toString(),
        description: maps[i]['description'].toString(),
        startDate: maps[i]['startDate'].toString(),
        endDate: maps[i]['endDate'].toString(),
        createdby: maps[i]['createdby'].toString(),
       
      );
    });
    
    noticeList = noticelist;
    return noticelist;
  }




  Future<void> deleteVisitor() async {
    // Get a reference to the database.
    final db = await database;

    // Remove the visitor from the database.
    await db.delete(
      'visitors',
      
    );
  }
  
Future<void> deleteNotice(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the visitor from the database.
    await db.delete(
      'notice',
       // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    
    
  }
 
  
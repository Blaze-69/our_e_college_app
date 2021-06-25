import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'bottombar/bottomBarScreens.dart';
import 'bottombar/bottomBarTabItem.dart';
import 'bottombar/bottomNavigation.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  // this is static property so other widget throughout the app
  // can access it simply by AppState.currentTab
  static int currentTab = 0;

  // list tabs here
  final List<TabItem> tabs = [
    TabItem(
      icon: Icons.home,
      page: HomeScreen(),
    ),
    TabItem(
      icon: Icons.person_rounded,
      page: ProfileScreen(),
    ),
  ];
  final List<Class> classes = [
    Class(
      enrolKey: Uuid().v1(),
      subject: "DAA",
      batch: "2019-2023",
      section: "A",
      branch: "CSE"
    )
  ];

  final List<Teacher> teachers = [
    Teacher(
        uid:"GFu2fEtA3rg0yAAFg6xU7KAxUXG2",
        role:"teacher",
        email: "teacher@gmail.com",
        profileName:"teacher",
        profilePhotoUri:"",
    ),
  ];
  final List<Student> students = [
    Student(
        uid:"eyY6XSH3DiS3TyB5UUI1knftB552",
        role:"student",
        email: "student@gmail.com",
        profileName:"demo",
        rollno: "BT19CSE000",
        batch:"2019-2023",
        branch: "CSE",
        profilePhotoUri:"",
        section: "A",
        e_card: "https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FStudents%2FBT19CSE005%2FE-Card%2Fchota.PNG?alt=media&token=19d84d07-f707-48f9-9ccc-e9a768a9dfbd"
    ),
    Student(
        uid: "8YiaPL1FJQhKPZKmsb2LOMg4lhA3",
        role:"student",
        email: "bt19cse005@gmail.com",
        profileName: "AkashDeep",
        rollno: "BT19CSE005",
        batch: "2019-2023",
        branch: "CSE",
        profilePhotoUri: "",
        section: "A",
        e_card: "https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FStudents%2FBT19CSE005%2FE-Card%2Fchota.PNG?alt=media&token=19d84d07-f707-48f9-9ccc-e9a768a9dfbd"),
    Student(
        uid: "n2NUIinc9BYN1yPmiQVaK0jU9s43",
        role:"student",
        email: "bt19cse006@gmail.com",
        rollno: "BT19CSE006",
        batch: "2019-2023",
        profileName: "Harsh",
        profilePhotoUri: "",
        branch: "CSE",
        section: "A",
        e_card: "https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FStudents%2FBT19CSE005%2FE-Card%2Fchota.PNG?alt=media&token=19d84d07-f707-48f9-9ccc-e9a768a9dfbd"),
    Student(
        uid: "acgTOv8RQBTHeRz1V62ixqHPVWm1",
        role:"student",
        email: "bt19cse008@gmail.com",
        rollno: "BT19CSE008",
        profileName: "Tejas",
        batch: "2019-2023",
        profilePhotoUri: "",
        branch: "CSE",
        section: "A",
        e_card: "https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FStudents%2FBT19CSE005%2FE-Card%2Fchota.PNG?alt=media&token=19d84d07-f707-48f9-9ccc-e9a768a9dfbd"),
    Student(
        uid: "VvzJy3RJyBeUk4bxgnj9zsrC3vK2",
        role:"student",
        email: "bt19cse010@gmail.com",
        rollno: "BT19CSE010",
        batch: "2019-2023",
        profileName: "Vaibhav",
        profilePhotoUri: "",
        branch: "CSE",
        section: "A",
        e_card: "https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FStudents%2FBT19CSE005%2FE-Card%2Fchota.PNG?alt=media&token=19d84d07-f707-48f9-9ccc-e9a768a9dfbd"),
    Student(
        uid: "2rdhkdsCTDRUQinE3nXzLAn7Sxh2",
        role:"student",
        email: "bt19cse023@gmail.com",
        batch: "2019-2023",
        rollno: "BT19CSE023",
        profileName: "Sonam",
        profilePhotoUri: "",
        branch: "CSE",
        section: "A",
        e_card: "https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FStudents%2FBT19CSE005%2FE-Card%2Fchota.PNG?alt=media&token=19d84d07-f707-48f9-9ccc-e9a768a9dfbd")
  ];
  final List<Assignment> assignment = [
    Assignment(
      subject: "Data Structure",
      title: "Merge Sort",
      submissionDate: "28 May 2021",
      uploadDate: "21 May 2021",
      uri:"https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FSection%2FA%2FSubjects%2FData%20Structure%2FAssignment%2FSE%20Models.docx?alt=media&token=bca62fa3-f92b-408e-b048-c712c4b466e8"
    ),
    Assignment(
      subject: "Operating System",
      title: "Scheduling",
      submissionDate: "20 May 2021",
      uploadDate: "5 May 2021",
      uri:"https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FSection%2FA%2FSubjects%2FData%20Structure%2FAssignment%2FSE%20Models.docx?alt=media&token=bca62fa3-f92b-408e-b048-c712c4b466e8"
    ),
    Assignment(
      subject: "Digital Electronics",
      title: "K-map",
      submissionDate: "16 May 2021",
      uploadDate: "1 May 2021",
        uri:"https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FSection%2FA%2FSubjects%2FData%20Structure%2FAssignment%2FSE%20Models.docx?alt=media&token=bca62fa3-f92b-408e-b048-c712c4b466e8"
    ),
  ];
  final List<Result> result = [
    Result(
        subject: "Data Structure",
        marks: "12",
        uploadDate: "21 May 2021",
        uri:"https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FSection%2FA%2FSubjects%2FData%20Structure%2FResult%2Ftodo.py?alt=media&token=548e9798-e1e1-4495-aa56-ad0f4127af56"
    ),
    Result(
        subject: "Operating System",
        marks: "12",
        uploadDate: "5 May 2021",
        uri:"https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FSection%2FA%2FSubjects%2FData%20Structure%2FResult%2Ftodo.py?alt=media&token=548e9798-e1e1-4495-aa56-ad0f4127af56"
    ),
    Result(
        subject: "Digital Electronics",
        marks: "12",
        uploadDate: "1 May 2021",
        uri:"https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FSection%2FA%2FSubjects%2FData%20Structure%2FResult%2Ftodo.py?alt=media&token=548e9798-e1e1-4495-aa56-ad0f4127af56"
    ),
  ];
  @override
  void initState() {
    super.initState();
    //enrolStudentInClass("7602fc20-c76a-11eb-b1ac-997b4bdee393");
    // for(var i =0;i<classes.length;i++){
    //   createClass(classes[i]);
    // }
    // for(var i =0;i<teachers.length;i++){
    //   saveTeacherToDatabase(teachers[i]);
    // }
    // for(var i =0;i<students.length;i++){
    //   saveStudentToDatabase(students[i]);
    // }
    // for (var i = 0; i < assignment.length; i++) {
    //   addAssignmentToDatabase("7602fc20-c76a-11eb-b1ac-997b4bdee393",assignment[i]);
    // }
    // for (var i = 0; i < result.length; i++) {
    //   addResultToDatabase("7602fc20-c76a-11eb-b1ac-997b4bdee393",result[i]);
    // }
    //addTimeTableToDatabase("https://firebasestorage.googleapis.com/v0/b/our-e-college-app-909e3.appspot.com/o/Batch%2F2019-2023%2FBranch%2FCSE%2FSection%2FA%2FTimetable%2FCSE-A.json?alt=media&token=50d1a49e-0665-461f-9926-8d6c44ea3756");
    ContextKeeper().init(context);
    currentTab = 0;
  }

  AppState() {
    // indexing is necessary for proper funcationality
    // of determining which tab is active
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }
  Future<void> addTimeTableToDatabase(String uri) async {
    CollectionReference studentCollection = FirebaseFirestore.instance
        .collection('Batch')
        .doc("2019-2023")
        .collection('Branch')
        .doc("CSE")
        .collection('Section');
    await studentCollection
        .doc("A")
        .set({"timetable": uri})
        .then((value) => print("Student Added"))
        .catchError((error) => print("Failed to add student: $error"));
    ;
  }
  Future<void> fetchStudentList(String uid) async {

    return await FirebaseFirestore.instance
        .collection('Classes')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        print("student data ${documentSnapshot.data()}");
        return Student(
          uid:documentSnapshot["uid"],
          email:documentSnapshot["email"],
          batch:documentSnapshot["batch"],
          rollno:documentSnapshot["rollno"],
          branch:documentSnapshot["branch"],
          role:documentSnapshot["role"],
          section:documentSnapshot["section"],
          profileName:documentSnapshot["profileName"],
          profilePhotoUri:documentSnapshot["profilePhotoUri"],
          e_card:documentSnapshot["e_card"],
        );
      } else {
        print('Document does not exist on the user database');
      }
    });
  }
  Future<void> fetchStudent(String uid) async {

    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        print("student data ${documentSnapshot.data()}");
        return Student(
            uid:documentSnapshot["uid"],
            email:documentSnapshot["email"],
            batch:documentSnapshot["batch"],
            rollno:documentSnapshot["rollno"],
            branch:documentSnapshot["branch"],
            role:documentSnapshot["role"],
            section:documentSnapshot["section"],
            profileName:documentSnapshot["profileName"],
            profilePhotoUri:documentSnapshot["profilePhotoUri"],
            e_card:documentSnapshot["e_card"],
        );
      } else {
        print('Document does not exist on the user database');
      }
    });
  }

  Future<void> addAssignmentToDatabase(String classUid,Assignment assignment) async {
    var uuid = Uuid().v1();
    await FirebaseFirestore.instance
        .collection('Classes')
        .doc(classUid)
        .collection('Assignments')
        .doc(uuid)
        .set({
          "subject": assignment.subject,
          "title": assignment.title,
          "submissionDate": assignment.submissionDate,
          "uploadDate": assignment.uploadDate,
          "uri":assignment.uri
        })
        .then((value) => print("Assignment Added"))
        .catchError((error) => print("Failed to add student: $error"));
    ;
  }
  Future<void> addResultToDatabase(String classUid,Result result) async {
    var uuid = Uuid().v1();
    await FirebaseFirestore.instance
        .collection('Classes')
        .doc(classUid)
        .collection('Results')
        .doc(uuid)
        .set({
      "subject": result.subject,
      "marks": result.marks,
      "uploadDate": result.uploadDate,
      "uri":result.uri
    })
        .then((value) => print("Result Added"))
        .catchError((error) => print("Failed to add student: $error"));
    ;
  }
  Future<void> saveTeacherToDatabase(Teacher teacher) async {
    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('Users');
    await usersCollection
        .doc(teacher.uid)
        .set({
      "uid": teacher.uid,
      "role": teacher.role,
      "email": teacher.email,
      "profileName": teacher.profileName,
      "profilePhotoUri": teacher.profilePhotoUri,
    })
        .then((value) => print("Teacher Added"))
        .catchError((error) => print("Failed to add teacher: $error"));
    ;
  }
  Future<void> saveStudentToDatabase(Student student) async {
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('Users');
    await usersCollection
        .doc(student.uid)
        .set({
          "uid": student.uid,
          "role": student.role,
          "branch": student.branch,
          "batch": student.batch,
          "email": student.email,
          "rollno": student.rollno,
          "section": student.section,
          "profileName": student.profileName,
          "profilePhotoUri": student.profilePhotoUri,
          "e_card": student.e_card
        })
        .then((value) => print("Student Added"))
        .catchError((error) => print("Failed to add student: $error"));
    ;
  }
  Future<void> createClass(Class clas) async {
    var uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference classesCollection =
    FirebaseFirestore.instance.collection('Classes');
    await classesCollection
        .doc(clas.enrolKey)
        .set({
      "enrolKey": clas.enrolKey,
      "branch":clas.branch,
      "section":clas.section,
      "subject":clas.subject,
      "batch":clas.batch,
      "createdBy":uid
    })
        .then((value) async {
          print("Class Created");
        })
        .catchError((error) => print("Failed to create class: $error"));
  }
  Future<void> enrolStudentInClass(String enrolKey) async {
    var uid = FirebaseAuth.instance.currentUser.uid;
    CollectionReference classesCollection =
    FirebaseFirestore.instance.collection('Classes');
    await classesCollection
        .doc(enrolKey)
        .update({
            "enrollStudents": FieldValue.arrayUnion([uid])
        })
        .then((value) async {
          print("$uid enrolled successfully");
          })
        .catchError((error) => print("Failed to enroll in  class: $error"));

  }

  // sets current tab index
  // and update state
  void _selectTab(int index) {
    if (index == currentTab) {
      // pop to first route
      // if the user taps on the active tab
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      // update the state
      // in order to repaint
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope handle android back btn
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      // this is the base scaffold
      // don't put appbar in here otherwise you might end up
      // with multiple appbars on one screen
      // eventually breaking the app
      child: Scaffold(
        // indexed stack shows only one child
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        // Bottom navigation
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}

class ContextKeeper {
  static BuildContext buildContext;

  void init(BuildContext context) {
    buildContext = context;
  }
}

class Student {
  String uid;
  String email;
  String batch;
  String rollno;
  String branch;
  String role;
  String section;
  String profileName;
  String profilePhotoUri;
  String e_card;

  Student(
      {this.uid,
      this.email,
      this.batch,
      this.role,
      this.rollno,
      this.section,
      this.profileName,
      this.profilePhotoUri,
      this.branch,
      this.e_card});
}

class Teacher {
  String uid;
  String email;
  String role;
  String profileName;
  String profilePhotoUri;

  Teacher(
      {this.uid,
        this.email,
        this.role,
        this.profileName,
        this.profilePhotoUri,
      });
}

class Assignment {
  String subject;
  String title;
  // String submissionTime;
  String submissionDate;
  String uploadDate;
  String uri;

  Assignment({
    this.subject,
    this.title,
    // this.submissionTime,
    this.uploadDate,
    this.submissionDate,
    this.uri
  });
}

class Result {
  String subject;
  String marks;
  String uploadDate;
  String uri;

  Result({
    this.subject,
    this.marks,
    // this.submissionTime,
    this.uploadDate,
    this.uri
  });
}

class Class{
  String enrolKey;
  String branch;
  String subject;
  String batch;
  String section;

  Class({
    this.enrolKey,
    this.subject,
    this.batch,
    this.section,
    this.branch
});

}
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  
  getUserByUsername(String username)async{
   return await FirebaseFirestore.instance.collection("users")
    .where("name", isEqualTo: username)
    .get();
    
  }
  getUserByUserEmail(String userEmail)async{
   return await FirebaseFirestore.instance.collection("users")
    .where("email", isEqualTo: userEmail)
    .get();
    
  }
  uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection("users")
    .add(userMap);       //adding map to user collection
    
  }
  // createChatRoom(String chatRoomId,chatRoomMap){
  //   FirebaseFirestore.instance.collection("chatRoom")
  //   .doc(chatRoomId).set(chatRoomMap).catchError((e){
  //     print(e.toString());
  //   });

  // }

  // addConversationMessages(String chatRoomId, messageMap){
  //   FirebaseFirestore.instance.collection("chatRoom").
  //           doc(chatRoomId).collection("chats")
  //           .add(messageMap).catchError((e){print(e.tostring());});
  
  // }
  getConversationMessages(String chatRoomId,) async{
    return await FirebaseFirestore.instance.collection("chatRoom").
            doc(chatRoomId).collection("chats")
            .orderBy("time",descending: false)
            .snapshots();
  
  }
  getChatRooms(String userName)async{
   return await FirebaseFirestore.instance.collection("chatRoom")
    .where("users",arrayContains: userName).snapshots(); //instead of snapshots we may also write getdocuments
  }
}
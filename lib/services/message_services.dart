part of 'services.dart';

class MessageServices {
  static CollectionReference _messagesCollection =
      FirebaseFirestore.instance.collection("messages");

  static Stream<QuerySnapshot> getMessageByGroupChatId({String groupChatId}) {
    int _limit = 20;

    return _messagesCollection
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy('timestamp', descending: true)
        .limit(_limit)
        .snapshots();
  }
}

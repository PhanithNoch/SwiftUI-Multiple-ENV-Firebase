//
//  UserViewModel.swift
//  SwiftUIFirebaseEnv
//
//  Created by Admin on 4/8/21.
//

import SwiftUI
import Firebase
class UserViewModel:ObservableObject {
  @Published  var user:User?
    init() {
        fetchUser()
    }
    func fetchUser()  {
        Firestore.firestore().collection("user_test").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
}

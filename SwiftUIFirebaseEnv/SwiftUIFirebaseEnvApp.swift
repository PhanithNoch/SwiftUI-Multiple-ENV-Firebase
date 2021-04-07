//
//  SwiftUIFirebaseEnvApp.swift
//  SwiftUIFirebaseEnv
//
//  Created by Admin on 4/7/21.
//

import SwiftUI
import Firebase

@main
struct SwiftUIFirebaseEnvApp: App {
    init() {
        #if LOCAL || DEV || QA
        print("Local")
        setupFirebaseConfigFiles(fileName: "GoogleService-Info-dev")
//        setupFirebaseConfigFiles(fileName: "GoogleService-Info")
        #elseif DEV
        print("DEV")
        
        #elseif QA
        print("DEV")
        
        #elseif PROD
        print("PROD")
        setupFirebaseConfigFiles(fileName: "GoogleService-Info")
        #endif
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func setupFirebaseConfigFiles(fileName:String) {
        let filePath = Bundle.main.path(forResource: fileName, ofType: "plist")!
        
        guard let fileopts  = FirebaseOptions(contentsOfFile: filePath) else {
            print("DEBUG: could't load firebase file")
            return
        }
        FirebaseApp.configure(options: fileopts)
        
        
    }
}

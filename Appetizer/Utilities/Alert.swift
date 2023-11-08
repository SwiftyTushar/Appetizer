//
//  Alert.swift
//  Appetizer
//
//  Created by Tushar Patil on 07/11/23.
//

import Foundation
import SwiftUI


struct AlertItem{
    let id = UUID()
    let message:Text
    let title:Text
    let dismissButton:Alert.Button
}

struct AlertContext{
    let defaultError = AlertItem(message: Text("Message"), title: Text("Title"), dismissButton: .default(Text("Ok")))
}

//
//  RemoteLoader.swift
//  Appetizer
//
//  Created by Tushar Patil on 08/11/23.
//

import Foundation
import UIKit
import SwiftUI

final class RemoteLoader: ObservableObject{
    @Published var image:Image?
    
    func load(url:String){
        NetworkManager.shared.downloadImage(urlString: url) { uiImage in
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage!)
            }
        }
    }
}

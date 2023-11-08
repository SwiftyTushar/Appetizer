//
//  AppetizerRemoteImage.swift
//  Appetizer
//
//  Created by Tushar Patil on 08/11/23.
//

import SwiftUI

struct AppetizerRemoteImage: View {
    @StateObject var loader = RemoteLoader()
    var url = String()
    var body: some View {
        ZStack{
            loader.image != nil ? loader.image?.resizable() : Image("food-placeholder").resizable()
        }
        .onAppear{
            loader.load(url: url)
        }
    }
}

struct AppetizerRemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerRemoteImage()
    }
}

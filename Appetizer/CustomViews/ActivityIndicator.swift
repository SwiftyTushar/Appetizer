//
//  ActivityIndicator.swift
//  Appetizer
//
//  Created by Tushar Patil on 07/11/23.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .init(named: "brandPrimary")
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}
struct ProgressView: View{
    var body: some View{
        ActivityIndicator()
    }
}
struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}

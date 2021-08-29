//
//  ActivityIndicatorView.swift
//  Discovery
//
//  Created by user on 29.08.2021.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIVewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}

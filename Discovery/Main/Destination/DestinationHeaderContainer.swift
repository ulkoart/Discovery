//
//  DestinationHeaderContainer.swift
//  Discovery
//
//  Created by user on 31.08.2021.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red
        return redVC
    }

    typealias UIViewControllerType = UIViewController
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer()
    }
}

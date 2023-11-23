//
//  SwiftUIViewController.swift
//  CoreDataListProject
//
//  Created by Eunsu JEONG on 11/23/23.
//

import UIKit
import SwiftUI

class SwiftUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swiftUIController = UIHostingController(rootView: ContentView())
        swiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(swiftUIController)
        self.view.addSubview(swiftUIController.view)
        NSLayoutConstraint.activate([
            swiftUIController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swiftUIController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            swiftUIController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swiftUIController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

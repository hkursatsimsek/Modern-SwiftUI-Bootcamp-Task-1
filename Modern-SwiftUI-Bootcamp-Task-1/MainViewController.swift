//
//  MainViewController.swift
//  Modern-SwiftUI-Bootcamp-Task-1
//
//  Created by Kürşat Şimşek on 22.08.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        showPersonalInfoCard()
    }
    
    // MARK: - Methods
    private func showPersonalInfoCard() {
        let card = PersonalInfoCard(
            name: "Hamza Kürşat Şimşek",
            age: 33,
            height: 1.77,
            isStudent: false,
            phoneNumber: nil,
            linkedin: "https://www.linkedin.com/in/hkursatsimsek/",
            github: "https://github.com/hkursatsimsek/"
        )

        card.displayInfo()
    }
}

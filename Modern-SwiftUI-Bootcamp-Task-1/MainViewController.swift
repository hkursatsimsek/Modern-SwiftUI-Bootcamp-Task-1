//
//  MainViewController.swift
//  Modern-SwiftUI-Bootcamp-Task-1
//
//  Created by Kürşat Şimşek on 22.08.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: UI Elements
    private let calculatorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open Calculator", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityLabel = "Open Calculator"
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        // Closure örneğini çalıştırır
        print("🧩 Closure Example")
        ClosureFilterExamples.demo()
        
        print(" ---------------- ")
        
        
        print("🧩 PersonalInfoCard Example")
        // PersonalInfoCard örneğini çalıştırır
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
    
    @objc private func openCalculator() {
        let calcVC = CalculatorViewController()
        calcVC.modalPresentationStyle = .formSheet
        present(calcVC, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(calculatorButton)
        NSLayoutConstraint.activate([
            calculatorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculatorButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            calculatorButton.widthAnchor.constraint(equalToConstant: 200),
            calculatorButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        calculatorButton.addTarget(self, action: #selector(openCalculator), for: .touchUpInside)
    }
}

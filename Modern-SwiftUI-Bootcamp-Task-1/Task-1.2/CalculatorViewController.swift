//
//  CalculatorViewController.swift
//  Modern-SwiftUI-Bootcamp-Task-1
//
//  Created by Kürşat Şimşek on 22.08.2025.
//

import UIKit

class CalculatorViewController: UIViewController {

    // MARK: UI Elements
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.text = "0"
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityLabel = "Calculation Result"
        return label
    }()

    private let firstTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "First Number"
        tf.accessibilityLabel = "First Number"
        return tf
    }()

    private let secondTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Second Number"
        tf.accessibilityLabel = "Second Number"
        return tf
    }()

    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [plusButton, minusButton, multiplyButton, divideButton])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.accessibilityLabel = "Reset Calculator"
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let plusButton = CalculatorViewController.makeCalcButton(title: "+")
    private let minusButton = CalculatorViewController.makeCalcButton(title: "-")
    private let multiplyButton = CalculatorViewController.makeCalcButton(title: "×")
    private let divideButton = CalculatorViewController.makeCalcButton(title: "÷")
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupCalculatorUI()
        setupActions()
    }
    
    // MARK: - Methods
    private static func makeCalcButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.layer.cornerRadius = 8
        button.backgroundColor = .secondarySystemBackground
        button.accessibilityLabel = title
        return button
    }
    
    private func setupCalculatorUI() {
        let stack = UIStackView(arrangedSubviews: [firstTextField, secondTextField, buttonStack, resultLabel, resetButton])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        firstTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        secondTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 54).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private func setupActions() {
        plusButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(subtractTapped), for: .touchUpInside)
        multiplyButton.addTarget(self, action: #selector(multiplyTapped), for: .touchUpInside)
        divideButton.addTarget(self, action: #selector(divideTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
    }
    
    private func readInputs() -> (Double, Double)? {
        guard let aText = firstTextField.text, let bText = secondTextField.text, let a = Double(aText), let b = Double(bText) else {
            resultLabel.text = "Invalid input"
            return nil
        }
        return (a, b)
    }
    
    @objc private func addTapped() {
        guard let (a, b) = readInputs() else { return }
        let sum = a + b
        resultLabel.text = "\(sum)"
    }
    
    @objc private func subtractTapped() {
        guard let (a, b) = readInputs() else { return }
        let diff = a - b
        resultLabel.text = "\(diff)"
    }
    
    @objc private func multiplyTapped() {
        guard let (a, b) = readInputs() else { return }
        let product = a * b
        resultLabel.text = "\(product)"
    }
    
    @objc private func divideTapped() {
        guard let (a, b) = readInputs() else { return }
        guard b != 0 else {
            resultLabel.text = "Cannot divide by zero"
            return
        }
        let quotient = a / b
        resultLabel.text = "\(quotient)"
    }
    
    @objc private func resetTapped() {
        firstTextField.text = ""
        secondTextField.text = ""
        resultLabel.text = "0"
    }
}

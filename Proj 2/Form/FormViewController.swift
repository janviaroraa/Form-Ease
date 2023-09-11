//
//  FormViewController.swift
//  Form
//
//  Created by Janvi Arora on 10/09/23.
//

import UIKit

class FormViewController: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "FORM"
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        return lbl
    }()
    
    private lazy var descLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Start filling the form"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Start!", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        return btn
    }()
    
    private lazy var firstNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "First Name:"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Last Name:"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var ageLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Age:"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var genderLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Gender:"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var firstNameTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter first name"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.borderStyle = .roundedRect
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        txt.layer.cornerRadius = 8
        txt.delegate = self
        return txt
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter last name"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.borderStyle = .roundedRect
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        txt.layer.cornerRadius = 8
        txt.delegate = self
        return txt
    }()
    
    private lazy var ageTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter your age"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.borderStyle = .roundedRect
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.layer.borderWidth = 1
        txt.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        txt.layer.cornerRadius = 8
        txt.delegate = self
        return txt
    }()
    
    private lazy var genderField: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Male", "Female"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        seg.selectedSegmentIndex = 0
        return seg
    }()
    
    @objc private func startButtonClicked() {
        
        if startButton.titleLabel?.text == "Start!" {
            firstNameTextField.becomeFirstResponder()
        } else if startButton.titleLabel?.text == "Next!" {
            updateButton()
        } else {
            let vc = DetailViewcontroller()
            vc.enteredFirstName = firstNameTextField.text ?? ""
            vc.enteredLastName = lastNameTextField.text ?? ""
            vc.enteredAge = ageTextField.text ?? ""
            vc.enteredGender = genderField.titleForSegment(at: genderField.selectedSegmentIndex) ?? ""
            
            navigationController?.pushViewController(vc, animated: true)
            
            clearForm()
        }
    }
    
    private func checkEmptyFieldsBeforeSaving() -> Bool {
        return (
            firstNameTextField.text?.isEmpty ?? false ||
            lastNameTextField.text?.isEmpty ?? false ||
            ageTextField.text?.isEmpty ?? false
        )
    }
    
    private func clearForm() {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        ageTextField.text = ""
        genderField.selectedSegmentIndex = 0
        
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        
        startButton.setTitle("Start!", for: .normal)
    }
    
    private func updateButton() {
        let firstNameIsEmpty = firstNameTextField.text?.isEmpty ?? true
        let lastNameIsEmpty = lastNameTextField.text?.isEmpty ?? true
        let ageIsEmpty = ageTextField.text?.isEmpty ?? true
        
        if firstNameIsEmpty && lastNameIsEmpty && ageIsEmpty {
            startButton.setTitle("Start!", for: .normal)
            descLabel.text = "Start filling the form!"
        } else if firstNameIsEmpty || lastNameIsEmpty || ageIsEmpty {
            if firstNameIsEmpty {
                firstNameTextField.becomeFirstResponder()
            } else if lastNameIsEmpty {
                lastNameTextField.becomeFirstResponder()
            } else {
                ageTextField.becomeFirstResponder()
            }
            startButton.setTitle("Next!", for: .normal)
            descLabel.text = "Please fill all the fields before submitting"
        } else {
            startButton.setTitle("Submit!", for: .normal)
            descLabel.text = "Go ahead and submit the form!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.titleView = titleLabel
        addViews()
        addConstraints()
        updateButton()
    }
    
    private func addViews() {
        view.addSubview(descLabel)
        view.addSubview(firstNameLabel)
        view.addSubview(lastNameLabel)
        view.addSubview(ageLabel)
        view.addSubview(genderLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(ageTextField)
        view.addSubview(genderField)
        view.addSubview(startButton)
        
        firstNameTextField.tag = 1
        lastNameTextField.tag = 2
        ageTextField.tag = 3
    }
    
    private func addConstraints() {
        descLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40).isActive = true
        
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 20).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        firstNameLabel.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 40).isActive = true
        firstNameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        lastNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20).isActive = true
        lastNameLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        ageLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 20).isActive = true
        ageLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        genderLabel.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20).isActive = true
        genderLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        firstNameTextField.leadingAnchor.constraint(equalTo: firstNameLabel.trailingAnchor).isActive = true
        firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.topAnchor).isActive = true
        firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        lastNameTextField.leadingAnchor.constraint(equalTo: lastNameLabel.trailingAnchor).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.topAnchor).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        ageTextField.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor).isActive = true
        ageTextField.topAnchor.constraint(equalTo: ageLabel.topAnchor).isActive = true
        ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        genderField.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor).isActive = true
        genderField.topAnchor.constraint(equalTo: genderLabel.topAnchor).isActive = true
        genderField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        genderField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
}

extension FormViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        startButton.setTitle("Next!", for: .normal)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        updateButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let text = textField.text, text.isEmpty {
            textField.layer.borderColor = UIColor.systemRed.cgColor
            
            switch textField.tag {
            case 1:
                showAlert(message: "Please enter first name")
                if lastNameTextField.text?.isEmpty ?? true {
                    lastNameTextField.becomeFirstResponder()
                } else if ageTextField.text?.isEmpty ?? true {
                    ageTextField.becomeFirstResponder()
                } else {
                    firstNameTextField.becomeFirstResponder()
                }
            case 2:
                if ageTextField.text?.isEmpty ?? true {
                    ageTextField.becomeFirstResponder()
                }else if firstNameTextField.text?.isEmpty ?? true {
                    firstNameTextField.becomeFirstResponder()
                } else {
                    lastNameTextField.becomeFirstResponder()
                }
                showAlert(message: "Please enter last name")
            case 3:
                if firstNameTextField.text?.isEmpty ?? true {
                    firstNameTextField.becomeFirstResponder()
                } else if lastNameTextField.text?.isEmpty ?? true {
                    lastNameTextField.becomeFirstResponder()
                } else if ageTextField.text?.isEmpty ?? true {
                    ageTextField.becomeFirstResponder()
                } else {
                    startButton.setTitle("Start", for: .normal)
                }
                showAlert(message: "Please enter age")
            default:
                break
            }
        }
        
        updateButton()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text, text.isEmpty {
            switch textField.tag {
            case 3:
                let allowedCharacterSet = CharacterSet.decimalDigits
                for char in string.unicodeScalars {
                    if !allowedCharacterSet.contains(char) {
                        return false
                    }
                }
            default:
                break
            }
        }
        
        if let text = textField.text, !text.isEmpty {
            textField.layer.borderColor = UIColor.secondarySystemBackground.cgColor
            switch textField.tag {
            case 3:
                let allowedCharacterSet = CharacterSet.decimalDigits
                for char in string.unicodeScalars {
                    if !allowedCharacterSet.contains(char) {
                        return false
                    }
                }
                
                let currentText = textField.text ?? ""
                let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
                if updatedText.isEmpty || (0...150).contains(Int(updatedText) ?? -1) {
                    return true
                } else {
                    showAlert(message: "Age should be between 0 and 150")
                    return false
                }
            default:
                break
            }
        }
        return true
    }
    
    
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let action = UIAlertAction(title: "OK", style: .default)
            
            let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            alert.addAction(action)
            
            self.present(alert, animated: true)
        }
    }
}

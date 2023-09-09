//
//  FormViewController.swift
//  FormEaseWithAdarsh
//
//  Created by Janvi Arora on 08/09/23.
//

import UIKit

class FormViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Form Ease"
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        return lbl
    }()
    
    private lazy var descLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Please enter your details to submit the form"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var firstNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "First Name"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Last Name"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var ageLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Age"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var genderLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Gender"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18)
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
        txt.layer.borderColor = UIColor.lightGray.cgColor
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
        txt.layer.borderColor = UIColor.lightGray.cgColor
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
        txt.layer.borderColor = UIColor.lightGray.cgColor
        txt.layer.cornerRadius = 8
        txt.delegate = self
        return txt
    }()
    
    private lazy var genderField: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Male", "Female"])
        seg.translatesAutoresizingMaskIntoConstraints = false
        return seg
    }()
    
    private lazy var saveButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Save", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        return btn
    }()
    
    @objc private func saveButtonClicked() {
        navigationController?.pushViewController(DetailViewcontroller(), animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.titleView = titleLabel
        addViews()
        addConstraints()
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
        view.addSubview(saveButton)
    }
    
    private func addConstraints() {
        descLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50).isActive = true
        
        firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        firstNameLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 40).isActive = true
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
        firstNameTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        lastNameTextField.leadingAnchor.constraint(equalTo: lastNameLabel.trailingAnchor).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.topAnchor).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        ageTextField.leadingAnchor.constraint(equalTo: ageLabel.trailingAnchor).isActive = true
        ageTextField.topAnchor.constraint(equalTo: ageLabel.topAnchor).isActive = true
        ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        ageTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        genderField.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor).isActive = true
        genderField.topAnchor.constraint(equalTo: genderLabel.topAnchor).isActive = true
        genderField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        genderField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 90).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

extension FormViewController {
    private func formFieldLabels(text: String) {
        let lbl = UILabel()
        lbl.text = text
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
    }
}

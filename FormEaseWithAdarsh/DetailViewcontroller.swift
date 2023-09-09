//
//  DetailViewcontroller.swift
//  FormEaseWithAdarsh
//
//  Created by Janvi Arora on 09/09/23.
//

import UIKit

class DetailViewcontroller: UIViewController {
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Details"
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 28)
        return lbl
    }()
    
    private lazy var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var nameSpace: UILabel = {
        let lbl = UILabel()
        lbl.text = "Entered name"
        lbl.textColor = .systemGray
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 14)
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
    
    private lazy var ageSpace: UILabel = {
        let lbl = UILabel()
        lbl.text = "Entered age"
        lbl.textColor = .systemGray
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 14)
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
    
    private lazy var genderSpace: UILabel = {
        let lbl = UILabel()
        lbl.text = "Entered gender"
        lbl.textColor = .systemGray
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.titleView = titleLabel
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        view.addSubview(nameLabel)
        view.addSubview(nameSpace)
        view.addSubview(ageLabel)
        view.addSubview(ageSpace)
        view.addSubview(genderLabel)
        view.addSubview(genderSpace)
    }
    
    private func addConstraints() {
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20).isActive = true
        
        nameSpace.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        nameSpace.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        
        ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        ageLabel.topAnchor.constraint(equalTo: nameSpace.bottomAnchor, constant: 24).isActive = true
        
        ageSpace.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        ageSpace.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 5).isActive = true
        
        genderLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        genderLabel.topAnchor.constraint(equalTo: ageSpace.bottomAnchor, constant: 24).isActive = true
        
        genderSpace.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        genderSpace.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5).isActive = true
    }
    
}

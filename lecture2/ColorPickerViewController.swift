//
//  ColorPickerViewController.swift
//  lecture2
//
//  Created by Scott Walstead on 4/19/19.
//  Copyright © 2019 Scott Walstead. All rights reserved.
//

import UIKit

protocol SelectColorDelegate : class {
    func didSelectColor(color: UIColor)
}

class ColorPickerViewController: UIViewController {

    var pickRedButton : UIButton!
    var pickBlueButton: UIButton!
    weak var selectColorDelegate : SelectColorDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        pickRedButton = UIButton()
        pickRedButton.setTitle("Pick red", for: .normal)
        pickRedButton.setTitleColor(.red, for: .normal)
        pickRedButton.backgroundColor = .black
        pickRedButton.addTarget(self, action: #selector(didSelectRed), for: .touchUpInside)
        view.addSubview(pickRedButton)

        pickBlueButton = UIButton()
        pickBlueButton.setTitle("Pick blue", for: .normal)
        pickBlueButton.setTitleColor(.blue, for: .normal)
        pickBlueButton.backgroundColor = .black
        pickBlueButton.addTarget(self, action: #selector(didSelectBlue), for: .touchUpInside)
        view.addSubview(pickBlueButton)

        setConstraints()
    }


    func setConstraints() {
        pickRedButton.translatesAutoresizingMaskIntoConstraints = false
        pickBlueButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pickRedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickRedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pickBlueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pickBlueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pickRedButton.heightAnchor.constraint(equalToConstant: 30),
            pickBlueButton.heightAnchor.constraint(equalToConstant: 30),
            pickBlueButton.topAnchor.constraint(equalTo: pickRedButton.bottomAnchor, constant: 20),
            pickRedButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        ])
    }

    @objc func didSelectRed() {
        selectColorDelegate?.didSelectColor(color: .red)
        navigationController?.popViewController(animated: true)
    }

    @objc func didSelectBlue() {
        selectColorDelegate?.didSelectColor(color: .blue)
        navigationController?.popViewController(animated: true)
    }
}

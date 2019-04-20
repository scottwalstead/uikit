//
//  ViewController.swift
//  lecture2
//
//  Created by Scott Walstead on 4/19/19.
//  Copyright © 2019 Scott Walstead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var blahImage: UIImageView!
    var titleLabel: UILabel!
    var bioText: UITextView!
    var button: UIButton!
    var loadTableButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        blahImage = UIImageView()
        blahImage.translatesAutoresizingMaskIntoConstraints = false
        blahImage.image = UIImage(named: "blah")
        blahImage.clipsToBounds = true
        blahImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.addSubview(blahImage)

        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Well hello there kdfkjajfj kld kfjasdk sfjkjkaskjafjklafkjjklasdkfjsdfj fjsadf jkldfkjlfjakljljkf jklafjklj"
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)

        bioText = UITextView()
        bioText.translatesAutoresizingMaskIntoConstraints = false
        bioText.text = "hekkfjka jlkfka djkfajkfskjlafsjkkjfdjkfjfskjfkdjjkfjj j j j j jj j  j jfidijnfdnnjjkjk jj jf jkjdsjk fjjfiaimnd ciasfnairingioandingnasi hi ifiadsgnfaoinionewriong;ang; ainnirneinfnai   adf a fae t"
        bioText.textColor = .yellow
        bioText.font = UIFont.systemFont(ofSize: 30, weight: .light)
        bioText.textAlignment = .right
        bioText.backgroundColor = .black
        view.addSubview(bioText)

        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        button.titleLabel?.textAlignment = .right
        button.titleLabel?.text = "Change color"
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)

        loadTableButton = UIButton()
        loadTableButton.translatesAutoresizingMaskIntoConstraints = false
        loadTableButton.backgroundColor = .green
        loadTableButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        loadTableButton.titleLabel?.textAlignment = .center
        loadTableButton.titleLabel?.text = "Load table"
        loadTableButton.addTarget(self, action: #selector(loadTable), for: .touchUpInside)
        view.addSubview(loadTableButton)

        setupConstraints()
//        blahImage.


        // Do any additional setup after loading the view, typically from a nib.
    }


    func setupConstraints() {
        NSLayoutConstraint.activate([
            blahImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
                blahImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                blahImage.widthAnchor.constraint(equalToConstant: 50),
                blahImage.heightAnchor.constraint(equalToConstant: 50)
            ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: blahImage.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 5)
            ])


        NSLayoutConstraint.activate([
            bioText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            bioText.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bioText.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            bioText.widthAnchor.constraint(equalToConstant: 10)
            bioText.heightAnchor.constraint(equalToConstant: 50)
//            bioText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            ])

        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            button.centerXAnchor.constraint(equalTo: bioText.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 100)
            ])

        NSLayoutConstraint.activate([
            loadTableButton.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10),
            loadTableButton.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            loadTableButton.heightAnchor.constraint(equalToConstant: 30),
            loadTableButton.widthAnchor.constraint(equalToConstant: 100)
            ])
    }

    @objc func buttonTapped() {
        print("tapped button")

        let colorPickerViewController = ColorPickerViewController()
        colorPickerViewController.selectColorDelegate = self
        navigationController?.pushViewController(colorPickerViewController, animated: true)
//        if bioText.backgroundColor == .black {
//            bioText.backgroundColor = .blue
//        } else {
//            bioText.backgroundColor = .black
//        }
    }

    @objc func loadTable() {
        print("tapped button")

        let table = Table()
        navigationController?.pushViewController(table, animated: true)
        //        if bioText.backgroundColor == .black {
        //            bioText.backgroundColor = .blue
        //        } else {
        //            bioText.backgroundColor = .black
        //        }
    }
}

extension ViewController : SelectColorDelegate {
    func didSelectColor(color: UIColor) {
        bioText.backgroundColor = color
    }
}


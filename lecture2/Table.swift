//
//  Table.swift
//  lecture2
//
//  Created by Scott Walstead on 4/20/19.
//  Copyright © 2019 Scott Walstead. All rights reserved.
//

import UIKit

struct Food {
    public let name : String
    public let rating : Int
}

class TableCell : UITableViewCell {
    var name: UILabel!
    var rating: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        rating = UILabel()
        rating.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(name)
        contentView.addSubview(rating)


    }

    func configure(for food: Food) {
        name.text = food.name
        name.backgroundColor = .red
        name.numberOfLines = 1
        rating.text = String(food.rating)
        rating.numberOfLines = 1

        setupContraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupContraints() {
        NSLayoutConstraint.activate([
                name.heightAnchor.constraint(equalTo: contentView.heightAnchor),
                name.widthAnchor.constraint(equalToConstant: 100),
                name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//                name.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//                name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//                rating.widthAnchor.constraint(equalToConstant: 20),
                rating.heightAnchor.constraint(equalTo: contentView.heightAnchor),
                rating.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 20),
                rating.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
    }
}

class Table: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var table: UITableView!

    var foods = ["hotdog": 4, "pizza": 3, "hamburger": 5, "jello": 4]
    var foodsArray = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        table = UITableView(frame: view.bounds)
        table.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(TableCell.self, forCellReuseIdentifier: "tableCellId")

        for (name, number) in foods {
            foodsArray.append(Food(name: name, rating: number))
        }

//        setupConstraints()

        view.addSubview(table)

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("test")
        let cell = table.dequeueReusableCell(withIdentifier: "tableCellId", for: indexPath) as! TableCell

        let food = foodsArray[indexPath.row]
        cell.configure(for: food)

        cell.needsUpdateConstraints()
        cell.selectionStyle = .none

        return cell
//        return TableCell(style: ., reuseIdentifier: <#T##String?#>)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

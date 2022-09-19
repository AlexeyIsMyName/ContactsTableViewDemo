//
//  ViewController.swift
//  ContactsTableViewDemo
//
//  Created by ALEKSEY SUSLOV on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var contacts = [ContactProtocol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadContacts()
    }

    private func loadContacts() {
        contacts.append(
            Contact(title: "Саня Техосмотр", phone: "+799912312323")
        )
        contacts.append(
            Contact(title: "Владимир Анатольевич", phone: "+781213342321")
        )
        contacts.append(
            Contact(title: "Сильвестр", phone: "+7000911112")
        )
        
        contacts.sort{ $0.title < $1.title }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("Используем старую ячейку для строки с индексом \(indexPath.row)")
            cell = reuseCell
        } else {
            print("Создаем новую ячейку для строки с индексом \(indexPath.row)")
            cell =  UITableViewCell(style: .default,
                                    reuseIdentifier: "MyCell")
        }

        configure(cell: &cell, for: indexPath)
        return cell
    }
    
    private func configure(cell: inout UITableViewCell,
                           for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Строка \(indexPath.row)"
        cell.contentConfiguration = configuration
    }
}

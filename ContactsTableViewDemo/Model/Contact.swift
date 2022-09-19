//
//  Contact.swift
//  ContactsTableViewDemo
//
//  Created by ALEKSEY SUSLOV on 19.09.2022.
//

protocol ContactProtocol {
    /// Имя
    var title: String { get set }
    /// Номер телефона
    var phone: String { get set }
}

struct Contact: ContactProtocol {
    var title: String
    var phone: String
}


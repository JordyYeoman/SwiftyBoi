//
//  EventTask.swift
//  AboutMeApp
//
//  Created by Jordy Yeoman on 29/11/2024.
//

import Foundation


struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

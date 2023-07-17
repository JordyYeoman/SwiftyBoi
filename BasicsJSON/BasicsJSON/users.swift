//
//  users.swift
//  BasicsJSON
//
//  Created by Jordy Yeoman on 17/7/2023.
//

import Foundation

struct User: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case designation
        case email
    }
    
    var id = UUID()
    var name: String
    var designation: String
    var email: String
}

class ReadData: ObservableObject  {
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "testData", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
        
    }
}

//
//  ListViewModel.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/30.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var dailys = [Daily]()
    @Published var nameSort = SortBy.nameASC
    @Published var ratingSort = SortBy.ratingASC
    init() {
        dailys = loadJsonFile()
        
    }
    
    private func loadJsonFile() -> [Daily]{
        var dbData = [Daily]()
        
        do {
            if let filePath  = Bundle.main.url(forResource: "DBdata", withExtension: "json") {
                
                let jsonData = try Data(contentsOf: filePath)
                let decodedData = try JSONDecoder().decode([Daily].self, from: jsonData)
                dbData = decodedData
            } else {
                return [Daily]()
            }
        } catch let error {
            print("[System] Error while fetching: \(error)")
        }
        return dbData
    }
    func sortList(by sortType: SortBy) {
           switch sortType {
           case .nameASC: // name ascending
               dailys.sort {
                   $0.name.lowercased() < $1.name.lowercased()
               }
           case .nameDESC: // name descending
               dailys.sort {
                   $0.name.lowercased() > $1.name.lowercased()
               }
           case .ratingASC:  // rating ascending
               dailys.sort {
                   $0.money < $1.money
               }
           case .ratingDESC: // rating descending
               dailys.sort {
                   $0.money > $1.money
               }
           }
       }

       // For convinience. Sort type.
       enum SortBy: String {
           case nameASC = "Name △"
           case nameDESC = "Name ▽"
           case ratingASC = "Money △"
           case ratingDESC = "Money ▽"
       }
}

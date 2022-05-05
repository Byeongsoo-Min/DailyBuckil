//
//  PurchaseListViewModel.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/05.
//

import Foundation

class PurchaseListViewModel: ObservableObject {
    @Published var purchase = [Purchase]()
    @Published var nameSort = SortBy.nameASC
    @Published var ratingSort = SortBy.ratingASC
    init() {
        purchase = loadJsonFile()
        
    }
    
    private func loadJsonFile() -> [Purchase]{
        var dbData = [Purchase]()
        
        do {
            if let filePath  = Bundle.main.url(forResource: "PurchaseData", withExtension: "json") {
                
                let jsonData = try Data(contentsOf: filePath)
                let decodedData = try JSONDecoder().decode([Purchase].self, from: jsonData)
                dbData = decodedData
            } else {
                return [Purchase]()
            }
        } catch let error {
            print("[System] Error while fetching: \(error)")
        }
        return dbData
    }
    func sortList(by sortType: SortBy) {
           switch sortType {
           case .nameASC: // name ascending
               purchase.sort {
                   $0.name.lowercased() < $1.name.lowercased()
               }
           case .nameDESC: // name descending
               purchase.sort {
                   $0.name.lowercased() > $1.name.lowercased()
               }
           case .ratingASC:  // rating ascending
               purchase.sort {
                   $0.money < $1.money
               }
           case .ratingDESC: // rating descending
               purchase.sort {
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

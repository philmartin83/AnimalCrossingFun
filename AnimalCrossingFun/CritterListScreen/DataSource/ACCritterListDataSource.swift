//
//  ACCritterListDataSource.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation
import UIKit


class ACCritterListDataSource: NSObject, UITableViewDataSource {
    
    var critterResponse: [CritterResponseModel]?
    
    func setData(critterModel: [CritterResponseModel]) {
        self.critterResponse = critterModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return critterResponse?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell() // future dev work
    }
    
    
}

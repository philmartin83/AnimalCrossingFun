//
//  ACCritterListViewModel.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 18/05/2022.
//

import Foundation

protocol ACCritterListViewModelOutput: AnyObject {
    func contentRecieved(model: [CritterResponseModel])
    func requestFailed(error: String)
}

protocol ACCritterServiceable {
    func getAllCritters(critterType: ACCritterType) async -> Result<[CritterResponseModel], RequestError>
}

class ACCritterListViewModel: HTTPClient, ACCritterServiceable {
    
    // MARK: - Properties
    weak var output: ACCritterListViewModelOutput?
    
    // MARK: - Helpers
    func fetch(critterType: ACCritterType) {
        Task {
           let result = await getAllCritters(critterType: critterType)
            switch result {
            case .success(let model):
                output?.contentRecieved(model: model)
            case .failure(let error):
                output?.requestFailed(error: error.localizedDescription)
            }
        }
    }
    
    // MARK: Private Helpers
    internal func getAllCritters(critterType: ACCritterType) async -> Result<[CritterResponseModel], RequestError> {
        return await sendRequest(endpoint: ACCritterEndPoint.critterType(type: critterType.critterURL), responseModel: [CritterResponseModel].self)
    }
    
}

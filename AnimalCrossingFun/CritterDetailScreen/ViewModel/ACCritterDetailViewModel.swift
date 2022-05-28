//
//  ACCritterDetailViewModel.swift
//  AnimalCrossingFun
//
//  Created by Philip Martin on 28/05/2022.
//

import Foundation

protocol ACCritterDetailViewModelOutput: AnyObject {
    func contentRecieved(model: CritterResponseModel)
    func requestFailed(error: String)
}

protocol ACCritterDetailServiceable {
    func getCritterById(critterType: String, id: Int) async -> Result<CritterResponseModel, RequestError>
}

class ACCritterDetailViewModel: HTTPClient, ACCritterDetailServiceable {
    
    var output: ACCritterDetailViewModelOutput?
    
    func fetchDetailAboutCritter(type: String, id: Int) {
        Task {
            let result = await getCritterById(critterType: type, id: id)
            switch result {
            case .success(let model):
                output?.contentRecieved(model: model)
            case .failure(let error):
                output?.requestFailed(error: error.localizedDescription)
            }
        }
    }
    
    // MARK: - Internal Helper
    internal func getCritterById(critterType: String, id: Int) async -> Result<CritterResponseModel, RequestError> {
        return await sendRequest(endpoint: ACCritterByIdEndPoint.critterById(type: critterType, id: id), responseModel: CritterResponseModel.self)
    }
}

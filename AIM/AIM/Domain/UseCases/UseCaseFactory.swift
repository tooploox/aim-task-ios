//
//  UseCaseFactory.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

protocol UseCaseProducing: class {
    func getOnAirInfoUseCase(completion: @escaping OnAirInfoCompletion) -> GetOnAirInfoUseCase
}

class UseCaseFactory: UseCaseProducing {
    
    let onAirInfoGateway: OnAirInfoGateway
    
    init(onAirInfoGateway: OnAirInfoGateway) {
        self.onAirInfoGateway = onAirInfoGateway
    }
    
    func getOnAirInfoUseCase(completion: @escaping OnAirInfoCompletion) -> GetOnAirInfoUseCase {
        return GetOnAirInfoUseCase(gateway: onAirInfoGateway, completion: completion)
    }
}

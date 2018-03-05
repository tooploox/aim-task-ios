//
//  GetOnAirInfoUseCase.swift
//  AIM
//
//  Created by Oskar Szydlowski on 02.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

class GetOnAirInfoUseCase {
    
    private let gateway: OnAirInfoGateway
    private let completion: OnAirInfoCompletion
    
    init(gateway: OnAirInfoGateway, completion: @escaping OnAirInfoCompletion) {
        self.gateway = gateway
        self.completion = completion
    }
    
    func execute() {
        gateway.fetchOnAirInfo(completion: completion)
    }
}

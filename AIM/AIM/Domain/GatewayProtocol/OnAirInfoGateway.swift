//
//  OnAirInfoGateway.swift
//  AIM
//
//  Created by Oskar Szydlowski on 05.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

protocol OnAirInfoGateway {
    func fetchOnAirInfo(completion: @escaping OnAirInfoCompletion)
}

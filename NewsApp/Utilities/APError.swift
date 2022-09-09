//
//  ApError.swift
//  NewsApp
//
//  Created by Skyio Team on 02/09/22.
//

import Foundation

enum APError: Error{
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}

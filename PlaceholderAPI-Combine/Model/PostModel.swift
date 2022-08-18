//
//  PostModel.swift
//  PlaceholderAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import Foundation

struct PostModel:Identifiable,Codable {
    let userId:Int
    let id:Int
    let title:String
    let body:String
}

//
//  Models.swift
//  Assignment8
//
//  Модели данных для всех категорий
//

import UIKit

// MARK: - Movie Model
struct Movie {
    let title: String
    let imageName: String
    let description: String
    let review: String
}

// MARK: - Music Model
struct Music {
    let title: String
    let artist: String
    let imageName: String
    let description: String
    let review: String
    
    var fullTitle: String {
        return "\(title) - \(artist)"
    }
}

// MARK: - Book Model
struct Book {
    let title: String
    let author: String
    let imageName: String
    let description: String
    let review: String
    
    var fullTitle: String {
        return "\(title) by \(author)"
    }
}

// MARK: - Course Model
struct Course {
    let title: String
    let instructor: String
    let imageName: String
    let description: String
    let review: String
    
    var fullTitle: String {
        return "\(title) - \(instructor)"
    }
}

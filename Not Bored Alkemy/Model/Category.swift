//
//  Category.swift
//  Not Bored Alkemy
//
//  Created by Mariano Julian Allisio on 07/06/2022.
//

import Foundation

enum Category: String, CaseIterable {
    case education = "Education"
    case recreational = "Recreational"
    case social = "Social"
    case diy = "Diy"
    case charity = "Charity"
    case cooking = "Cooking"
    case relaxation = "Relaxation"
    case music = "Music"
    case busywork = "Busywork"
}

enum PriceRange: String {
    case free = "Free"
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

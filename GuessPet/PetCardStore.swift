//
//  PetCardStore.swift
//  GuessPet
//
//  Created by HuangYiFeng on 11/2/16.
//  Copyright © 2016 cybozu. All rights reserved.
//

import UIKit

class PetCardStore : NSObject{

    static func defaultPets() -> [PetCard]
    {
        let filePath = Bundle.main.path(forResource: "Pets", ofType: "plist")!
        let dictionary = NSDictionary(contentsOfFile: filePath)!
        let petData = dictionary["Pets"] as! [[String: String]]
        
        let pets = petData.map { dict -> PetCard in
            return PetCard(
                name: dict["name"]!,
                description: dict["description"]!,
                image: UIImage(named: dict["image"]!)!
            )
        }
        return pets
    }
}

//
//  RevealViewController.swift
//  GuessPet
//
//  Created by HuangYiFeng on 11/2/16.
//  Copyright © 2016 cybozu. All rights reserved.
//

import UIKit

class RevealViewController: UIViewController {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    public var petCard: PetCard?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.petCard?.name
        self.imageView.image = self.petCard?.image
    }
    
    @IBAction private func dismissPressed(_ sender: UIButton) -> Void{
        self.dismiss(animated: true, completion: nil)
    }
}

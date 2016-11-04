//
//  CardViewController.swift
//  GuessPet
//
//  Created by HuangYiFeng on 11/2/16.
//  Copyright © 2016 cybozu. All rights reserved.
//

import UIKit

private let revealSegueId = "realSegue"

class CardViewController: UIViewController {
    
    @IBOutlet private weak var cardView : UIView!
    @IBOutlet private weak var titleLabel : UILabel!

    public var pageIndex : Int!
    public var petCard: PetCard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.petCard.name
        
        self.cardView.layer.cornerRadius = 25
        self.cardView.layer.masksToBounds = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.cardView.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == revealSegueId , let destinationController = segue.destination as? RevealViewController {
            destinationController.petCard = self.petCard
        }
    }

    func handleTap(_ tapGesture: UITapGestureRecognizer) -> Void {
        self.performSegue(withIdentifier: revealSegueId, sender: nil)
    }
}

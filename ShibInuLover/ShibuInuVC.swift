//
//  ShibuInuVC.swift
//  ShibInuLover
//
//  Created by Ryan Matsuo on 8/13/21.
//

import UIKit

class ShibuInuVC: UIViewController {

    @IBOutlet weak var shibuInuImage: SLImageView!
    let endpoint = "https://shibe.online/api/shibes"
    var shibuArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.getShibuArray(from: endpoint) { inuArray in
            guard let inuArray = inuArray else { return }
            let inuImage = inuArray[0]
            
            self.shibuInuImage.downloadImage(from: inuImage)
        }
    }
}

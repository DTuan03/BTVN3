//
//  ImageViewController.swift
//  Buoi3
//
//  Created by Tuấn on 7/8/24.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var systemImageView: UIImageView!
    @IBOutlet weak var projectImageView: UIImageView!
    
    let systemNameImages: [String] = ["house.fill", "house.circle", "house.circle.fill"]
    let projectNameImages: [String] = ["cat1", "cat2", "cat3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        systemImageView.contentMode = .scaleAspectFit
        projectImageView.contentMode = .scaleAspectFit
    }
    
    @IBAction func onRandomImage(_ sender: Any) {
        
        let randomSystemName = systemNameImages.randomElement()
        let randomProjectName = projectNameImages.randomElement()
        
        systemImageView.image = UIImage(systemName: randomSystemName ?? "heart.fill")
        projectImageView.image = UIImage(named: randomProjectName ?? "photo1")
    }
}

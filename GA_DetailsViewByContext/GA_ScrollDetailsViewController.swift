//
//  GA_ScrollDetailsViewController.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_ScrollDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = GA_DetailsView(frame: self.view.bounds)
        self.view.addSubview(imageView)
    }

}

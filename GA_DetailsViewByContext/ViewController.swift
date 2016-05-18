//
//  ViewController.swift
//  GA_DetailsViewByContext
//
//  Created by houjianan on 16/5/17.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "GA_DressCell", bundle: nil), forCellReuseIdentifier: "GA_DressCell")
        tableView.estimatedRowHeight = 100
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "GA_LineHeightViewController"
        case 1:
            cell.textLabel?.text = "GA_ScrollDetailsViewController"
        default:
            break
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let s = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
            let toVC = s.instantiateViewControllerWithIdentifier("GA_LineHeightViewController") as! GA_LineHeightViewController
            self.navigationController?.pushViewController(toVC, animated: true)
        case 1:
            let s = UIStoryboard(name: "Main", bundle: nil)
            let toVC = s.instantiateViewControllerWithIdentifier("GA_ScrollDetailsViewController") as! GA_ScrollDetailsViewController
            self.navigationController?.pushViewController(toVC, animated: true)
        default:
            break
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
}

//
//  SectionsViewController.swift
//  CoreDataSampleApp
//
//  Created by Apple-1 on 15/12/17.
//  Copyright © 2017 Apple-1. All rights reserved.
//

import UIKit

class SectionsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblSections: UITableView!
    
    let sections = ["pizza", "deep dish pizza", "calzone"]
    let items = [["Margarita", "BBQ Chicken", "Pepperoni"], ["sausage", "meat lovers", "veggie lovers"], ["sausage", "chicken pesto", "prawns", "mushrooms"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblSections?.delegate = self
        self.tblSections?.dataSource = self
        //https://jsonplaceholder.typicode.com/posts/1/comments#TZHBTsMwDIbP5SlMhdRWjIQhDmjLKiHgwoFOggvHLEnXVG1aEldQTXt3mnQTnGI7v7/Yf9jlc/H08bl9gQrbJr9g8xGxSnE5nRFrFXIQFbdO4SYesLx5iMOFw7FRPop2nRzh4KOo5XavzQpu1z49eh09Cxk9QZlvmBnC6h7BWbGJK8TerSgV0tSOiKYbZNlwq4joWspr/kMbvXO0/hqUHekdWZLlKSGtNqR2cT69FYD/2Dn4QSiFRyGUc4CVgtf34g26Xa0EwrfGCmJfKUIh9vKrVHZiaJXBjNhp5jEtByNQdybN4BCIkybxayQZ8ZalCeutyhO4DnTi0Gqz1+WY/qEXMBipSm2UXMB9NkkTRkNXtg7MY7aeDTsvwejs1OSc/5Zf
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblSections.dequeueReusableCell(withIdentifier: "sections")
        cell?.textLabel?.text = self.items[indexPath.section][indexPath.row]
        return cell!
    }
  
}

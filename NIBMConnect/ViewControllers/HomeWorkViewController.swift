//
//  HomeWorkViewController.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit

class HomeWorkViewController: UIViewController {
    
    @IBOutlet weak var homeWorkTVC: UITableView!
    
    var homeWorkArray:[HomeWork] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        retriveUserDefaults()
        homeWorkTVC.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.homeWorkTVC.delegate = self
        self.homeWorkTVC.dataSource = self
    }
    
    
    func retriveUserDefaults(){
        if let arrayDetails = HomeWork.getHomeWork(){
            homeWorkArray = arrayDetails
        }
    }
    
    @IBAction func dismissTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
extension HomeWorkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return homeWorkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HomeWorkCell = tableView.dequeueReusableCell(withIdentifier: "homeworkcell", for: indexPath) as! HomeWorkCell
        
        let homeWork = homeWorkArray[indexPath.row]
        
        cell.setupLayout(title: homeWork.title, des: homeWork.des)
        
        return cell
    }
    
    
    
}

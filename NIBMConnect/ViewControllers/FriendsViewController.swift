//
//  FriendsViewController.swift
//  NIBMConnect
//
//  Created by Darshani Karunarathne on 5/18/19.
//  Copyright © 2019 Darshani Karunarathne. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FriendsViewController: UIViewController {
    
    var ref: DatabaseReference!
    var friendList:[Friend] = []
    var Student:Friend? = nil
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var friendsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadingView.alpha = 1
        self.view.bringSubviewToFront(self.loadingView)
        
        ref = Database.database().reference()
        self.friendsTableView.dataSource = self
        self.friendsTableView.delegate = self
        getStudentList()
        
    }
    
    
    
    func getStudentList()  {
        self.ref.child("friends").observeSingleEvent(of: .value) { (snapshot) in
            //get user value
            
            let value = snapshot.value as? NSDictionary
            var friends:[Friend] = []
            
            if snapshot.childrenCount > 0 {
                for student in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let friendObject = student.value as? [String:AnyObject]
                    let friend = Friend(fName: friendObject!["fName"] as! String, lName: friendObject!["lName"] as! String, id: friendObject!["id"] as! String, city: friendObject!["city"] as! String, birthday: friendObject!["birthday"] as! String, fbUrl: friendObject!["fbUrl"] as! String, phoneNum: friendObject!["phoneNum"] as! String, img: friendObject!["img_url"] as! String)
                    
                    friends.append(friend)
                }
            }
            self.friendList = friends
            self.friendsTableView.reloadData()
            self.loadingView.alpha = 0
            self.view.sendSubviewToBack(self.loadingView)
            
        }
    }
    
    


   
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let friend = friendList[indexPath.row]
        
        let cell:FriendTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
        
        cell.setupLayout(firstName: friend.fName, lastName: friend.lName, city: friend.city, profile: friend.imgString)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Student = friendList[indexPath.row]
        performSegue(withIdentifier: "detailsSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue"{
            if let nextViewController = segue.destination as? PersonalDetailsViewController {
                nextViewController.friendObject = Student
            }
        }
    }
    
    
    
}

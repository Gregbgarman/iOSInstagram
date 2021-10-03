//
//  FeedViewController.swift
//  Instagram
//
//  Created by Greg Garman on 10/2/21.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=TableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let post=posts[indexPath.row]
        let user=post["author"] as! PFUser
        cell.LabelUsername.text=user.username
        cell.LabelComment.text=post["caption"] as! String
        
        let file=post["image"] as! PFFileObject
        let urlstring=file.url!
        let url=URL(string: urlstring)!
        
        cell.IVphotoview.af_setImage(withURL: url)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate=self
        TableView.dataSource=self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query=PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit=20
        
        query.findObjectsInBackground { posts, Error in
            if posts != nil{
                self.posts=posts!
                self.TableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var TableView: UITableView!
    
    var posts = [PFObject]()

}

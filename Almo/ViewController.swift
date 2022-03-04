//
//  ViewController.swift
//  Almo
//
//  Created by MAC OS on 03/03/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var TABLEVIEW: UITableViewCell!
    var artist = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadJsonData()
        
     //   TABLEVIEW.delegate = self
       // TABLEVIEW.dataSource = self
    }
    func loadJsonData()
       {
          AF.request("https://jsonplaceholder.typicode.com/albums").responseJSON { (response) in
                           print(response)
              print(response.result)
              
              if let json = response.result as! [[String:Any]]?{
                    
                  if let responseValue = json["rseult"] as! [[String:Any]]? {
                      
                      self.artist = responseValue
                      self.TABLEVIEW.reloadData()
                  }
            
        }
          }

}
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        if(artist.count > 0){
                    do{
                    let artistData = artist[indexPath.row]
                    cell.IMG.image = try UIImage(data: Data(contentsOf: URL(string: artistData["artworkUrl60"] as! String) ?? URL(string: "http://www.google.com")!))
                        cell.IMG1.text = artistData["IMG1"] as! String
                        cell.IMG2.text = artistData["IMG2"] as! String
                        cell.IMG3.text = artistData["IMG3"] as! String
                    }catch{
                          
                    }
                      
                }
                return cell
    }
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

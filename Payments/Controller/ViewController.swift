//
//  ViewController.swift
//  Payments
//
//  Created by Saranya ramamoorthy on 30/04/21.
//

import UIKit
import Alamofire
import Toast_Swift
import SDWebImage

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var paymenttable: UITableView!
    var payment:PaymentModel?
    var links = [[String:URL]]()
    var logo = [URL]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            print("Not connected")
            self.navigationController?.view.makeToast("Please connect internet", duration: 3.0, position: .bottom)
        case .online(.wwan):
            print("Connected via WWAN")
            getpaymentservice()
           
        case .online(.wiFi):
            print("Connected via WiFi")
            getpaymentservice()
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func getpaymentservice(){
        
        
        let url = "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json"

      
        
   AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { [self] response in
            
          //New
          let decoder = JSONDecoder()

          do {
             
              let user = try decoder.decode(PaymentModel.self, from: response.data!)
              self.payment = user
              
           // print("payment count is",self.payment!.networks.applicable.count)
            
          
            if self.payment!.networks.applicable.count > 0
            {
                
                for i in 0..<self.payment!.networks.applicable.count
                {
                    
                    self.links.append((self.payment?.networks.applicable[i].links)!)
                    
                }
            }
       
            
            for new in self.links
            {
                let logo:URL = new["logo"]!
               // print("logo is",logo)
                self.logo.append(logo)
            }
            

            DispatchQueue.main.async {
               self.paymenttable.reloadData()
                self.paymenttable.delegate = self
                self.paymenttable.dataSource = self
            }
          }
    catch {
       print(error.localizedDescription)
   }
   }
}
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
           return 1
       }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.logo.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = paymenttable.dequeueReusableCell(withIdentifier: "Cell") as! PaymentCell

        cell.label.text = self.payment!.networks.applicable[indexPath.row].label
        
        
        let str = self.logo[indexPath.row]

       cell.logo.sd_setImage(with: str) { (image, error, cache, urls) in
                    if (error != nil) {
    }
                    else {

                        cell.logo.image = image

                    }
                }

        return cell
    }


}


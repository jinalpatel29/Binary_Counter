//
//  ViewController.swift
//  Custom_Cell
//
//  Created by Dojo on 1/17/18.
//  Copyright © 2018 Dojo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource , CustomCellDelegate{
   
    var nums: [Int] = []
    var total = 0
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalValue.text! = String(total)
        tableView.dataSource = self
        for i in 0...15 {
            var num = 0.0;
            num = pow(Double(10), Double(i))
            nums.append(Int(num))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.unitLabelText.text = "\(nums[indexPath.row])"
        cell.delegate = self
//        cell.leftButton.backgroundColor = UIColor.red
//        cell.leftButton.tag = indexPath.row
//        cell.plusButton.backgroundColor = UIColor.green
//        cell.plusButton.tag = indexPath.row
//        return cell
        return cell
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
    
    func buttonPressedDelegate(cell: CustomCell, increment: Bool) {
        let indexPath = self.tableView.indexPathForRow(at: cell.center)
        let index = indexPath!.row
        countTotal(index, increment)
    }
    
    func countTotal(_ index: Int, _ increment: Bool){
        if increment{
            self.total = self.total + self.nums[index]
            print("in plus \(total)")
        }else{
          
            self.total = total - self.nums[index]
              print("in minus \(total)")
        }
        totalValue.text = String(total)
        tableView.reloadData()
    }
    
}


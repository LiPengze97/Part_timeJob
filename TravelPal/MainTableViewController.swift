//
//  MainTableViewController.swift
//

import UIKit

class MainTableViewController: UITableViewController {
    
    //0代表一般，1代表特殊
    var mark = 0
    //选择的行数
    var selectnum = 0
    
    //这是tableviewarray里面第几个
    var tableid = 0
    
    
    
    
    let kCloseCellHeight: CGFloat = 179
    let kOpenCellHeight: CGFloat = 488
    
    let kRowsCount = 10
    var vview = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 242))
    
    var cellHeights = [CGFloat]()

    var tourismLvbanInfos = Array<TourismLvbanInfo>()
    var closeLvbanInfos:[CloseLvbanInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = kCloseCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        createCellHeightsArray()
        self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        
    }
    
    // MARK: configure
    func createCellHeightsArray() {
        for _ in 0...kRowsCount {
            cellHeights.append(kCloseCellHeight)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mark == 0{
            return closeLvbanInfos.count
        }else{
            return tourismLvbanInfos.count
        }
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      
      guard case let cell as DemoCell = cell else {
        return
      }
      
      cell.backgroundColor = UIColor.clear
      
      if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight {
        cell.selectedAnimation(false, animated: false, completion:nil)
      } else {
        cell.selectedAnimation(true, animated: false, completion: nil)
      }
      
      cell.number = indexPath.row
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! DemoCell
        if mark == 1{
        cell.fromLabel.text = tourismLvbanInfos[indexPath.row].departure
        cell.fromlabel1.text = tourismLvbanInfos[indexPath.row].departure
        cell.toLabel.text = tourismLvbanInfos[indexPath.row].destination
        cell.tolabel1.text = tourismLvbanInfos[indexPath.row].destination
        cell.postTimeLabel.text =  tourismLvbanInfos[indexPath.row].publishTime
        cell.peoplenumLabel.text =  tourismLvbanInfos[indexPath.row].planPeople
        cell.peoplenumLabel1.text = tourismLvbanInfos[indexPath.row].planPeople
        cell.deptTimeLabel.text = tourismLvbanInfos[indexPath.row].departureTime
        cell.typeLabel.text = "远途旅伴"
        cell.typeLabel1.text = "远途旅伴"
        cell.budgetLabel.text = tourismLvbanInfos[indexPath.row].budget
        cell.budgetLabel1.text = tourismLvbanInfos[indexPath.row].budget
        }else{
            cell.fromLabel.text = closeLvbanInfos[indexPath.row].departure
            cell.fromlabel1.text = closeLvbanInfos[indexPath.row].departure
            cell.toLabel.text = closeLvbanInfos[indexPath.row].destination
            cell.tolabel1.text = closeLvbanInfos[indexPath.row].destination
            cell.postTimeLabel.text =  closeLvbanInfos[indexPath.row].publishTime
            cell.peoplenumLabel.text =  closeLvbanInfos[indexPath.row].planPeople
            cell.peoplenumLabel1.text = closeLvbanInfos[indexPath.row].planPeople
            cell.deptTimeLabel.text = closeLvbanInfos[indexPath.row].departureTime
            cell.typeLabel.text = "远途旅伴"
            cell.typeLabel1.text = "远途旅伴"
            cell.budgetLabel.text = closeLvbanInfos[indexPath.row].budget
            cell.budgetLabel1.text = closeLvbanInfos[indexPath.row].budget
            cell.tableid = self.tableid
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[(indexPath as NSIndexPath).row]
    }
    
    // MARK: Table vie delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight { // open cell
            cellHeights[(indexPath as NSIndexPath).row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[(indexPath as NSIndexPath).row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)

        selectnum = indexPath.row
        
    }

}

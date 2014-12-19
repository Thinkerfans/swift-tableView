//
//  ViewController.swift
//  iosTableView
//
//  Created by apple on 14-12-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var datas : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        datas = ["体育频道"]
        println("\(datas.count)")
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        let addBt = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "insertItem")
        self.navigationItem.rightBarButtonItem = addBt
        
        
//        cell.selectionStyle = UITableViewCellSelectionStyleNone; 
        
    }
    
    // 插入元素，调用系统本身的机制来删除元素
    func insertItem(){
        var item =  "中央卫视"
        datas.insertObject(item, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//传递数据函数
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let data = datas.objectAtIndex(indexPath.row) as String
                (segue.destinationViewController as DetailController).data = data
            }
        
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("\(indexPath.row)")

    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("\(datas.count)")
        return datas.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = self.datas.objectAtIndex(indexPath.row).description
       // cell.selectionStyle = UITableViewCellSelectionStyle.None //设置选中时无颜色变化
        return cell
    }

    // 支持单元格编辑功能
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            datas.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        if fromIndexPath != toIndexPath{
            var object: AnyObject = datas.objectAtIndex(fromIndexPath.row)
            datas.removeObjectAtIndex(fromIndexPath.row)
            if toIndexPath.row > self.datas.count{
                self.datas.addObject(object)
            }else{
                self.datas.insertObject(object, atIndex: toIndexPath.row)
            }
        }
    }
    
}


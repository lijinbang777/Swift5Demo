//
//  TTMessageViewController.swift
//  Swift5Demo
//
//  Created by jinbang.li on 2022/7/4.
//  Copyright © 2022 com.test.www. All rights reserved.
//

import UIKit

class TTMessageViewController: UIViewController {

    var tableView = UITableView()
    var dataList: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

            self.view.backgroundColor = .white
            self.title = "tableview"
        //右上角编辑按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
        dataList = NSMutableArray.init(array: ["信息0","信息1","信息2","信息3"])
        createTableViewUI()
        
    }
    @objc func editAction(){
        tableView.setEditing(true, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
    }

    @objc func doneAction(){
        tableView.setEditing(false, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
    }
    

}
extension TTMessageViewController: UITableViewDelegate,UITableViewDataSource{
   
    
   
    
   private func createTableViewUI(){
        tableView = UITableView.init(frame: UIScreen.main.bounds,style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
       tableView.separatorStyle = .none
       tableView.tableFooterView = UIView()
       self.view .addSubview(tableView)
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
       cell.textLabel?.text = dataList[indexPath.row] as? String
       
       return cell
       
    }
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.dataList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dataList[indexPath.row])
    }
    
    //使cell的分割线与屏幕两端对齐
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = .zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            cell.layoutMargins = .zero
        }
    }
    //编辑样式
   private func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
        //添加.insert 删除.delete
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alertVC = UIAlertController.init(title: "温馨提示", message: "确定要删除\(dataList[indexPath.row])?", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction.init(title: "确定", style: .destructive, handler: { UIAlertAction in
                self.dataList.removeObject(at: indexPath.row)
                tableView.reloadData()
            }))
            alertVC.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: { UIAlertAction in
                
            }))
            present(alertVC, animated: true) {
                
            }
            if editingStyle == .insert {
                print("增加")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        dataList.exchangeObject(at: sourceIndexPath.row, withObjectAt: destinationIndexPath.row)
        tableView.reloadData()
    }
}

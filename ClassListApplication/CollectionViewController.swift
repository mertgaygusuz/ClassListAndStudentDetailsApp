//
//  CollectionViewController.swift
//  ClassListApplication
//
//  Created by Mert Gaygusuz on 9.07.2022.
//

import UIKit

private let cellName = "cellName"

struct Student{
    var name : String
    var studentNumber : Int
}

class CollectionViewController: UICollectionViewController {

    var selectedIndex = 0
    var students : [Student] = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let lineNumberofElements : CGFloat = 3
            let space : CGFloat = 4
            let totalSpace = space * (lineNumberofElements - 1)
            let itemSpace = totalSpace / lineNumberofElements
            let width = collectionView.frame.width / lineNumberofElements - itemSpace
            let height = width
            layout.itemSize = CGSize(width: width, height: height)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = space
        }
        
        let o1 = Student(name: "Mert", studentNumber: 1963)
        let o2 = Student(name: "Efe", studentNumber: 3076)
        let o3 = Student(name: "Sıla", studentNumber: 1537)
        let o4 = Student(name: "Yiğit", studentNumber: 7295)
        let o5 = Student(name: "Melis", studentNumber: 4153)
        let o6 = Student(name: "Can", studentNumber: 176)
        
        students.append(o1)
        students.append(o2)
        students.append(o3)
        students.append(o4)
        students.append(o5)
        students.append(o6)

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath)
        
        if let customCell = cell as? CollectionViewCell{
            customCell.lblStudentName.text = students[indexPath.row].name
            return customCell
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "details", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController{
            vc.student = students[selectedIndex]
        }
    }
    
}

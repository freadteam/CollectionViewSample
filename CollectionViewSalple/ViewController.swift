//
//  ViewController.swift
//  CollectionViewSalple
//
//  Created by Ryo Endo on 2018/04/10.
//  Copyright © 2018年 Ryo Endo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var sampleCollectionView: UICollectionView!
    var imageArray = ["1.jpg", "2.jpg","3.jpg","4.jpg","5.jpg","6.png","7.jpg","8.jpg","9.jpg","10.jpg","11.png", "12.jpg", "13.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleCollectionView.dataSource = self
        sampleCollectionView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //セルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    //セルに表示される処理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //cellの登録
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        //imageViewとセルの結びつけ
        let sampleView = cell.viewWithTag(1) as! UIImageView
        sampleView.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    //storyboradでimageviewmの制約とcell間の余白の調整が必要
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize:CGFloat = self.view.bounds.width/3 - 2
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    
    //選択されたセルの処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toNext", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    //受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! NextViewController
        let selectedIndex = sampleCollectionView.indexPathsForSelectedItems![0]
        nextViewController.selectedName = imageArray[selectedIndex.row]
    }
    
}


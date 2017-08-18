//
//  ViewController.swift
//  LWCollectionViewCell
//
//  Created by Paolo Arduin on 08/18/2017.
//  Copyright (c) 2017 Paolo Arduin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView.init(frame: CGRect.zero,
                                                   collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ExampleCell.self, forCellWithReuseIdentifier: ExampleCell.identifier)
        return collectionView
    }()
    
    fileprivate var elements: [ExampleElement] = []
    
    
    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // Collection view
        self.collectionView.frame = self.view.bounds
        self.collectionView.setCollectionViewLayout(self.getCollectionViewLayout(), animated: false)
        self.view.addSubview(self.collectionView)
        
        self.popolate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: -
    
    fileprivate func getCollectionViewLayout() -> UICollectionViewLayout {
        let numberOfItems: CGFloat = 3.0
        let minSpacing: CGFloat = 5.0
        let paddings: CGFloat = numberOfItems + 1
        let itemWidth = floor((self.view.frame.width - minSpacing * paddings) / numberOfItems)
        let emptySpace = floor(self.view.frame.width.truncatingRemainder(dividingBy: itemWidth))
        let lineSpacing = ceil(emptySpace / paddings)
        let sectionInsectTop = lineSpacing
        let sectionInsetLeft = ceil(lineSpacing / 2)
        let sectionInset = UIEdgeInsetsMake(sectionInsectTop,
                                            sectionInsetLeft,
                                            sectionInsectTop,
                                            sectionInsetLeft)
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize.width = itemWidth
        collectionViewLayout.itemSize.height = ExampleCell.estimatedHeight()
        collectionViewLayout.minimumLineSpacing = lineSpacing
        collectionViewLayout.minimumInteritemSpacing = lineSpacing
        collectionViewLayout.sectionInset = sectionInset
        return collectionViewLayout
    }
    
    fileprivate func popolate() {
        if let url = Bundle.main.url(forResource: "icon-names", withExtension: nil) {
            let dataString = try! String.init(contentsOf: url, encoding: .utf8)
            let imageNames = dataString.components(separatedBy: "\n")
            
            imageNames.forEach {
                if let image = UIImage.init(named: $0) {
                    let title = $0.replacingOccurrences(of: "icon-", with: "")
                    let element = ExampleElement.init(image: image, title: title)
                    self.elements.append(element)
                }
            }
            
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView)
        -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int)
        -> Int
    {
        return self.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell
    {
        return collectionView.dequeueReusableCell(withReuseIdentifier: ExampleCell.identifier,
                                                  for: indexPath)
    }
}

// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath)
    {
        if let exampleCell = cell as? ExampleCell {
            exampleCell.element = self.elements[indexPath.row]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath)
    {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

//
//  CustomSearchController.swift
//  College
//
//  Created by Liya Wu-17 on 8/3/16.
//  Copyright © 2016 ms. All rights reserved.
//

//import UIKit
//
//class CustomSearchController: UISearchController {
//
//    var customSearchBar: CustomSearchBar!
//
//    init(searchResultsController: UIViewController!, searchBarFrame: CGRect, searchBarFont: UIFont, searchBarTextColor: UIColor, searchBarTintColor: UIColor) {
//        super.init(searchResultsController: searchResultsController)
//        
//        configureSearchBar(searchBarFrame, font: searchBarFont, textColor: searchBarTextColor, bgColor: searchBarTintColor)
//    }
//    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    func configureSearchBar(frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor) {
//        customSearchBar = CustomSearchBar(frame: frame, font: font , textColor: textColor)
//        
//        customSearchBar.barTintColor = bgColor
//        customSearchBar.tintColor = textColor
//        customSearchBar.showsBookmarkButton = false
//        customSearchBar.showsCancelButton = true
//    }
//}
//

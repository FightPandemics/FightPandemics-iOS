//
//  LocationCellSearch.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/22/20.
//
//  Copyright (c) 2020 FightPandemics
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import UIKit

class LocationCellSearch: UIView {
    private var searchBar = UITextField()
    func setUp() {
        searchBar.attributedPlaceholder = NSAttributedString(string: "FilterLocationCellSearchBar".localized, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 16), NSAttributedString.Key.foregroundColor: UIColor(named: "#979797")!])
        searchBar.backgroundColor = UIColor.fightPandemicsWhiteSmoke()
        let magImg = UIImageView()
        magImg.image = UIImage(named: "search")
        let lView = UIView()
        lView.addSubview(magImg)
        magImg.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        lView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        searchBar.leftViewMode = .always
        searchBar.leftView = lView
        searchBar.clipsToBounds = true
        searchBar.layer.masksToBounds = true
        searchBar.frame.size.height = 50
        searchBar.layer.cornerRadius = searchBar.frame.size.height / 2
        searchBar.makeSubview(of: self)
            .width(UIScreen.main.bounds.width - 50)
            .height(50)
            .left(to: \.leftAnchor, constant: 28)
            .right(to: \.rightAnchor, constant: 23)
            .top(to: \.topAnchor, constant: 0)
    }
}



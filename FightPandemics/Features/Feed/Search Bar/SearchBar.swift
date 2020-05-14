//
//  SearchBar.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/14/20.
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

class SearchBar: UIView {
    private var searchBar = UITextField()
    private var filterBtn = UIButton()
    func setUp (placeHolder: String) {
        searchBar.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 15), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#939393")])
        let lView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let lImgView = UIImageView(image: #imageLiteral(resourceName: "search 19"))
        lImgView.frame = CGRect(x: 19, y: 13, width: 25, height: 25)
        lView.addSubview(lImgView)
        searchBar.leftView = lView
        searchBar.leftViewMode = .always
        searchBar.frame.size.height = 45
        searchBar.layer.masksToBounds = true
        searchBar.layer.cornerRadius = searchBar.frame.size.height / 2
        searchBar.backgroundColor = UIColor(hexString: "#F2F2F2")
        self.addSubview(searchBar)
        filterBtn.setBackgroundImage(#imageLiteral(resourceName: "Action 19"), for: .normal)
        filterBtn.frame.size.width = 48
        filterBtn.frame.size.height = 48
        self.addSubview(filterBtn)
        makeConstraints()
    }
    func makeConstraints () {
        self.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: searchBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: (UIScreen.main.bounds.width - 95)).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .right, relatedBy: .equal, toItem: filterBtn, attribute: .left, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 32).isActive = true
        filterBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: filterBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 48).isActive = true
        NSLayoutConstraint(item: filterBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 48).isActive = true
        NSLayoutConstraint(item: filterBtn, attribute: .left, relatedBy: .equal, toItem: searchBar, attribute: .right, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: filterBtn, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 25).isActive = true
        NSLayoutConstraint(item: filterBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 32).isActive = true
    }
}

//
//  PillButtonPrototypeVC.swift
//  FightPandemics
//
//  Created by Luciano Schillagi on 5/26/20.
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

class PillButtonPrototypeVC: UIViewController {

    let addThreeTagsBtn = PillButton(buttonType: .regular, title: "Add 3 tags")
    let closeBtn = PillButton(buttonType: .outline, title: "Close")
    let postBtn = PillButton(buttonType: .bold, title: "Post")
    let applyFiltersBtn = PillButton(buttonType: .regular, title: "Apply Filters")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
  }

    func setupUI() {
        view.addSubview(addThreeTagsBtn)
        addThreeTagsBtn.translatesAutoresizingMaskIntoConstraints = false
        addThreeTagsBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addThreeTagsBtn.widthAnchor.constraint(equalToConstant: 280).isActive = true
        addThreeTagsBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addThreeTagsBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500).isActive = true

        view.addSubview(postBtn)
        postBtn.translatesAutoresizingMaskIntoConstraints = false
        postBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        postBtn.widthAnchor.constraint(equalToConstant: 280).isActive = true
        postBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        postBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true

        view.addSubview(closeBtn)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        closeBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        closeBtn.widthAnchor.constraint(equalToConstant: 280).isActive = true
        closeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        closeBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
        
        view.addSubview(applyFiltersBtn)
        applyFiltersBtn.isEnabled = false
        applyFiltersBtn.alpha = 0.5
        applyFiltersBtn.translatesAutoresizingMaskIntoConstraints = false
        applyFiltersBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        applyFiltersBtn.widthAnchor.constraint(equalToConstant: 280).isActive = true
        applyFiltersBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        applyFiltersBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
    }

}

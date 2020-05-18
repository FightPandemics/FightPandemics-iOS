//
//  ButtonPrototypeVC.swift
//  FightPandemics
//
//  Created by Luciano Schillagi on 5/16/20.
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

class ButtonPrototypeController: UIViewController {

    private var regularButton = PillButton()
    private var boldButton = PillButton()
    private var outlineButton = PillButton()
    private var inactiveButton = PillButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        setupRegularButton()
        setupBoldButton()
        setupOutlineButton()
        setupInactiveButton()
  }

    func setupRegularButton() {
         view.addSubview(regularButton)
         regularButton.setTitle("Regular Button", for: .normal)
         regularButton.translatesAutoresizingMaskIntoConstraints = false
         regularButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
         regularButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
         regularButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         regularButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500).isActive = true
    }

    func setupBoldButton() {
         view.addSubview(boldButton)
         boldButton.setTitle("Bold Button", for: .normal)
         boldButton.titleLabel?.font = Fonts.dmSansBold.customFont(size: 22)
         boldButton.translatesAutoresizingMaskIntoConstraints = false
         boldButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
         boldButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
         boldButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         boldButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true
    }

    func setupOutlineButton() {
         view.addSubview(outlineButton)
         outlineButton.setTitle("Outline Button", for: .normal)
         outlineButton.setTitleColor(.blue, for: .normal)
         outlineButton.backgroundColor = .clear
         outlineButton.layer.borderWidth = 1.0
         outlineButton.layer.borderColor = UIColor.blue.cgColor
         outlineButton.translatesAutoresizingMaskIntoConstraints = false
         outlineButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
         outlineButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
         outlineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         outlineButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
    }

    func setupInactiveButton() {
         view.addSubview(inactiveButton)
         inactiveButton.setTitle("Inactive Button", for: .normal)
         inactiveButton.isEnabled = false
         inactiveButton.alpha = 0.5
         inactiveButton.translatesAutoresizingMaskIntoConstraints = false
         inactiveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
         inactiveButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
         inactiveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         inactiveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
    }

}

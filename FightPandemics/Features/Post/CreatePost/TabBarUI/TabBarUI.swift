//
//  TabBarUI.swift
//  FightPandemics
//
//  Created by ehsan sat on 5/18/20.
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

class TabBarUI: UIView {
    private var feedBtn = UIButton()
    private var searchBtn = UIButton()
    private var postBtn = UIButton()
    private var inboxBtn = UIButton()
    private var profileBtn = UIButton()
    private var feedLbl = UILabel()
    private var searchLbl = UILabel()
    private var inboxLbl = UILabel()
    private var profileLbl = UILabel()
    private var feedStack = UIStackView()
    private var searchStack = UIStackView()
    private var postStack = UIStackView()
    private var inboxStack = UIStackView()
    private var profileStack = UIStackView()
    private var dotView = UIView()
    private var wholeStack = UIStackView()
    enum Selected: Int {
        case feed = 1
        case search
        case post
        case inbox
        case profile
    }
    func setUp (selected: Selected) {
        dotView.backgroundColor = UIColor(hexString: "#425AF2")
        dotView.frame.size.height = 6
        dotView.clipsToBounds = true
        dotView.layer.cornerRadius = dotView.frame.size.height / 2
        self.addSubview(dotView)
        feedBtn.setImage(#imageLiteral(resourceName: "home (1)").withRenderingMode(.alwaysTemplate), for: .normal)
        feedBtn.imageView?.contentMode = .scaleAspectFit
        feedBtn.tintColor = (selected.rawValue == 1) ? .black : UIColor(hexString: "#979797")
        self.addSubview(feedBtn)
        searchBtn.setImage(#imageLiteral(resourceName: "Group 1087").withRenderingMode(.alwaysTemplate), for: .normal)
        searchBtn.tintColor = (selected.rawValue == 2) ? .black : UIColor(hexString: "#979797")
        searchBtn.imageView?.contentMode = .scaleAspectFit
        self.addSubview(searchBtn)
        postBtn.setImage(#imageLiteral(resourceName: "plus-circle-solid copy"), for: .normal)
        postBtn.imageView?.contentMode = .scaleAspectFit
        self.addSubview(postBtn)
        inboxBtn.setImage(#imageLiteral(resourceName: "inbox").withRenderingMode(.alwaysTemplate), for: .normal)
        inboxBtn.tintColor = (selected.rawValue == 4) ? .black : UIColor(hexString: "#979797")
        inboxBtn.imageView?.contentMode = .scaleAspectFit
        self.addSubview(inboxBtn)
        profileBtn.setImage(#imageLiteral(resourceName: "user-circle").withRenderingMode(.alwaysTemplate), for: .normal)
        profileBtn.tintColor = (selected.rawValue == 5) ? .black : UIColor(hexString: "#979797")
        profileBtn.imageView?.contentMode = .scaleAspectFit
        self.addSubview(profileBtn)
        feedLbl.attributedText = NSAttributedString(string: "Feed", attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#979797")])
        self.addSubview(feedLbl)
        searchLbl.attributedText = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#979797")])
        self.addSubview(searchLbl)
        inboxLbl.attributedText = NSAttributedString(string: "Inbox", attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#979797")])
        self.addSubview(inboxLbl)
        profileLbl.attributedText = NSAttributedString(string: "Profile", attributes: [NSAttributedString.Key.font: Fonts.poppinsRegular.customFont(size: 12), NSAttributedString.Key.foregroundColor: UIColor(hexString: "#979797")])
        self.addSubview(profileLbl)
        setUpStacks(selected: selected)
    }
    func setUpStacks (selected: Selected) {
        setUpLStack(selected: selected)
        setUpRStack(selected: selected)
        setUpConstraints(selected: selected)
    }
    func setUpRStack (selected: Selected) {
        inboxStack.translatesAutoresizingMaskIntoConstraints = false
        inboxStack.axis = .vertical
        inboxStack.alignment = .center
        inboxStack.distribution = .fill
        inboxStack.spacing = 5
        inboxStack.addArrangedSubview(inboxBtn)
        if (selected.rawValue == 3) {
            inboxStack.spacing = 12
            inboxStack.addArrangedSubview(dotView)
        } else {
            inboxStack.addArrangedSubview(inboxLbl)
        }
        self.addSubview(inboxStack)
        profileStack.translatesAutoresizingMaskIntoConstraints = false
        profileStack.axis = .vertical
        profileStack.alignment = .center
        profileStack.distribution = .fill
        profileStack.spacing = 5
        profileStack.addArrangedSubview(profileBtn)
        if (selected.rawValue == 4) {
            profileStack.spacing = 12
            profileStack.addArrangedSubview(dotView)
        } else {
            profileStack.addArrangedSubview(profileLbl)
        }
        self.addSubview(profileStack)
        wholeStack.translatesAutoresizingMaskIntoConstraints = false
        wholeStack.axis = .horizontal
        wholeStack.alignment = .top
        wholeStack.distribution = .fillEqually
        wholeStack.spacing = ((UIScreen.main.bounds.width - 275) / 4)
        wholeStack.addArrangedSubview(feedStack)
        wholeStack.addArrangedSubview(searchStack)
        wholeStack.addArrangedSubview(postStack)
        wholeStack.addArrangedSubview(inboxStack)
        wholeStack.addArrangedSubview(profileStack)
        self.addSubview(wholeStack)
    }
    func setUpLStack (selected: Selected) {
        feedStack.translatesAutoresizingMaskIntoConstraints = false
        feedStack.axis = .vertical
        feedStack.alignment = .center
        feedStack.distribution = .fill
        feedStack.spacing = 5
        feedStack.addArrangedSubview(feedBtn)
        if (selected.rawValue == 1) {
            feedStack.spacing = 12
            feedStack.addArrangedSubview(dotView)
        } else {
            feedStack.addArrangedSubview(feedLbl)
        }
        self.addSubview(feedStack)
        searchStack.translatesAutoresizingMaskIntoConstraints = false
        searchStack.axis = .vertical
        searchStack.alignment = .center
        searchStack.distribution = .fill
        searchStack.spacing = 5
        searchStack.addArrangedSubview(searchBtn)
        if (selected.rawValue == 2) {
            searchStack.spacing = 12
            searchStack.addArrangedSubview(dotView)
        } else {
            searchStack.addArrangedSubview(searchLbl)
        }
        self.addSubview(searchStack)
        postStack.translatesAutoresizingMaskIntoConstraints = false
        postStack.axis = .vertical
        postStack.alignment = .center
        postStack.distribution = .fill
        postStack.spacing = 5
        postStack.addArrangedSubview(postBtn)
        self.addSubview(postStack)
    }
    func setUpConstraints (selected: Selected) {
        switch selected {
        case .feed:
            dotView.makeSubview(of: feedStack)
            .width(6)
            .height(6)
        case .search:
            dotView.makeSubview(of: searchStack)
            .width(6)
            .height(6)
        case .inbox:
            dotView.makeSubview(of: inboxStack)
            .width(6)
            .height(6)
        case .profile:
            dotView.makeSubview(of: profileStack)
            .width(6)
            .height(6)
        default:
            break;
        }

        wholeStack.makeSubview(of: self)
            .width((UIScreen.main.bounds.width - 60))
            .height(60)
            .right(to: \.rightAnchor, constant: -30)
            .left(to: \.leftAnchor, constant: 30)
            .top(to: \.topAnchor, constant: 55)

    }
}



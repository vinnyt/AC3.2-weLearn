//
//  AssignmentTableViewCell.swift
//  weLearn
//
//  Created by Marty Avedon on 3/8/17.
//  Copyright © 2017 Victor Zhong. All rights reserved.
//

import UIKit
import SnapKit

class AssignmentTableViewCell: UITableViewCell {
    
    var delegate: Tappable?
    var indexPath: IndexPath!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        assignmentNameLabel.text = ""
        assignmentCountDownLabel.text = ""
        assignmentCountDownLabel.backgroundColor = UIColor.weLearnCoolWhite
        optionalTimerLabel.isHidden = true
        optionalTimerLabelsShadow.isHidden = true
    }
    
    // Action
    
    func didClickRepoButton(_ sender: UIButton) {
        if let unwrapDelegate = delegate {
            unwrapDelegate.cellTapped(cell: self)
        }
    }
    
    func setupHierarchy() {
        self.contentView.addSubview(box)
        self.contentView.addSubview(assignmentNameLabel)
        self.contentView.addSubview(topHorizontalRule)
        self.contentView.addSubview(bottomHorizontalRule)
        self.contentView.addSubview(assignmentCountDownLabel)
        self.contentView.addSubview(optionalTimerLabelsShadow)
        self.contentView.addSubview(optionalTimerLabel)
    }
    
    func setupConstraints() {
        box.snp.makeConstraints { (view) in
            view.leading.equalTo(contentView).offset(14)
            view.top.equalTo(contentView).offset(14)
            view.trailing.equalTo(contentView).inset(14)
            view.bottom.equalTo(contentView).inset(14)
        }
        
        assignmentNameLabel.snp.makeConstraints { label in
            label.top.equalTo(box).offset(10)
            label.leading.equalTo(20)
            label.trailing.equalTo(box).inset(20)
        }
        
        assignmentCountDownLabel.snp.makeConstraints { label in
            label.top.equalTo(topHorizontalRule.snp.bottom)
            label.leading.equalTo(box).offset(10)
            label.trailing.equalTo(box).inset(10)
        }
        
        optionalTimerLabel.snp.makeConstraints { view in
            view.centerY.equalTo(box.snp.top).offset(10)
            view.centerX.equalTo(box.snp.leading).offset(10)
            view.width.height.equalTo(40)
        }
        
        optionalTimerLabelsShadow.snp.makeConstraints { view in
            view.centerY.equalTo(optionalTimerLabel).inset(3)
            view.centerX.equalTo(optionalTimerLabel)
            view.width.height.equalTo(40)
        }
        topHorizontalRule.snp.makeConstraints { view in
            view.height.equalTo(1)
            view.width.equalTo(box)
            view.centerY.equalTo(assignmentNameLabel.snp.bottom)
            view.centerX.equalTo(box)
        }
        
        bottomHorizontalRule.snp.makeConstraints { view in
            view.height.equalTo(1)
            view.width.equalTo(box)
            view.centerY.equalTo(/*gradeLabel*/assignmentCountDownLabel.snp.bottom)
            view.centerX.equalTo(box)
            view.bottom.equalTo(box).inset(10)
        }
        
    }
    
    lazy var box: Box = {
        let button = Box()
        button.addTarget(self, action: #selector(didClickRepoButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var assignmentNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 24)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var assignmentCountDownLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.weLearnBlue
        label.font = UIFont(name: "Avenir-Black", size: 30)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var topHorizontalRule: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.weLearnGrey
        return view
    }()
    
    lazy var bottomHorizontalRule: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.weLearnGrey
        return view
    }()
    
    lazy var optionalTimerLabel: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "timerIcon")
        view.contentMode = .scaleAspectFit
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.blue.cgColor
        view.layer.borderWidth = 3
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        return view
    }()
    
    lazy var optionalTimerLabelsShadow: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        view.layer.cornerRadius = 20
        return view
    }()
    
}

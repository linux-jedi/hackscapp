//
//  EventTableViewCell.swift
//  hacksc
//
//  Created by Caleb Thomas on 3/10/19.
//  Copyright © 2019 Caleb Thomas. All rights reserved.
//

import UIKit
import SnapKit

class EventTableViewCell: UITableViewCell {
  
  private let titleLabel = UILabel()
  private let locationLabel = UILabel()
  private let timeLabel = UILabel()
  private let eventImage = UIImageView()
  private var event: Event!

  init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, event: Event) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    // set event
    self.event = event
    
    // MARK: Setup components
    titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    titleLabel.textColor = UIColor.black
    titleLabel.text = event.name
    addSubview(titleLabel)
    
    titleLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(15)
      make.top.equalToSuperview().offset(15)
    }
    
    locationLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    locationLabel.textColor = UIColor.gray
    locationLabel.text = event.location
    addSubview(locationLabel)
    
    locationLabel.snp.makeConstraints {make in
      make.leading.equalTo(titleLabel)
      make.top.equalTo(titleLabel).offset(10)
    }

    eventImage.frame = CGRect(x: 0, y: 0, width: 69, height: 69)
    eventImage.layer.cornerRadius = 6.0
    eventImage.image = event.image
    addSubview(eventImage)
    
    eventImage.snp.makeConstraints {make in
      make.right.equalToSuperview().offset(-5)
      make.top.equalToSuperview().offset(5)
    }
    
    timeLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    timeLabel.textColor = UIColor.gray
    timeLabel.text = event.time
    addSubview(timeLabel)
    
    timeLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel)
      make.right.equalTo(eventImage.snp.left)
    }
    
    // Configure best on event type
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

}

//
//  ViewController.swift
//  hacksc
//
//  Created by Caleb Thomas on 3/10/19.
//  Copyright © 2019 Caleb Thomas. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
  
  private let tableView = UITableView()
  
  private var events = [Event]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    view.backgroundColor = UIColor.white
    
    // load data
    loadSampleEvents()
    
    let titleLabel = UILabel()
    titleLabel.text = "HackSC"
    titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
    titleLabel.textColor = .black
    view.addSubview(titleLabel)
    
    titleLabel.snp.makeConstraints { make in
      make.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
      make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
    }
    
    // Mark: Setup Table
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    tableView.rowHeight = 100
    view.addSubview(tableView)
    
    tableView.snp.makeConstraints{ make in
      make.width.centerX.equalToSuperview()
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  // Mark: Private methods
  private func loadSampleEvents() {
    guard let event1 = Event(name: "AWS Workshop", location: "W1", time: "10:30PM", image: UIImage(named: "aws"), type: Event.EventType.WORKSHOP) else {
      fatalError("Unable to load the image")
    }
    
    guard let event2 = Event(name: "Midnight Snack", location: "Penthouse", time: "12:00AM", image: UIImage(named: "Boba"), type: Event.EventType.FOOD) else {
      fatalError("Unable to load the image")
    }
    
    guard let event3 = Event(name: "Sunrise Yoga", location: "A5", time: "5:30AM", image: UIImage(named: "Yoga"), type: Event.EventType.FUN) else {
      fatalError("Unable to load the image")
    }
    
    events += [event1, event2, event3]
  }

}

extension EventViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // Fetch the data to populate the cell
    let event = events[indexPath.row]
    let cell = EventTableViewCell(style: .default, reuseIdentifier: "EventCell", event: event)
    
    // Return the cell
    return cell
  }
}

//
//  ShowTableViewController.swift
//  RadioApp
//
//  Created by Carrel on 4/16/20.
//  Copyright © 2020 Carrel. All rights reserved.
//

import Foundation
import UIKit

struct DailySection {
    var day: Date
    var shows: [Show]
}

private func getShowDay(date: Date) -> Date{
    let calendar = Calendar.current
    let component = calendar.dateComponents([.weekday], from: date)
    return calendar.date(from: component)!
}

class ShowTableViewController: UITableViewController {

    let defaultDate = Date(timeIntervalSinceReferenceDate: 0.0)
    
    var shows = [Show]()
    
    var show: Show?
    
    var sections = [DailySection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let groups = Dictionary(grouping: self.shows) { (show) in
            return getShowDay(date: show.date)
        }
        self.sections = groups.map { (key, values) in
            return DailySection(day: key, shows: values)
        }
        
        loadSampleShow()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7 //7 days of the week.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shows.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(weekdayFromOffset(offset: section))"
    }
    
    private func weekdayFromOffset(offset: Int) -> String {
        let date = Date()
        let calendar = Calendar.current
        let currentWeekDay = calendar.component(.weekday, from: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        
        
        if currentWeekDay + offset <= 7 {
            let newDate = Calendar.current.date(byAdding: .day, value: offset, to: date)!
            return formatter.string(from: newDate)
//            return (currentWeekDay + offset).dayOfWeek()
//            let components = DateComponents(weekday: (currentWeekDay + offset))
//            let weekdayString = formatter.string(from: components)
//            return weekdayString ?? "Caturday"
        } else {
            let newDate = Calendar.current.date(byAdding: .day, value: (offset - 7), to: date)!
            return formatter.string(from: newDate)
        }
    }
    
    private func loadSampleShow() {
        let sampleTitle = "Unpopular"
        let sampleDate = defaultDate
        let sampleDescription = "Pop music that never made it mainstream"
        let sampleLength = 1 //hour
        
        guard let show1 = Show(title: sampleTitle, date: sampleDate, description: sampleDescription, length: sampleLength) else {
                fatalError("Unable to instantiate show1")
        }
        
        shows += [show1, show1, show1]
    }
    
    private func formatHours(date: Date, showLengthHours: Int) -> String {
        let lengthInSeconds = Double(showLengthHours)*60.0
        let showStartTime = date
        let showEndTime = date.addingTimeInterval(lengthInSeconds)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        
        return "\(formatter.string(from: showStartTime)) - \(formatter.string(from: showEndTime))"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ShowTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ShowTableViewCell else {
            fatalError("The dequeued cell is not an instance of ShowTableViewCell")
        }

        let show = shows[indexPath.row]
        
        cell.titleLabel.text = show.title
        cell.dateLabel.text = formatHours(date: show.date, showLengthHours: show.length)
//        cell.descriptionLabel.text = show.description

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

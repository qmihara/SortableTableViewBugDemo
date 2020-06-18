//
//  TableViewController.swift
//  SortableTableViewBugDemo
//
//  Created by Kyusaku Mihara on 2020/06/18.
//  Copyright © 2020 Kyusaku Mihara. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {
    private lazy var items: [String] = {
        (0..<100).map { "Cell \($0 + 1)" }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let work = items[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        items.insert(work, at: destinationIndexPath.row)
    }
}

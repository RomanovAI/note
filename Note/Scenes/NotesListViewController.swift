//
//  NotesListViewController.swift
//  Note
//
//  Created by Артем Романов on 18.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController, NotesListViewControllerProtocol {
    
    var navController: UINavigationController?
    var interactor: NotesListInteractorProtocol?
    var router: NotesListRouterProtocol?
    
    private let cellId = "NoteViewCell"
    private var tableModel: NoteTableModel?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: cellId, bundle: .main), forCellReuseIdentifier: cellId)
            tableView.backgroundColor = UIColor.backgroundColor
            tableView.tableFooterView = UIView()
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NotesConfigurator.sharedInstance.configure(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchData()
        view.backgroundColor = UIColor.backgroundColor
        navController = navigationController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.layoutIfNeeded()
        interactor?.fetchData()
        tableView.reloadData()
    }
    
    // MARK: - Общая настройка вью
    func setupViewController(with viewModel: NotesList.NotesListViewModel) {
        setupNavigationBar(title: viewModel.title)
        setupToolbar(notesCount: viewModel.notesCount)
        tableModel = viewModel.noteTableModel
    }
    
    // MARK: - Настройка навбара
    private func setupNavigationBar(title: String) {
        navController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = title
    }
    
    // MARK: - Настройка тулбара
    private func setupToolbar(notesCount: Int) {
        navController?.isToolbarHidden = false
        let text = "\(notesCount) шт"
        var items = [UIBarButtonItem]()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let countLabel = UIBarButtonItem(title: text, style: .done, target: self, action: nil)
        countLabel.tintColor = .white
        let createNote = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNewNote))
        createNote.tintColor = .white
        items.append(space)
        items.append(countLabel)
        items.append(space)
        items.append(createNote)
        toolbarItems = items
    }
    // MARK: - Создание новой заметки
    @objc private func createNewNote() {
        router?.goToDetailsNote(at: nil)
    }
}

// MARK: - Табличные расширения
extension NotesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel?.notesListCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? NoteViewCell else { return UITableViewCell() }
        let cellModel = tableModel?.cellModel(indexPath: indexPath)
        cell.tableCellModel = cellModel
        return cell
    }
}

extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        router?.goToDetailsNote(at: index)
    }
}

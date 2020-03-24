//
//  FoldersListViewController.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class FoldersListViewController: UIViewController, FoldersListViewControllerProtocol {
    
    var navController: UINavigationController?
    var interactor: FoldersListInteractorProtocol?
    var router: FoldersListRouterProtocol?
    
    private let backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    private let cellId = "FolderViewCell"
    private var tableModel: FolderTableModel?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: cellId, bundle: .main), forCellReuseIdentifier: cellId)
            tableView.backgroundColor = backgroundColor
            tableView.tableFooterView = UIView()
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        FoldersListConfigurator.sharedInstance.configure(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        getData()
        navController = navigationController
    }
    
    private func getData() {
        interactor?.fetchData()
    }
    
    func setupViewController(viewModel: FoldersList.FoldersViewModel) {
        setupNavigationBar(title: viewModel.title, barButtonTitle: viewModel.rightNavigationBarButtonTitle)
        setupToolBar(toolBarButtonTitle: viewModel.RightToolBarButtonTitle)
        
        alertControllerTitle = viewModel.alerControllerModel.alertControllerTitle
        alertControllerMessage = viewModel.alerControllerModel.alertControllerMessage
        alertControllerTextFieldPlaceholder = viewModel.alerControllerModel.alertControllerTextFieldPlaceholder
        alertControllerSaveButtonTitle = viewModel.alerControllerModel.alertControllerSaveButtonTitle
        alertControllerCancelButtonTitle = viewModel.alerControllerModel.alertControllerCancelButtonTitle
        tableModel = viewModel.folderTableMode
    }
    
    private func setupNavigationBar(title: String, barButtonTitle: String) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = title
        let rightNavigationBarButtonItem = UIBarButtonItem(title: barButtonTitle, style: .done, target: self, action: #selector(tapRightNavigationBarButton))
        rightNavigationBarButtonItem.isEnabled = false
        navigationItem.rightBarButtonItem = rightNavigationBarButtonItem
    }
    
    @objc private func tapRightNavigationBarButton() {
        print("sss")
    }
    
    private func setupToolBar(toolBarButtonTitle: String) {
        navigationController?.isToolbarHidden = false
        var items = [UIBarButtonItem]()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let righToolBarButton = UIBarButtonItem(title: toolBarButtonTitle, style: .plain, target: self, action: #selector(tapRightToolBarButton))
        righToolBarButton.tintColor = .white
        items.append(space)
        items.append(righToolBarButton)
        toolbarItems = items
        
        navigationController?.toolbar.setBackgroundImage(UIImage(),
                                                         forToolbarPosition: .any,
                                                         barMetrics: .default)
        navigationController?.toolbar.setShadowImage(UIImage(), forToolbarPosition: .any)
    }
    
    private var alertControllerTitle: String?
    private var alertControllerMessage: String?
    private var alertControllerTextFieldPlaceholder: String?
    private var alertControllerSaveButtonTitle: String?
    private var alertControllerCancelButtonTitle: String?
    
    
    @objc private func tapRightToolBarButton() {
        guard let title = alertControllerTitle,
            let message = alertControllerMessage,
            let placeholder = alertControllerTextFieldPlaceholder,
            let saveButtonTitle = alertControllerSaveButtonTitle,
            let cancelButtonTitle = alertControllerCancelButtonTitle else { return }
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addTextField{ textField in
            textField.placeholder = placeholder
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange), for: .editingChanged)
        }
        let save = UIAlertAction(title: saveButtonTitle, style: .default, handler: { [weak self] action in
            guard let textField = ac.textFields?[0], let folderName = textField.text else { return }
            let request = FoldersList.FoldersListRequest(title: folderName)
            self?.interactor?.saveNewFolder(request: request)
            self?.tableView.reloadData()
        })
        save.isEnabled = false
        
        let cancel = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        ac.addAction(cancel)
        ac.addAction(save)
        present(ac, animated: true)
    }
    
    @objc private func alertTextFieldDidChange(field: UITextField) {
        guard let alertController = presentedViewController as? UIAlertController else { return }
        let textField = alertController.textFields![0]
        let addAction = alertController.actions[1]
        addAction.isEnabled = textField.text?.count == 0 ? false : true
    }
    
}


extension FoldersListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel?.folderslistCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? FolderViewCell, let tableModel = tableModel else { return UITableViewCell() }
        let cellModel = tableModel.cellModel(indexPath: indexPath)
        cell.tableCellModel = cellModel
        return cell
    }
    
}

extension FoldersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        router?.goToNotesList(at: index)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "delete", handler: { action, view, handler in
        })
        let configuration = UISwipeActionsConfiguration(actions: [delete])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}


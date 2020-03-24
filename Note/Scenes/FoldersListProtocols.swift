//
//  FoldersListProtocols.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation
import UIKit

protocol FoldersListRouterProtocol {
    var interactor: FoldersListInteractorProtocol? { get set }
    var view: FoldersListViewControllerProtocol? { get set }
    
    func goToNotesList(at index: Int)
}

protocol FoldersListInteractorProtocol {
    var presenter: FoldersListPresenterProtocol? { get set }
    var dataSource: [Folder]? { get }
    
    func fetchData()
    func saveNewFolder(_ request: FoldersList.FoldersListRequest)
    func removeFolder(_ request: FoldersList.FoldersListRequest)
}

protocol FoldersListPresenterProtocol {
    var view: FoldersListViewControllerProtocol? { get set }
    
    func presentFoldersList(response: FoldersList.FoldersListResponse)
}

protocol FoldersListViewControllerProtocol: class {
    var navController: UINavigationController? { get set }
    var interactor: FoldersListInteractorProtocol? { get set }
    var router: FoldersListRouterProtocol? { get set }
    
    func setupViewController(viewModel: FoldersList.FoldersViewModel)
}

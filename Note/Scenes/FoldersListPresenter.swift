//
//  FoldersListPresenter.swift
//  Note
//
//  Created by Артем Романов on 17.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation



class FoldersListPresenter: FoldersListPresenterProtocol {
    
   weak var view: FoldersListViewControllerProtocol?
    
    func presentFoldersList(response: FoldersList.FoldersListResponse) {
        let acModel = FolderAlertControllerModel(alertControllerTitle: "Новая папка",
                                                 alertControllerMessage: "Введите название для этой папки",
                                                 alertControllerTextFieldPlaceholder: "Имя", alertControllerSaveButtonTitle: "Сохранить",
                                                 alertControllerCancelButtonTitle: "Отменить")
        
        let folderTableModel = FolderTableModel(foldersList: response.foldersList)
        
        let viewModel = FoldersList.FoldersViewModel(title: "Папки",
                                                     rightNavigationBarButtonTitle: "Править",
                                                     RightToolBarButtonTitle: "Новая папка",
                                                     alerControllerModel: acModel,
                                                     folderTableMode: folderTableModel)
        
        setupViewController(viewModel: viewModel)
    }
    
    func setupViewController(viewModel: FoldersList.FoldersViewModel) {
        view?.setupViewController(viewModel: viewModel)
    }
    
}



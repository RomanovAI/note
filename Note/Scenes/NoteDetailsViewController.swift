//
//  NoteDetailsViewController.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import UIKit

class NoteDetailsViewController: UIViewController, NoteDetailsViewControllerProtocol {
    
    var interactor: NoteDetailsInteractorProtocol?
    var router: NoteDetailsRouterProtocol?
    
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.backgroundColor = UIColor.backgroundColor
            textView.text = ""
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NoteDetailsConfigurator.sharedInstance.configure(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Жизненный цикл
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchData()
        view.backgroundColor = UIColor.backgroundColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.layoutIfNeeded()
        addNote()
    }
    
    // MARK: - Создание заметки
    func addNote() {
        if !textView.text.isEmpty {
            interactor?.addNote(title: textView.text)
        }
    }
    
    func setupViewController(viewModel: NoteDetails.NoteDetailsViewModel) {
        textView.text = viewModel.title
    }
}

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
    
    private let backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.backgroundColor = backgroundColor
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchData()
        view.backgroundColor = backgroundColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveInDataStore()
    }
    
    func saveInDataStore() {
        
    }
    
    
    func setupViewController(viewModel: NoteDetails.NoteDetailsViewModel) {
        textView.text = viewModel.title + viewModel.subtitle
    }
}

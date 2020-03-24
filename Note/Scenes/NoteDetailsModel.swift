//
//  NoteDetailsModel.swift
//  Note
//
//  Created by Артем Романов on 19.03.2020.
//  Copyright © 2020 Artem Romanov. All rights reserved.
//

import Foundation


enum NoteDetails {
    
    struct NoteDetailsRequest {
        
    }
    
    struct NoteDetailsResponse {
        let note: Note
    }
    
    struct NoteDetailsViewModel {
        let title: String
        let date: String
        let subtitle: String
    }
    
}

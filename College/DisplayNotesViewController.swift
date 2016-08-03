//
//  DisplayNotesViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/2/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNotesViewController: UIViewController {

    @IBOutlet weak var noteContentTextView: UITextView!
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let displayCollegeViewController = segue.destinationViewController as! DisplayCollegeViewController
        if segue.identifier == "Save" {
            // if note exists, update title and content
            if let note = note {
                // 1
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContentTextView.text ?? ""
                RealmHelper.updateNote(note, newNote: newNote)
            } else {
                // if note does not exist, create new note
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = NSDate()
                // 2
                RealmHelper.addNote(note)
            }
            //Here we make sure that the ListNotesTableViewController is up to date with the changes we just made by retrieving all the notes from Realm and assigning them to the notes property.
            //DisplayNotesViewController.notes = RealmHelper.retrieveNotes()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // We are using the optional binding technique to unwrap the value in the note property and storing the actual value (if it exists) in a local variable named note.
        if let note = note {
            //This code will only execute if the note property was not nil. We are setting the text field and text view properties to the note's title and content, respectively.
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        }
        else {
            //This code is executed if the note property was nil. This happens if we are creating a new note, so we set the text field and text view to empty strings to ensure that our users can immediately begin typing their new note.
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    
}


//
//  RealmHelper.swift
//  College
//
//  Created by Liya Wu-17 on 8/7/16.
//  Copyright © 2016 ms. All rights reserved.
//

import RealmSwift

class RealmHelper {
    //static methods will go here
    
    static func addCollege(college: Colleges) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(college)
        }
    }
    
    static func addNote(note: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(note)
        }
    }
    
    static func deleteColleges(college: Colleges){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(college)
        }
    }
    
    static func deleteNote(note: Note){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(note)
        }
    }
    
    static func updateNote(noteToBeUpdated: Note, newNote: Note){
        let realm = try! Realm()
        try! realm.write(){
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationTime = newNote.modificationTime
        }
    }
    
    static func retrieveColleges() -> Results<Colleges> {
        let realm = try! Realm()
        return realm.objects(Colleges)
    }
    
    static func retrieveNotes() -> Results<Note> {
        let realm = try! Realm()
        return realm.objects(Note).sorted("modificationTime", ascending: false)
        
//        let realm = try! Realm()
//        let result = realm.objects(Colleges).filter("\(college.name) = 'special'")
//        print(result)
//        
        //filter through colleges to find the college that matches the \(College.name)
    }
    
    
}


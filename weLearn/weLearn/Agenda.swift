//
//  Agenda.swift
//  weLearn
//
//  Created by Victor Zhong on 3/1/17.
//  Copyright © 2017 Victor Zhong. All rights reserved.
//

import Foundation

enum AgendaModelParseError: Error {
    case results, parsingResults
}

class Agenda {
    var lessonName: String
    var date: Date
    var unit: String?
    var repoURL: String?
    var preworkURL: String?
    var morningQuizURL: String?
    var middayQuizURL: String?
    var homeworkDesc: String?
    var homeworkURL: String?
    
    init(lessonName: String,
         date: Date,
         unit: String?,
         repoURL: String?,
         preworkURL: String?,
         morningQuizURL: String?,
         middayQuizURL: String?,
         homeworkDesc: String?,
         homeworkURL: String?) {
        self.lessonName = lessonName
        self.date = date
        self.unit = unit
        self.repoURL = repoURL
        self.preworkURL = preworkURL
        self.morningQuizURL = morningQuizURL
        self.middayQuizURL = middayQuizURL
        self.homeworkDesc = homeworkDesc
        self.homeworkURL = homeworkURL
    }
    
    convenience init?(from dict: [String:Any]) throws {
        guard let titleField = dict["title"] as? [String : Any],
            let lessonName = titleField["$t"] as? String,
            let contentField = dict["content"] as? [String : Any],
            let contentString = contentField["$t"] as? String else {
                
                throw AgendaModelParseError.parsingResults
        }
        
        let dict = parseString(contentString)
        
        self.init(lessonName: lessonName,
                  date: dateConvert(dict["date"]!),
                  unit: dict["unit"],
                  repoURL: dict["repourl"],
                  preworkURL: dict["preworkrepourl"],
                  morningQuizURL: dict["morningquizurl"],
                  middayQuizURL: dict["middayquizurl"],
                  homeworkDesc: dict["homeworkdesc"],
                  homeworkURL: dict["homeworkurl"])
    }
    
    static func getAgenda(from data: Data) -> [Agenda]? {
        var agenda: [Agenda]? = []
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let result = jsonData as? [String : Any],
                let feed = result["feed"] as? [String : Any],
                let entries = feed["entry"] as? [[String : Any]] else {
                    throw AgendaModelParseError.results
            }
            
            for entry in entries {
                if let agendaDict = try Agenda(from: entry) {
                    agenda?.append(agendaDict)
                }
            }
        }
            
        catch {
            print("You got an error: \(error)")
        }
        
        return agenda
    }
}

private func parseString(_ string: String) -> [String : String] {
    var dict = [String:String]()
    
    let weirdArr = string.components(separatedBy: ", ")
    
    for all in weirdArr {
        let this = all.components(separatedBy: ": ")
        dict[this[0]] = this[1]
    }
    
    return dict
}

private func dateConvert(_ string: String) -> Date {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "mm/dd/yy"
    
    return dateformatter.date(from: string)!
}
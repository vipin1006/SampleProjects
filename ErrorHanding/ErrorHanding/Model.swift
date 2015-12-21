//
//  Model.swift
//  ErrorHanding
//
//  Created by padalingam agasthian on 19/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class CandidateClass: NSObject
{
    private(set) var candidates : [Candidate] = []
    
    func createCandidateBy(canID: Int,canName: String,canEmail : String ,canExp : String)throws -> Candidate
    {
//        let candidate = candidates.map($0.canId)
//        if candidate.contains(canID)
//        {
//            throw CandidateError.DuplicateId(canID)
//        }
        let newCandiate = Candidate(candidateId: canID, candidateName: canName , candidateEmail: canEmail, candidateExp: canExp)
        candidates.append(newCandiate)
        return newCandiate
    }
}

struct Candidate
{
    var candidateId : Int
    var candidateName : String
    var candidateEmail : String
    var candidateExp : String
}

extension Candidate : Equatable{}
func ==(lhs:Candidate , rhs: Candidate) -> Bool
{
    return lhs.candidateId == rhs.candidateId && lhs.candidateId == rhs.candidateId
}

enum CandidateError : ErrorType
{
    case DuplicateId(Int)
}


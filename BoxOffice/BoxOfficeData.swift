//
//  BoxOfficeData.swift
//  BoxOffice
//
//  Created by nayeon  on 2/14/24.
//

struct BoxOfficeData: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let boxOfficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Decodable {
    let number: String
    let rank: String
    let rankChangeValue: String
    let rankOldAndNew: String
    let movieCode: String
    let movieName: String
    let openingDay: String
    let salesAmount: String
    let salesShare: String
    let salesChanageValue: String
    let salesChangeRate: String
    let salesAccumulation: String
    let audienceCount: String
    let audienceChangeValue: String
    let audienceChangeRate: String
    let audienceAccumulation: String
    let screenCount: String
    let showCount: String
}

// MARK: - Codingkeys
extension BoxOfficeResult {
    private enum CodingKeys: String, CodingKey {
        case boxOfficeType = "boxofficeType"
        case showRange
        case dailyBoxOfficeList
    }
}

extension DailyBoxOfficeList {
    private enum CodingKeys: String, CodingKey {
        case number = "rnum"
        case rank
        case rankChangeValue = "rankInten"
        case rankOldAndNew
        case movieCode = "movieCd"
        case movieName = "movieNm"
        case openingDay = "openDt"
        case salesAmount = "salesAmt"
        case salesShare
        case salesChanageValue = "salesInten"
        case salesChangeRate = "salesChange"
        case salesAccumulation = "salesAcc"
        case audienceCount = "audiCnt"
        case audienceChangeValue = "audiInten"
        case audienceChangeRate = "audiChange"
        case audienceAccumulation = "audiAcc"
        case screenCount = "scrnCnt"
        case showCount = "showCnt"
    }
}
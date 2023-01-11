import Foundation

class SurveyViewModel {
    var surveyArray: [(String, Int)] = [("Ответ 1", 2), ("Ответ 2", 3), ("Ответ 3", 5), ("Ответ 4", 0), ("Ответ 5", 7)]
    
    func addCount(indexPath: Int) {
        let temp = surveyArray[indexPath].1
        surveyArray[indexPath].1 = temp + 1
    }
    
    func getChoisePercents(indexPath: Int) -> Int {
        var temp = 0
        for i in 1..<surveyArray.count {
            temp += surveyArray[i].1
        }
        return (surveyArray[indexPath].1 / temp) * 100
    }
}

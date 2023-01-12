import Foundation

class SurveyViewModel {
    var surveyArray: [(String, Float)] = [("Ответ 1", 2), ("Ответ 2", 3), ("Ответ 3", 5), ("Ответ 4", 0), ("Ответ 5", 7)]
    
    func addCount(indexPath: Int) {
        let temp = surveyArray[indexPath].1
        surveyArray[indexPath].1 = temp + 1
    }
    
    func getChoisePercents(indexPath: Int) -> Float {
        var temp: Float = 0
        for i in 0..<surveyArray.count {
            temp += surveyArray[i].1
        }
        var result = (surveyArray[indexPath].1 / temp) * 100
        return result
    }
}

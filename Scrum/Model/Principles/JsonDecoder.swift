import Foundation

class JsonDecoder {
    
    func parseJson() -> [Principles]? {
        if let fileURL = Bundle.main.url(forResource: "Principles.json", withExtension: nil) {
            let jsonData = try! Data(contentsOf: fileURL)
            do {
                return try! JSONDecoder().decode([Principles].self, from: jsonData)
            }
        }
        return nil
    }
}

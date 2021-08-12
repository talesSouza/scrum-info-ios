import Foundation

class PrinciplesService {
    
    func getPrinciples() -> [Principles]? {
        
        if let fileURL = Bundle.main.url(forResource: "principles.json", withExtension: nil) {
            do {
                let jsonData = try Data(contentsOf: fileURL)
                return try JSONDecoder().decode([Principles].self, from: jsonData)
            } catch {
                print("Error")
            }
        }
        return nil
    }
}

import Foundation
import Alamofire

class Networking {
    
    func createURL(_ query: String) -> URL? {
        let baseUrl = "https://api.api-ninjas.com/v1/nutrition?query="
        if let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            let urlString = baseUrl + encodedQuery
            if let url = URL(string: urlString) {
                return url
            }
        }
        return nil
    }
    
    func fetchData(_ query: String, completion: @escaping (Nutrition?, Error?) -> Void) {
        
        guard let url = createURL(query) else {
            completion(nil, NSError(domain: "NetworkingError", code: 0, userInfo: ["message": "Invalid URL"]))
            return
        }
        
        let apiKey = "PvmCVYETOZAFN9KYsfBWWw==pDf8rcO5S3jD1OnT"
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        AF.request(request).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let nutrition = try decoder.decode([Nutrition].self, from: data)
                    completion(nutrition.first, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

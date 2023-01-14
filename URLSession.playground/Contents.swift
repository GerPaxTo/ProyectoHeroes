import UIKit

let path = "https://jsonplaceholder.typicode.com/todos"

let url = URL(string: path)!
let session = URLSession.shared

var urlRequest = URLRequest(url: url)

let task = session.dataTask(with: urlRequest) { data, response, error in
    guard let newData = data else {return}
    
    let string = String(data: newData, encoding: .utf8)
    //print (string!)
}

task.resume()

struct User: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

let task2 = session.dataTask(with: urlRequest){ data, _, _ in
    guard let newData = data else {return}
    
    let users = try? JSONDecoder().decode([User].self, from: newData)
    
    //print(users?.count ?? -1)
    //print(users?.first?.title ?? "")
    
}
task2.resume()

func fetchData(_ path: String, completion: ((User?, Error?) -> Void)?) {
    guard let url = URL(string: path) else {return}
    
    let urlRequest = URLRequest(url: url)
    let task = session.dataTask(with: urlRequest) {data, _, error in
        guard let newData = data else { return }
        
        let user = try? JSONDecoder().decode(User.self, from: newData)
        
        completion?(user, error)
    }
    task.resume()
}

fetchData("https://jsonplaceholder.typicode.com/todos/10"){ user, error in
    guard let newUser = user else {return}
    
    print (newUser.title)
}

func fetchGenericData<T: Decodable> (_ path: String, completion: ((T?, Error?) -> Void)?){
    guard let url = URL(string: path) else {return}
    
    let urlRequest = URLRequest(url: url)
    let task = session.dataTask(with: urlRequest) {data, _, error in
        guard let newData = data else { return }
        
        let user = try? JSONDecoder().decode(T.self, from: newData)
        
        completion?(user, error)
    }
    task.resume()
}

fetchGenericData("https://jsonplaceholder.typicode.com/todos"){ (users: [User]?, error) in
    guard let allUsers = users else {return}
    
    print (allUsers.last?.title ?? "")
}

fetchGenericData("https://jsonplaceholder.typicode.com/todos/6"){ (user: [User]?, error) in
    guard let newUsers = user else {return}
    
    print (newUsers.title)
}

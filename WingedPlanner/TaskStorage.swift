import Foundation

class TaskStorage {
    static let shared = TaskStorage()
    private let userDefaults = UserDefaults.standard
    private let storageKey = "tasks"
    
    private init() {}
    
    func saveTasks(_ tasks: [TaskModel]) {
        if let encoded = try? JSONEncoder().encode(tasks) {
            userDefaults.set(encoded, forKey: storageKey)
        }
    }
    
    func loadTasks() -> [TaskModel] {
        guard let data = userDefaults.data(forKey: storageKey),
              let tasks = try? JSONDecoder().decode([TaskModel].self, from: data) else {
            return []
        }
        return tasks
    }
}

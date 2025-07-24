import Foundation
import ReactiveSwift

// a3d793880b72dca3657c9fb6c187a302b1c404a185454bca5cf3b3317c89eb3a

enum MyError: Error {
    case pleaseCrash
}

class ViewModel {

    private let action: Action<Void, Bool, NSError>

    private let needsReset = MutableProperty(false)

    init() {
        action = Action<Void, Bool, NSError> { input in
            return SignalProducer(error: MyError.pleaseCrash as NSError)
        }

        needsReset <~ action.errors.map { error in
            if error is URLError {
                return false
            }

            return true
        }
    }

    func activate() {
        action.apply().start()
    }
}

import UIKit
import CallKit

// Uncomment blocks below to test on PHYSICAL DEVICE!


// MARK: - RECIEVE A CALL

class ViewController: UIViewController, CXProviderDelegate {

    override func viewDidLoad() {
       recieveCall()
    }

    func providerDidReset(_ provider: CXProvider) {
        
    }

    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }
    
    private func recieveCall() {
        let provider = CXProvider(configuration: CXProviderConfiguration())
        provider.setDelegate(self, queue: nil)
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "Vasiliy")
        provider.reportNewIncomingCall(with: UUID(), update: update, completion: { error in })
    }

}


// MARK: - SEND A CALL

//class ViewController: UIViewController, CXProviderDelegate {
//
//    override func viewDidLoad() {
//        let provider = CXProvider(configuration: CXProviderConfiguration())
//        provider.setDelegate(self, queue: nil)
//        let controller = CXCallController()
//        let transaction = CXTransaction(action: CXStartCallAction(call: UUID(), handle: CXHandle(type: .generic, value: "Vasiliy")))
//        controller.request(transaction, completion: { error in })
//    }
//
//    func providerDidReset(_ provider: CXProvider) {
//    }
//
//}

// MARK: - CONNECT A CALL

//class ViewController: UIViewController, CXProviderDelegate {
//
//    override func viewDidLoad() {
//        let provider = CXProvider(configuration: CXProviderConfiguration())
//        provider.setDelegate(self, queue: nil)
//        let controller = CXCallController()
//        let transaction = CXTransaction(action: CXStartCallAction(call: UUID(), handle: CXHandle(type: .generic, value: "Pete Za")))
//        controller.request(transaction, completion: { error in })
//
//        DispatchQueue.main.asyncAfter(wallDeadline: DispatchWallTime.now() + 5) {
//            provider.reportOutgoingCall(with: controller.callObserver.calls[0].uuid, connectedAt: nil)
//        }
//    }
//
//    func providerDidReset(_ provider: CXProvider) {
//    }
//
//}

// MARK: - CUSTOMIZING A CALL VIEW
//
//class ViewController: UIViewController, CXProviderDelegate {
//
//    override func viewDidLoad() {
//        let config = CXProviderConfiguration()
//        config.ringtoneSound = "ringtone.caf"
//        config.includesCallsInRecents = false;
//        config.supportsVideo = true;
//        let provider = CXProvider(configuration: config)
//        provider.setDelegate(self, queue: nil)
//        let update = CXCallUpdate()
//        update.remoteHandle = CXHandle(type: .generic, value: "Vasiliy")
//        update.hasVideo = true
//        provider.reportNewIncomingCall(with: UUID(), update: update, completion: { error in })
//    }
//
//    func providerDidReset(_ provider: CXProvider) {
//    }
//
//    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
//        action.fulfill()
//    }
//
//    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
//        action.fulfill()
//    }
//
//}

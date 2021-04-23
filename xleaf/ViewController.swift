import Cocoa

class ViewController: NSViewController {
    var manager = VPNManager.shared()
    
    @IBOutlet weak var connectSwitch: NSSwitch!
    
    @IBAction func toggle(_ sender: Any) {
        manager.enableVPNManager() { error in
            guard error == nil else {
                fatalError("enable VPN failed: \(error.debugDescription)")
            }
            self.manager.toggleVPNConnection() { error in
                guard error == nil else {
                    fatalError("toggle VPN connection failed: \(error.debugDescription)")
                }
            }
        }
    }
    
    @objc func updateStatus() {
        if (manager.manager.connection.status != .disconnected &&
                manager.manager.connection.status != .disconnecting &&
                manager.manager.connection.status != .invalid) {
            connectSwitch.state = .on
        } else {
            connectSwitch.state = .off
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.loadVPNPreference() { error in
            guard error == nil else {
                fatalError("load VPN preference failed: \(error.debugDescription)")
            }
            self.updateStatus()
            NotificationCenter.default.addObserver(self, selector: #selector(self.updateStatus), name: NSNotification.Name.NEVPNStatusDidChange, object: self.manager.manager.connection)
        }    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NEVPNStatusDidChange, object: self.manager.manager.connection)
    }
    
}


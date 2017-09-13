//
//  SocketService.swift
//  smack
//
//  Created by Alex Villacres on 9/13/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    // Function to send a new channel to the API
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        // The actual event that sends the newChannel to the API "emit"
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        // Socket.on is listening for an evnet of type channelCreated | we receive a dataArray back from the event
        socket.on("channelCreated") { (dataArray, ack) in
            // Parse throught the data array and assign the data to variables that we insert into a new channel
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDescription = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            // create the new channel object (with our Channel.swift struct)
            let newChannel = Channel(id: channelId, channelTitle: channelName, channelDescription: channelDescription)
            // Append the newChannel into our MessageService array of channels
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    
    
    
    
    
    
    
}

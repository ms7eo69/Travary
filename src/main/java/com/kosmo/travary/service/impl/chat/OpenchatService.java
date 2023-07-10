package com.kosmo.travary.service.impl.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kosmo.travary.component.WebSocketServer;

@Service
public class OpenchatService implements IOpenchatService {

    private final WebSocketServer webSocketServer;

    @Autowired
    public OpenchatService(WebSocketServer webSocketServer) {
        this.webSocketServer = webSocketServer;
    }

    @Override
    public void createWebSocketServer(WebSocketSession session) {
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}


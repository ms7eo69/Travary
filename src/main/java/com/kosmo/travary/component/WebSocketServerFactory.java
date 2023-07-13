package com.kosmo.travary.component;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class WebSocketServerFactory {
    public WebSocketServer createWebSocketServer() {
        return new WebSocketServer();
    }
}

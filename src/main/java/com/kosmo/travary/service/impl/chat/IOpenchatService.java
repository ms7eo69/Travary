package com.kosmo.travary.service.impl.chat;

import org.springframework.web.socket.WebSocketSession;

public interface IOpenchatService {
	
	public void createWebSocketServer(WebSocketSession session);
	
	
}

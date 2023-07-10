package com.kosmo.travary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.WebSocketSession;

import com.kosmo.travary.component.WebSocketServer;
import com.kosmo.travary.service.impl.chat.OpenchatService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/chat")
public class ChatController {

    private final WebSocketServer webSocketServer;

    @Autowired
    public ChatController(OpenchatService openchatService, WebSocketServer customWebSocketHandler) {
        this.webSocketServer = customWebSocketHandler;
    }
    
    @GetMapping("openChatList")
    public String chatList(HttpServletRequest request) {
    	
    	return "community/OpenChat";
    }
    
    @GetMapping("/createOpenChat")
    public String openChat(HttpServletRequest request) {
        
        return "community/chatRoom";
    }
}

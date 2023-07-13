package com.kosmo.travary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.travary.component.WebSocketServer;
import com.kosmo.travary.component.WebSocketServerFactory;
import com.kosmo.travary.service.impl.chat.OpenchatService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/chat")
public class ChatController {

    private final OpenchatService openchatService;
    private final WebSocketServerFactory webSocketServerFactory;
    private final WebSocketServer webSocketServe;

    @Autowired
    public ChatController(OpenchatService openchatService, WebSocketServerFactory webSocketServerFactory, WebSocketServer webSocketServe) {
        this.openchatService = openchatService;
        this.webSocketServerFactory = webSocketServerFactory;
        this.webSocketServe = webSocketServe;
    }

    @GetMapping("/enterChatList")
    public String openChat(HttpServletRequest request, Model model) {
        String roomId = openchatService.generateChatRoomId();
        //System.out.println("controller roomId"+roomId);
        String chatRoomUrl = "/chat/enterChatRoom?roomId=" + roomId;
        model.addAttribute("chatRoomUrl", chatRoomUrl);
        return "community/ChatList";
    }

    @GetMapping("/enterChatRoom")
    public String enterChatRoom(@RequestParam("roomId") String roomId, Model model) {
    	String myIp = webSocketServe.getIp();
        System.out.println("들어오니? " + myIp);
        model.addAttribute("roomId", roomId);
        model.addAttribute("myIp", myIp);
        WebSocketServer webSocketServer = webSocketServerFactory.createWebSocketServer();
        // TODO: 생성된 WebSocketServer 인스턴스를 사용하여 채팅방 관련 로직 구현
        return "community/ChatRoom";
    }
}

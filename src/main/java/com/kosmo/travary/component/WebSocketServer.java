package com.kosmo.travary.component;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//웹소켓 서버
@Component
public class WebSocketServer extends TextWebSocketHandler {
	//접속한 클라이언트를 저장하기 위한 속성(멤버변수)]
	//키는 웹소켓 세션 아이디
	private Map<String, WebSocketSession> clients = new HashMap<>();

	//클라이언트와 연결이 되었을때 호출되는 콜백 메소드]
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//-컬렉션에 연결된 클라이언트 추가
		clients.put(session.getId(), session);
		System.out.println(session.getId()+"연결 되었습니다");
	}
	//클라이언트로 부터 메시지를 받았을때 자동 호출되는 콜백 메소드]
	//여기서 클라이언트로 메시지도 보냄(푸쉬)
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	    System.out.println(session.getId() + "로부터 받은 메시지: " + message.getPayload());

	    String payload = message.getPayload();
	    if (payload.startsWith("DM:")) {
	        // DM 메시지인 경우
	        String[] parts = payload.split(":");
	        String recipientId = parts[1]; // 수신자의 아이디
	        String dmContent = parts[2]; // DM 내용

	        // 수신자에게만 DM 메시지 전송
	        WebSocketSession recipientSession = clients.get(recipientId);
	        if (recipientSession != null) {
	            recipientSession.sendMessage(new TextMessage("DM from " + session.getId() + ": " + dmContent));
	        }
	    } else {
	        // 일반 메시지인 경우 접속한 모든 클라이언트에게 전송
	        for (WebSocketSession client : clients.values()) {
	            if (!session.getId().equals(client.getId())) {
	                client.sendMessage(message);
	            }
	        }
	    }
	}

	//클라이언트와 통신장애시 자동으로 호출되는 메소드]
	@Override
	public void handleTransportError(WebSocketSession session, Throwable e) throws Exception {
		System.out.println(session.getId()+"와 통신장애 발생:"+e.getMessage());
	}
	
	//클라이언트와 연결이 끊어졌을때 호출되는 콜백 메소드]
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//-컬렉션에 저장된 클라이언트 삭제
		clients.remove(session.getId());
		System.out.println(session.getId()+"연결이 끊어졌어요");
	}
	
	
}
	

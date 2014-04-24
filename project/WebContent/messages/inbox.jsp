<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Messages</title>
<link rel="stylesheet" type="text/css" href="js/loopj-jquery-tokeninput/styles/token-input.css" />
<link rel="stylesheet" type="text/css" href="js/loopj-jquery-tokeninput/styles/token-input-facebook.css" />
<link rel="stylesheet" type="text/css" href="messages/messages.css" />
</head>
<body>
	<div id="container-div">
	
		<div id="left-div">
			
			<!-- Inbox header -->
			<div id="inbox-header-div">
				<span id="inbox-heading-span">Inbox</span>
			</div>
			
			<!-- Conversations -->
			<div id="conversations-div">
				<s:iterator value="conversations">
					<div class="conversation-div">
						<input type=hidden value='<s:property value="id" />' />
						<div class="conversation-photo-div">
							<img width="50" height="50" src="image?userId=<s:property value="otherParticipants.get(0).userId" />" />
						</div>
						<div class="conversation-details-div">
							<div class="conversation-participants-div">
									<s:iterator value="otherParticipants">
											<s:property value="firstName" /> 
											<s:property value="lastName" />
											, 
									</s:iterator>
									<s:if test="%{unreadMessagesCount > 0}">
										(<s:property value="unreadMessagesCount" />)
									</s:if>
							</div>
							<div class="conversation-date-div">								
									<s:property value="latestMessage.sentAt" />
							</div>	
							<div class="conversation-text-div">
								<s:property value="latestMessage.text" />
								<input type="hidden" value='<s:property value="id"/>' />
							</div>
						</div>	
					</div>
				</s:iterator>
			</div>
			
		</div>


		<div id="right-div">
		
			<!-- Selected conversation header -->
			<div id="selected-conversation-thread-header-div">
				<div id="other-participants-div">
					No conversation selected
				</div>
				<div id="action-buttons-div">
					<input type="button" id="new-message-button" value="+ New Message"/>
				</div>
			</div>
			
		</div>
	
	</div>
	<script src="messages/divRenderers.js"></script>
	<script src="messages/onConversationThreadClick.js"></script>
	<script src="messages/onCreateNewMessage.js"></script>
	<script src="messages/onReplySubmit.js"></script>
	<script src="messages/onSendNewMessage.js"></script>
	<script src="messages/onDeleteConversation.js"></script>
	<script src="messages/onDeleteMessage.js"></script>
	<script src="js/loopj-jquery-tokeninput/src/jquery.tokeninput.js"></script>
	<script src="js/jquery.timeago.js" type="text/javascript"></script>
</body>
</html>
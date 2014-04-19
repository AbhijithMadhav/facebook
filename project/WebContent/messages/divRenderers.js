/**
 * Object literals used for rendering
 */

var selectedConversationThreadHeaderDiv = {
		firstName : "",
		lastName : "",
		
		init : function(userName) {
			selectedConversationThreadHeaderDiv.firstName = userName.firstName;
			selectedConversationThreadHeaderDiv.lastName = userName.lastName;
		},
		
		get : function() {
			var div = '<div id="selectedConversationThreadHeader" class="selected-conversation-thread-header">\
							<div class="conversation-with">'
							+ selectedConversationThreadHeaderDiv.firstName + ' ' + selectedConversationThreadHeaderDiv.lastName + 
							'</div>\
							<div class="new-message-button">\
								<div>\
									<input class="new-message-button" type="submit" value="+ New Message" />\
								</div>\
							</div>\
						</div>';
			
			return div;
		}
};

var selectedConversationThreadDiv = {
		conversationThread : [],
		
		init : function(conversationThread) {
			selectedConversationThreadDiv.conversationThread = conversationThread;
		},
		
		get : function() {
			var div = '<div id="selectedConversationThread" class="selected-conversation-thread"> ';
			$.each(selectedConversationThreadDiv.conversationThread, function(index, message) {
				messageDiv.init(message);
				div += messageDiv.get();
			});
			div += '</div>';
			return div;
		}
};

var messageDiv = {
	message : "",
	
	init: function(message) {
		messageDiv.message = message;
	},

	get : function() {
		var div = '<div class="message"> \
						<div class="message-photo"> \
							<a href="profile?fref=' + messageDiv.message.sender + '">\
								<img width="32" height="32"	src="image?userId='	+ messageDiv.message.sender + '" /> \
							</a>\
						</div> \
						<div class="message-header"> \
							<strong> \
								<a href="profile?fref=' + messageDiv.message.sender + '">' + messageDiv.message.senderFirstName	+ ' ' + messageDiv.message.senderLastName + '</a>' + 
							'</strong>\
							<span class="message-header-date">' 
								+ messageDiv.message.sentAt +
							'</span>\
						</div> \
						<div class="message-text">'
							+ messageDiv.message.text	+ '\
						</div> \
					</div>';
		return div;
	}
};

var replyBoxDiv = {
		
		to : 0,
		
		init : function(to) {
			replyBoxDiv.to = to;
		},
		
		get : function() {
			var div = 
			'<div id="replyBox" class="reply-box">\
				<form id="replyForm" action="reply">\
					<textarea id="reply" name="replyMsg.text" cols="96" rows="5" placeholder="Write a reply..." />\
					<input type="hidden" id="replyMsg_recipient" name="replyMsg.recipient" value="' + replyBoxDiv.to + '" />\
					<input class="reply-button" type="submit" value="Reply" />\
				</form>\
			</div>';
			return div;
		}
};

var latestConversationDiv = {
		latestConversation : {},
		
		init : function(latestConversation) {
			latestConversationDiv.latestConversation = latestConversation; 
		},
		
		get : function() {
			var div
				= '<div class="latest-conversation">\
					<a class="latest-conversation-link" href="selectedConversationThread.action?otherUser=' + latestConversationDiv.latestConversation.otherUser + '"></a>\
						<div class="latest-conversation-photo">\
								<img width="50" height="50" src="image?userId='  + latestConversationDiv.latestConversation.otherUser + '"/>\
						</div>\
						<div class="latest-conversation-header">\
							<strong>'
								+ latestConversationDiv.latestConversation.otherUserFirstName + ' ' + latestConversationDiv.latestConversation.otherUserLastName + 
							'</strong>\
							<span class="latest-conversation-header-date">'
								+ latestConversationDiv.latestConversation.sentAt +
							'</span>\
						</div>\
						<div class="latest-conversation-text">'
							+ latestConversationDiv.latestConversation.latestMessage + 
						'</div>\
				   </div>';
			return div;
		}
};

var latestConversationsDiv = {
		latestConversations : {},
		
		init : function(latestConversations) {
			latestConversationsDiv.latestConversations = latestConversations;
		},
		
		get : function() {
			var div = '<div id="latestConversations" class="latest-conversations">';
			$.each(latestConversationsDiv.latestConversations, function(index, latestConversation) {
				latestConversationDiv.init(latestConversation);
				div	+= latestConversationDiv.get();
			});
			div += '</div>';
			return div;
		}
};

var toFieldSearchResultsFormatterDiv = {
		friend : {},
		
		init : function(friend) {
			toFieldSearchResultsFormatterDiv.friend = friend;
		},
		
		get : function() {
			var div = "<li>" + toFieldSearchResultsFormatterDiv.friend.firstName + " " + toFieldSearchResultsFormatterDiv.friend.lastName + " " + toFieldSearchResultsFormatterDiv.friend.id + "</li>";
			return div;
		}
};

var tokenFormatterDiv = {
		name : {},
		
		init : function(name) {
			tokenFormatterDiv = name;
		},
		
		get : function() {
			var div = "<li><strong>" + tokenFormatterDiv.name.firstName + " " + tokenFormatterDiv.name.lastName + "</strong></li>";
			return div;
		}
};
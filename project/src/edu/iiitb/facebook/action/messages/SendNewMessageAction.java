package edu.iiitb.facebook.action.messages;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import edu.iiitb.facebook.action.dao.MessageDAO;
import edu.iiitb.facebook.action.dao.impl.MessageDAOImpl;
import edu.iiitb.facebook.action.model.Conversation;
import edu.iiitb.facebook.action.model.Message;
import edu.iiitb.facebook.action.model.User;
import edu.iiitb.facebook.util.Constants;

public class SendNewMessageAction extends ActionSupport implements SessionAware
{
	private static final long serialVersionUID = -1229947406728255002L;

	private Map<String, Object> session;
	private Message newMessage;
	private String recipients;

	private List<Message> selectedConversationThread;
	private List<Conversation> conversations;
	private Conversation selectedConversation;

	public String send()
	{
		MessageDAO dao = new MessageDAOImpl();

		// preprocessing
		User user = (User) session.get(Constants.USER);
		List<Integer> participants = new LinkedList<Integer>();
		participants.add(user.getUserId());
		for (String recipient : recipients.split(","))
			participants.add(Integer.parseInt(recipient));
		
		/* insert into db */
		
		// message id is generated by the db
		// message  text is set by the view
		// sentAt is generated by the db
		// inbox is set by dao while inserting for all participants
		// readStatus is set by dao while inserting for all participants
		newMessage.setSender(user.getUserId());
		newMessage.setSenderFirstName(user.getFirstName());
		newMessage.setSenderLastName(user.getLastName());
		// TODO: New conversation should not be created if the conversation is between only two users and they already have a conversation thread running
		int cid = dao.insertIntoNewConversation(newMessage, participants);

		// post processing
		
		newMessage.setConversation(cid);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
	    newMessage.setSentAt(sdf.format(new Date()));
	    
		conversations = dao.getConversations(user.getUserId());

		selectedConversation = new Conversation();
		selectedConversation.setId(cid);
		selectedConversation.setLatestMessage(newMessage);
		selectedConversation.setUnreadMessagesCount(0);//TODO
		selectedConversation.setOtherParticipants(dao.getOtherParticipants(cid, user.getUserId()));
		selectedConversation.setAllFriends(true);
		// don't need logged in user

		// set selected conversation thread
		selectedConversationThread = dao.getConversationThread(user.getUserId(), cid);

		return SUCCESS;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.struts2.interceptor.SessionAware#setSession(java.util.Map)
	 */
	@Override
	public void setSession(Map<String, Object> arg0)
	{
		this.session = arg0;
	}

	public Message getNewMessage()
	{
		return newMessage;
	}

	public void setNewMessage(Message newMessage)
	{
		this.newMessage = newMessage;
	}

	public List<Message> getSelectedConversationThread()
	{
		return selectedConversationThread;
	}

	public void setSelectedConversationThread(
			List<Message> selectedConversationThread)
	{
		this.selectedConversationThread = selectedConversationThread;
	}

	public List<Conversation> getConversations()
	{
		return conversations;
	}

	public void setConversations(
			List<Conversation> conversations)
	{
		this.conversations = conversations;
	}

	public Conversation getSelectedConversation()
	{
		return selectedConversation;
	}

	public void setSelectedConversation(
			Conversation selectedConversation)
	{
		this.selectedConversation = selectedConversation;
	}

	public String getRecipients()
	{
		return recipients;
	}

	public void setRecipients(String recipients)
	{
		this.recipients = recipients;
	}

}

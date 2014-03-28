package edu.iiitb.facebook.action.dao;

import java.util.List;

import edu.iiitb.facebook.action.model.FriendInfo;
import edu.iiitb.facebook.action.model.User;

public interface FriendsDAO
{

	String ID = "id";
	String REQUEST_STATUS = "request_status"; // enum('pending','accepted')
	String BLOCKED_STATUS = "blocked_status"; // enum('blocked','unblocked')
	String REQUEST_BY = "request_by";
	String REQUEST_FOR = "request_for";
	String FRIEND_REQUEST_SENT = "friend_request_sent";
	String FRIEND_REQUEST_ACCEPTED = "friend_request_accepted";

	public FriendInfo getFriendRequestStatus(int loggedInUserId, int otherUserId);

	public List<User> getFriendsList(int userId);

}
package edu.iiitb.facebook.action.event;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import edu.iiitb.facebook.action.dao.EventDAO;
import edu.iiitb.facebook.action.dao.impl.EventDAOImpl;
import edu.iiitb.facebook.action.model.Event;
import edu.iiitb.facebook.action.model.User;
import edu.iiitb.facebook.util.ConnectionPool;

@Namespace("/default")
@ResultPath("/")
@ParentPackage("tiles-default")
public class CreateEventAction extends ActionSupport
{
	private String eventId;
	private String eventName;
	private String eventDescription;
	private String eventPlace;
	private String eventDate;
	private String eventTime;
	private String going="0";
	private String maybe="0";
	private String invited="0";
	
	private User user;
	
	@Action
	(
		value="/createEvent",
		results=
		{
			@Result(name="success", type="tiles", location="eventPage.tiles"),
			@Result(name="login", location="/index.jsp")
		}
	)
	public String execute() throws SQLException
	{
		/////////replace with user from session
		user=new User();
		user.setUserId(3);
		user.setFirstName("Dnyanesh");
		user.setEmail("dnyanesh@dnyanesh.com");
		///////////////////////////////////////
		
		
		if(user==null)
			return LOGIN;
		
		Connection cn=ConnectionPool.getConnection();
		
		EventDAO eventDAO=new EventDAOImpl();
		Event e=new Event(eventName, eventDescription, eventPlace, eventDate, eventTime);
		eventId=((Integer)eventDAO.createEvent(cn, user.getUserId(), e)).toString();
		
		ConnectionPool.freeConnection(cn);
		return SUCCESS;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public String getEventPlace() {
		return eventPlace;
	}

	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventTime() {
		return eventTime;
	}

	public void setEventTime(String eventTime) {
		this.eventTime = eventTime;
	}
	
	public User getUser() {
		return this.user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getGoing() {
		return going;
	}

	public void setGoing(String going) {
		this.going = going;
	}

	public String getMaybe() {
		return maybe;
	}

	public void setMaybe(String maybe) {
		this.maybe = maybe;
	}

	public String getInvited() {
		return invited;
	}

	public void setInvited(String invited) {
		this.invited = invited;
	}
}

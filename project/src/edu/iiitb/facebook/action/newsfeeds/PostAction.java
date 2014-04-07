package edu.iiitb.facebook.action.newsfeeds;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import edu.iiitb.facebook.action.dao.PostsDAO;
import edu.iiitb.facebook.action.dao.impl.PostsDAOImpl;
import edu.iiitb.facebook.action.model.NewsFeed;
import edu.iiitb.facebook.action.model.User;

public class PostAction extends ActionSupport implements SessionAware
{
	Map<String, Object> session;

	String value;

	String postId;

	public String getPostId()
	{
		return postId;
	}

	public void setPostId(String postId)
	{
		this.postId = postId;
	}

	public String getValue()
	{
		return value;
	}

	public void setValue(String value)
	{
		this.value = value;
	}

	@Override
	public void setSession(Map<String, Object> arg0)
	{

		this.session = arg0;
	}

	public String execute()
	{
		System.out.println("postid" + postId);

		User user = (User) session.get("user");

		PostsDAO dao = new PostsDAOImpl();

		int result = dao.deletePost(postId);
		if (result > 0)
		{
			setValue("true");
			System.out.println("true");
		}
		else
		{
			setValue("false");
			System.out.println("false");
		}

		return SUCCESS;
	}
}
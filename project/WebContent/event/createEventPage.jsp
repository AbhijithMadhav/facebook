<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create New Event</title>
</head>
<body style="background-color: #c5c5df;">
	<form action="createEvent">
		<table style="margin-left: 25%; margin-top: 150px; width: 50%; border: thin; border-style: solid; background-color: #ffffff;">
			<tbody>
				<tr>
					<td colspan="3" style="background-color: #45619d; color: white; height: 35px;"><b>Create New Event</b></td>
				</tr>
				<tr>
					<td>Name: </td>
					<td colspan="2"><input type="text" name="eventName" style="width: 98%;"></td>
				</tr>
				<tr>
					<td>Description: </td>
					<td colspan="2"><textarea rows="4" name="eventDescription" style="width: 98%;"></textarea></td>
				</tr>
				<tr>
					<td>Where: </td>
					<td colspan="2"><input type="text" name="eventPlace" style="width: 98%;"></td>
				</tr>
				<tr>
					<td>When: </td>
					<td><input type="text" name="eventDate" style="width: 96%;"></td>
					<td><input type="text" name="eventTime" style="width: 96%;"></td>
				</tr>
				<tr>
					<td colspan="3" align="right">
						<input style="background-color: #45619d; color: white;" type="submit" value="Create">
						<a href="displayEvents"><input type="button" value="Cancel"></a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
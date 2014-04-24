<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<sj:head />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About</title>
<link href="css/bootstrap.css" rel="stylesheet">
<style type="text/css" media="screen">
table {
	border: none;
	border-collapse: collapse;
}

td {
	border: none;
}

th {
	border: none;
}

p {
	background-color: #eeeff4;
}

p.padding {
	padding-top: 25px;
	padding-bottom: 25px;
	padding-right: 50px;
	padding-left: 40px;
	border-color: #eeeff4;
}

button.padding {
	float: right;
}

p.padding {
	padding-top: 25px;
	padding-bottom: 25px;
	padding-right: 50px;
	padding-left: 40px;
	border-color: #eeeff4;
}

b.r {
	font-size: 25px;
	padding-right: 800px;
}

div.box1 {
	padding-top: 30px;
	padding-left: 40px;
}

td.a {
	color: blue;
	font-size: 14px;
}

td.b {
	color: grey;
	padding-left: 0px;
	text-align: left;
	font-size: 12px;
}

b.a {
	color: #3b5999;
	font-size: 16px;
}

b.b {
	color: grey;
	padding-left: 0px;
	text-align: left;
	font-size: 14px;
}

b.c {
	color: black;
	padding-left: 0px;
	text-align: left;
	font-size: 12px;
}

td.c {
	color: black;
	padding-left: 0px;
	text-align: left;
	font-size: 12px;
}

th.p {
	padding-bottom: 18px;
	font-size: 20px;
}

td.n {
	padding-left: 4px;
	text-align: left;
}

img.loc {
	height: 80px;
	width: 80px;
}

img.wne {
	height: 40px;
	width: 40px;
}

b.q {
	font-size: 25px;
	padding-right: 800px;
}
</style>
</head>
<body>
	<s:form action="submitabout" method="post">
		<div class="row" style="background-color: #f7f7f7">
			<div class="col-md-1" align="left"></div>
			<div class="col-md-10" align="left" style="background-color: white">
				<div class="padding">
					<table>
						<tr>
							<td><b class="r">Edit Information</b></td>
							<td><s:submit type="button" label="Submit" align="right" />

							</td>
						</tr>
					</table>
				</div>


				<div class="col-md-6" align="left" style="background-color: #FFFFFF">

					<div class="box1">
						<table cellspacing="2" cellpadding="5" border="0"
							bordercolor="white">
							<tr>
								<th class="p" colspan="2">Work and Education</th>
							</tr>
						</table>


						
							<s:textfield placeholder="Where have you worked?" size="50"
								cssStyle="height:35px" name="wrkplace"></s:textfield>
							<br />
							<s:textfield placeholder="What is your role?" size="30"
								cssStyle="height:35px" name="role"></s:textfield>
							<br />
							<sj:datepicker id="1" name="workstartdate"
								displayFormat="dd-mm-yy"
								placeholder="When did you start working?" size="30" />
							<br />
							<sj:datepicker id="2" name="workenddate" displayFormat="dd-mm-yy"
								placeholder="when did you leave?" size="30" />

						

						<br /> <br />
						
							<s:textfield placeholder="Where did you go to college?" size="50"
								cssStyle="height:35px" name="collegename"></s:textfield>
							<br />
							<s:textfield placeholder="What did you study there?" size="30"
								cssStyle="height:35px" name="degree"></s:textfield>
							<br />
							<sj:datepicker id="3" name="collegestartdate"
								displayFormat="dd-mm-yy"
								placeholder="When did you join college?" size="30" />
							<br />
							<sj:datepicker id="4" name="collegeenddate"
								displayFormat="dd-mm-yy"
								placeholder="when did you leave the college?" size="30" />

						
						<br /> <br />
						
							<s:textfield placeholder="Where did you go to high school?"
								size="50" cssStyle="height:35px" name="schoolname"></s:textfield>
							<br />
							<s:textfield placeholder="What did you study there?" size="30"
								cssStyle="height:35px" name="standard"></s:textfield>
							<br />
							<sj:datepicker id="5" name="schoolstartdate"
								displayFormat="dd-mm-yy" placeholder="when did you join school?"
								size="30" />
							<br />
							<sj:datepicker id="6" name="schoolenddate"
								displayFormat="dd-mm-yy"
								placeholder="when did you leave school?" size="30" />

						

						<br /> <br />
						<table>
							<tr>
								<th class="p">Relationship</th>
							</tr>
						</table>
						<h5>
							<b class="q">Add You Relationship</b> &nbsp
							<s:select
								list="#{'Single':'Single', 'Committed':'Committed', 'Married':'Married', 'Divorced':'Divorced', 'Engaged':'Engaged'}"
								name="relationship" value="%{userInfo.relationship}" />
						</h5>

					</div>
				</div>
				<div class="col-md-4" align="left">
					<div class="box1">


						<table>
							<tr>
								<th class="p">Places Lived</th>
							</tr>
							<tr>
						</table>
						<s:textfield name="hometown" size="30" cssStyle="height:35px"
							value="%{userInfo.nativeplace}"></s:textfield>
						<br /> <br />
						<s:textfield name="currentcity" size="30" cssStyle="height:35px"
							value="%{userInfo.place}"></s:textfield>

						<br /> <br />
						<table>
							<tr>
								<th class="p">Basic Information</th>
							</tr>
						</table>
						<b class="q">Birth Date</b> &nbsp
						<sj:datepicker id="7" name="birthday" displayFormat="dd-mm-yy"
							value="%{userInfo.dob}" />

						<br /> <br />
						<h5>
							<b class="q">Gender</b>&nbsp &nbsp &nbsp &nbsp
							<s:select
								list="#{'Male':'Male', 'Female':'Female', 'Other':'Other'}"
								name="gender" value="%{userInfo.gender}" />
						</h5>

					</div>
				</div>
				<div class="col-md-1" align="left"></div>
			</div>
		</div>
	</s:form>


</body>
</html>
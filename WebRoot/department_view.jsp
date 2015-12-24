<%@page import="com.dao.userInfoDAO"%>
<%@page import="com.db.H2Conn"%>
<%@ page language="java" import="java.util.*" import="java.sql.*"
	import="com.model.*" import="com.dao.*" import="net.sf.json.JSONArray" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	String dept = (String)request.getParameter("dept");
	deptInfo deptinfo = null;
	if(null != dept) {
		deptinfo = deptInfoDAO.selectDept(Integer.parseInt(dept));
	} else {
		deptinfo = deptInfoDAO.selectDept(1);
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>禅道年度账单</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/reset.css"/>
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="plugins/nicesrcoll/jquery.js"></script>
<script type="text/javascript" src="plugins/nicesrcoll/jquery.nicescroll.js"></script>
<style type="text/css">
  html{ background:  #0c212a;}
</style>
</head>

<body>
	<!-- head -->
<div class="head clearfix">
    <div class="w1273">
        <h2><a href="####" class="arrow"></a>2015禅道年度账单-部门年度视图 </h2>
        <div class="right">
            <div class="sel sel1">
           	<%
				if(null != deptinfo){
			%>
				<span><%=deptinfo.getName() %></span>
			<%}else{ %>
            	<span>请选择</span>
          	<%} %>
            </div>
            <ul class="namelist">
                <%
					List<deptInfo> dept_list = deptInfoDAO.selectAllDept();
					for (deptInfo d : dept_list) {
				%>
				<li><a href="department_view.jsp?dept=<%=d.getId()%>"><%=d.getName()%></a>
				</li>
				<%
					}
				%>
            </ul>
        </div>
    </div>
</div>
<!-- head end -->

<!-- time wrap -->
<div class="dpwrap">  
    <div class="w1273 clearfix">

      <div class="lfbox">
          <!-- 产品 -->
          <div class="dp_title">产品</div>
          <div class="dp_cont">
            <ul class="dplist clearfix">
            <%
            	List<productInfo> list_product = productInfoDAO.selectAllProduct();
            	for(productInfo pi : list_product) {
            %>
              <li><a href="####"><%=pi.getName()%></a></li>
            <%
            }
            %>
            </ul>
          </div>
          <!-- 产品end -->
          <!-- 分组 -->
          <div class="gpwrap clearfix">
            <div class="group_img"></div>
            <%
            	List<deptInfo> team_list = deptInfoDAO.selectTeam(deptinfo.getId());
				for (int i=0; i<team_list.size(); i++) {
            %>
            <div class="group <%if(i == 0){ %>ml0<%}%>">
              <div class="title"><a href="####"><%=team_list.get(i).getName()%></a></div>
              <div class="cont bg1<%=i%>">
                <span></span>
                <ul class="grouplist clearfix">
                <%
                	List<userInfo> list_user1 = userInfoDAO.selectAllUserByDept(team_list.get(i).getId());
                	for(userInfo user : list_user1) {
                %>
                  <li <%if(user.getRole().equals("po")){ %>class="leader"<%} %>><a href="person.jsp?account=<%=user.getAccount()%>"><%=user.getRealname()%></a></li>
                <%
                  }
                %>
                </ul>
              </div>
            </div>
			<%
			}
			%>
          </div>
          <!-- 分组end -->
      </div>

      <!-- 项目 -->
      <div class="rgbox">
        <div class="dp_title">项目</div>
        <div class="dp_cont1" id="dp_cont1">
          <ul class="dp_nmlist clearfix">
          <%
          	List<projectInfo> list_project = projectInfoDAO.selectAllProject(2015);
          	for(int i=0; i<list_project.size(); i++) {
          %>
            <li>
                <em><%=i+1%></em>
                <a href="project_view.jsp?project=<%=list_project.get(i).getId()%>"><%=list_project.get(i).getName()%></a>
            </li>
          <%
          }
          %>
          </ul>
        </div>
      </div>
      <!-- 项目end -->
    </div>

</div>


<script type="text/javascript">

</script>
</body>
</html>

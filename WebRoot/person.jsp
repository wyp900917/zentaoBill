<%@page import="com.dao.userInfoDAO"%>
<%@page import="com.db.H2Conn"%>
<%@ page language="java" import="java.util.*" import="java.sql.*"
	import="com.model.*" import="com.dao.*" import="net.sf.json.JSONArray" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	String account = (String)request.getParameter("account");
	if(account == null){
		account = "qzfeng";
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
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="plugins/echarts/echarts.js"></script>
<!--echart图表插件-->
<script type="text/javascript" src="js/base.js"></script>
<style type="text/css">
.mr70{ margin-top: 8px;}
</style>
</head>

<body>
	<!-- head -->
	<div class="head clearfix">
		<div class="w1273">
			<h2>
				2015禅道年度账单-个人视图
			</h2>
		</div>
	</div>
	<!-- head end -->
	<!--人员列表-->
<div class="person psbg">
    <div class="w1273 clearfix">

      <div class="right">
        <div class="adwrap mr70">
			<span><%=userInfoDAO.selectUser(account).getRealname() %></span>
        <i class="ico_down"></i>
        </div>
        <ul class="adminlist">
        <%
			List<userInfo> user_list = userInfoDAO.selectAllUser();
			for (userInfo user : user_list) {
		%>
			<li><a href="person.jsp?account=<%=user.getAccount()%>"><%=user.getRealname()%></a>
			</li>
		<%
			}
		%>
            </ul>
            <div class="myphoto">
              <div class="photowrap">
                <img src="images/<%=account%>.png">             
              </div>          
            </div>        
      </div>
    </div>
</div>
<!--人员列表 end-->
	<!-- time wrap -->
	<div class="wrapbg">
		<div class="canvas">
			<canvas id="canvas"
				style="position:absolute;top:0px;left:0px;z-index:0;"></canvas>
		</div>
		<div class="timewrap">
			<div class="w1273 clearfix">
				<div class="tbox ml10">
					<div class="cont">
						<span class="titnum green"><span>1月</span> </span>
						<%
							List<taskConsumedInfo> task_1 = taskPerMonthDAO.selectTopPerMonth(account, "2015-01");
							for(int i=1; i<=task_1.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_1.get(i-1).getTaskname()%>"><%=task_1.get(i-1).getTaskname()%>
						</p>
						<span class="dot"></span>
						<%
							}
						%>
						<span class="dot"></span>
					</div>
				</div>
				<div class="tbox pt76">
					<div class="cont">
						<span class="titnum"><span>3月</span> </span>
						<%
							List<taskConsumedInfo> task_3 = taskPerMonthDAO.selectTopPerMonth(account, "2015-03");
							for(int i=1; i<=task_3.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_3.get(i-1).getTaskname()%>"><%=task_3.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="dot"></span>
					</div>
				</div>
				<div class="tbox pt35">
					<div class="cont">
						<span class="titnum"><span>5月</span> </span>
						<%
							List<taskConsumedInfo> task_5 = taskPerMonthDAO.selectTopPerMonth(account, "2015-05");
							for(int i=1; i<=task_5.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_5.get(i-1).getTaskname()%>"><%=task_5.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="dot"></span>
					</div>
				</div>
				<div class="tbox pt68">
					<div class="cont">
						<span class="titnum green"><span>7月</span> </span>
						<%
							List<taskConsumedInfo> task_7 = taskPerMonthDAO.selectTopPerMonth(account, "2015-07");
							for(int i=1; i<=task_7.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_7.get(i-1).getTaskname()%>"><%=task_7.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="dot"></span>
					</div>
				</div>
				<div class="tbox pt64">
					<div class="cont">
						<span class="titnum"><span>9月</span> </span>
						<%
							List<taskConsumedInfo> task_9 = taskPerMonthDAO.selectTopPerMonth(account, "2015-09");
							for(int i=1; i<=task_9.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_9.get(i-1).getTaskname()%>"><%=task_9.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="dot"></span>
					</div>
				</div>
				<div class="tbox pt30">
					<div class="cont">
						<span class="titnum"><span>11月</span> </span>
						<%
							List<taskConsumedInfo> task_11 = taskPerMonthDAO.selectTopPerMonth(account, "2015-11");
							for(int i=1; i<=task_11.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_11.get(i-1).getTaskname()%>"><%=task_11.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="dot"></span>
					</div>
				</div>
				<div class="tmbox">
					<div class="cont">
						<span class="dot"></span>
						<%
							List<taskConsumedInfo> task_2 = taskPerMonthDAO.selectTopPerMonth(account, "2015-02");
							for(int i=1; i<=task_2.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_2.get(i-1).getTaskname()%>"><%=task_2.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="titnum"><span>2月</span> </span>
					</div>
				</div>
				<div class="tmbox lt2">
					<div class="cont">
						<span class="dot"></span>
						<%
							List<taskConsumedInfo> task_4 = taskPerMonthDAO.selectTopPerMonth(account, "2015-04");
							for(int i=1; i<=task_4.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_4.get(i-1).getTaskname()%>"><%=task_4.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="titnum orange"><span>4月</span> </span>
					</div>
				</div>
				<div class="tmbox lt3">
					<div class="cont">
						<span class="dot"></span>
						<%
							List<taskConsumedInfo> task_6 = taskPerMonthDAO.selectTopPerMonth(account, "2015-06");
							for(int i=1; i<=task_6.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_6.get(i-1).getTaskname()%>"><%=task_6.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="titnum"><span>6月</span> </span>
					</div>
				</div>
				<div class="tmbox lt4">
					<div class="cont">
						<span class="dot"></span>
						<%
							List<taskConsumedInfo> task_8 = taskPerMonthDAO.selectTopPerMonth(account, "2015-08");
							for(int i=1; i<=task_8.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_8.get(i-1).getTaskname()%>"><%=task_8.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="titnum"><span>8月</span> </span>
					</div>
				</div>
				<div class="tmbox lt5">
					<div class="cont">
						<span class="dot"></span>
						<%
							List<taskConsumedInfo> task_10 = taskPerMonthDAO.selectTopPerMonth(account, "2015-10");
							for(int i=1; i<=task_10.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_10.get(i-1).getTaskname()%>"><%=task_10.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
						<span class="titnum orange"><span>10月</span> </span>
					</div>
				</div>
				<div class="month12">
					<div class="cont">
						<span class="dot"></span> <span class="titnum"><span>12月</span>
						</span>
					</div>
					<div class="txt">
						<%
							List<taskConsumedInfo> task_12 = taskPerMonthDAO.selectTopPerMonth(account, "2015-12");
							for(int i=1; i<=task_12.size()&&i<4; i++) {
						%>
						<p class="mstxt" title="<%=task_12.get(i-1).getTaskname()%>"><%=task_12.get(i-1).getTaskname()%>
						</p>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- time wrap end -->

	<!-- 三模块 -->
	<div class="midwrap">
		<div class="w1273 clearfix">
			<div class="midbox">
				<div class="midtitle">项目投入Top 5</div>
				<div class="cont">
					<ul class="toplist clearfix">
						<%
							List<projectConsumeInfo> project_info = projectPerYearDAO.selectTopPerYear(account, "2015");
							for(int i=1; i<=project_info.size()&&i<6; i++) {
						%>
						<li><em><%=i%></em>
							<h3><a href="project_view.jsp?project=<%=project_info.get(i-1).getProjectid()%>"><%=project_info.get(i-1).getProjectname()%></a></h3>
							<p>
								最长工时任务：<%=project_info.get(i-1).getLongtaskname()%>:<%=project_info.get(i-1).getTaskconsume()%></p>
							<span><%=project_info.get(i-1).getConsume()%></span>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="midbox mlr16">
				<div class="midtitle">任务投入Top 5</div>
				<div class="cont">
					<ul class="toplist clearfix">
						<%
							List<taskDateInfo> taskdate_list = taskPerYearDAO.selectTopPerYear(account, "2015");
							for(int i=1; i<=taskdate_list.size()&&i<6; i++) {
						%>
						<li><em><%=i%></em>
							<h3><%=taskdate_list.get(i-1).getTaskname()%>:<%=taskdate_list.get(i-1).getStatus()%></h3>
							<p>
								开始：<%=taskdate_list.get(i-1).getStartdate()%>
								结束：<%=taskdate_list.get(i-1).getFinishdate()%></p> <span><%=taskdate_list.get(i-1).getConsume()%></span>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="midbox w425">
				<div class="midtitle">任务类别比</div>
				<div class="cont">
					<div id="main" style=" height: 280px;"></div>
					<div class="legend">
						<ul>
						<%
							List<taskTypeInfo> tasktype_list = taskTypeInfoDAO.selectTaskType(account, "2015");
							request.setAttribute("list", JSONArray.fromObject(tasktype_list).toString());
							for(taskTypeInfo tti : tasktype_list) {
						%>
							<li><%=tti.getName() %><span><%=tti.getValue()%>%</span></li>
						<%
							}
						%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 三模块end -->

	<script type="text/javascript">
		var myChart = '';
		require.config({
			paths : {
				echarts : 'plugins/echarts'
			}
		});

		require([ 'echarts', 'echarts/chart/pie' ],

		function(ec) {
			//饼状图
			myChart = ec.init(document.getElementById('main'));
			option = {
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b} : {c} ({d}%)"
				},
				calculable : false,
				series : [ {
					name : '访问来源',
					type : 'pie',
					radius : '65%',
					center : [ '42%', '52%' ],
					itemStyle : {
						normal : {
							borderWidth : 0
						}
					},
					data : <%=request.getAttribute("list")%>
				} ]
			};
			myChart.setOption(option);
		});
	</script>
</body>
</html>

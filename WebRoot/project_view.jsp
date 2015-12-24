<%@page import="com.dao.userInfoDAO"%>
<%@page import="com.db.H2Conn"%>
<%@ page language="java" import="java.util.*" import="java.sql.*"
	import="com.model.*" import="com.dao.*" import="net.sf.json.JSONArray" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	String project = (String)request.getParameter("project");
	projectInfo projectinfo = null;
	if(null != project) {
		projectinfo = projectInfoDAO.selectProject(Integer.parseInt(project));
	} else {
		projectinfo = projectInfoDAO.selectProject(3);
	}
		
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>项目视图</title>
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
<!--[if IE]>
<script type="text/javascript" src="js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript" src="js/base.js"></script>
</head>

<body>
	<!-- head -->
<div class="head clearfix">
    <div class="w1273">
        <h2><a href="####" class="arrow"></a>2015禅道年度账单-项目视图 </h2>
    </div>
</div>
<!-- head end -->
<div class="person">
    <div class="w1273 clearfix">
      <div class="left">
        <div class="sel">
        <%
			if(null != projectinfo){
		%>
			<span><%=projectinfo.getName() %></span>
		<%}else{ %>
            <span>请选择</span>
        <%} %>
        </div>
        <ul class="namelist w200 pro">
            <%
				List<projectInfo> project_list = projectInfoDAO.selectAllProject(2015);
				for (projectInfo pro : project_list) {
			%>
			<li><a href="project_view.jsp?project=<%=pro.getId()%>"><%=pro.getName()%></a>
			</li>
			<%
				}
			%>
        </ul>
      </div>
      <div class="right">
        <span class="ing"><%=projectinfo.getStatus()%></span>
        <div class="itm">开始时间:<span><%=projectinfo.getBegin()%></span></div>
        <div class="itm">结束时间:<span><%=projectinfo.getEnd()%></span></div>
        <span class="admin mr70"><%if(projectinfo.getPm()==""){%>无人<%}else{%><%=projectinfo.getPm()%><%}%></span>
        <div class="myphoto">
          <div class="photowrap">
          <%
          	String account = userInfoDAO.selectUserByname(projectinfo.getPm());
          	if(account == null){
          %>
            <img src="images/male.png"> 
          <%
          	} else {
          %> 
       	    <img src="images/<%=account%>.png">     
          <%
          	}
          %>    
          </div>          
        </div>        
      </div>
    </div>
</div>
<!-- time wrap -->
<div class="wrapbg h420"> 
    <div class="canvas">
        <canvas id="canvas" style="position:absolute;top:0px;left:0px;z-index:0;"></canvas>
    </div>
    <div class="timewrap">
        <div class="w1273 clearfix">
            <div class="tbox ml10">
                <div class="cont"> 
                    <span class="titnum green"><span>1月</span></span>
                    <%
                    	List<taskConsumedInfo> list1 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-01");
                    	for(int i=0; i<list1.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list1.get(i).getTaskname()%>"><%=list1.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="dot"></span>
                </div>
            </div>
            <div class="tbox pt76">
                <div class="cont"> 
                    <span class="titnum"><span>3月</span></span>
                    <%
                    	List<taskConsumedInfo> list3 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-03");
                    	for(int i=0; i<list3.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list3.get(i).getTaskname()%>"><%=list3.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="dot"></span>
                </div>
            </div>
            <div class="tbox pt35">
                <div class="cont"> 
                    <span class="titnum"><span>5月</span></span>
                    <%
                    	List<taskConsumedInfo> list5 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-05");
                    	for(int i=0; i<list5.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list5.get(i).getTaskname()%>"><%=list5.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="dot"></span>
                </div>
            </div>
            <div class="tbox pt68">
                <div class="cont"> 
                    <span class="titnum green"><span>7月</span></span>
                    <%
                    	List<taskConsumedInfo> list7 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-07");
                    	for(int i=0; i<list7.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list7.get(i).getTaskname()%>"><%=list7.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="dot"></span>
                </div>
            </div>
            <div class="tbox pt64">
                <div class="cont"> 
                    <span class="titnum"><span>9月</span></span>
                    <%
                    	List<taskConsumedInfo> list9 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-09");
                    	for(int i=0; i<list9.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list9.get(i).getTaskname()%>"><%=list9.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="dot"></span>
                </div>
            </div>
            <div class="tbox pt30">
                <div class="cont"> 
                    <span class="titnum"><span>11月</span></span>
                    <%
                    	List<taskConsumedInfo> list11 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-11");
                    	for(int i=0; i<list11.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list11.get(i).getTaskname()%>"><%=list11.get(i).getTaskname()%></p>
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
                    	List<taskConsumedInfo> list2 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-02");
                    	for(int i=0; i<list2.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list2.get(i).getTaskname()%>"><%=list2.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="titnum"><span>2月</span></span>
                </div>
            </div>
            <div class="tmbox lt2">
                <div class="cont"> 
                    <span class="dot"></span>
                    <%
                    	List<taskConsumedInfo> list4 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-04");
                    	for(int i=0; i<list4.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list4.get(i).getTaskname()%>"><%=list4.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="titnum orange"><span>4月</span></span>
                </div>
            </div>
            <div class="tmbox lt3">
                <div class="cont"> 
                    <span class="dot"></span>
                    <%
                    	List<taskConsumedInfo> list6 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-06");
                    	for(int i=0; i<list6.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list6.get(i).getTaskname()%>"><%=list6.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="titnum"><span>6月</span></span>
                </div>
            </div>
            <div class="tmbox lt4">
                <div class="cont"> 
                    <span class="dot"></span>
                    <%
                    	List<taskConsumedInfo> list8 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-08");
                    	for(int i=0; i<list8.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list8.get(i).getTaskname()%>"><%=list8.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="titnum"><span>8月</span></span>
                </div>
            </div>
            <div class="tmbox lt5">
                <div class="cont"> 
                    <span class="dot"></span>
                    <%
                    	List<taskConsumedInfo> list10 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-10");
                    	for(int i=0; i<list10.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list10.get(i).getTaskname()%>"><%=list10.get(i).getTaskname()%></p>
                    <%
                    }
                    %>
                    <span class="titnum orange"><span>10月</span></span>
                </div>
            </div>
            <div class="month12">
                <div class="cont"> 
                    <span class="dot"></span>
                    <span class="titnum"><span>12月</span></span>
                </div>
                <div class="txt">
                    <%
                    	List<taskConsumedInfo> list12 = taskPerMonthDAO.selectTop3PerMonth(projectinfo.getId(), "2015-12");
                    	for(int i=0; i<list12.size()&&i<3; i++) {
                    %>
                    <p class="mstxt" title="<%=list12.get(i).getTaskname()%>"><%=list12.get(i).getTaskname()%></p>
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
            <div class="midtitle">个人投入Top 5</div>
            <div class="cont">
                <ul class="toplist lmg clearfix">
                    <%
                    	List<projectConsumeInfo> top5user_list = projectPerYearDAO.selectTop5Consumed(projectinfo.getId());
                    	for(int i=0; i<top5user_list.size()&&i<5; i++) {
                    		userInfo user = userInfoDAO.selectUser(top5user_list.get(i).getAccount());
                    		String name = user==null?"查无此人":user.getRealname();
                    %>
                    <li>
                        <em><img src="images/<%=top5user_list.get(i).getAccount()%>.png"></em>                        
                        <h3><a href="person.jsp?account=<%=top5user_list.get(i).getAccount()%>"><%=name%></a></h3>
                        <p>最长工时任务：<%=top5user_list.get(i).getLongtaskname()%></p>                       
                        <span><%=top5user_list.get(i).getConsume()%></span>
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
                		List<taskInfo> top5task_list = taskInfoDAO.selectTop5Task(projectinfo.getId());
        				for(int i=0; i<top5task_list.size()&&i<5; i++) {
                	%>
                    <li>
                        <em><%=i+1%></em>
                        <h3><%=top5task_list.get(i).getTaskname()%></h3>
                        <p>开始时间：<%=top5task_list.get(i).getStartdate()%>  结束时间：<%=top5task_list.get(i).getFinishdate()%></p>
                        <span><%=top5task_list.get(i).getConsumed()%></span>
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
                    	List<taskTypeInfo> tasktype_list = taskInfoDAO.selectTaskType(projectinfo.getId());
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
    paths: {
        echarts: 'plugins/echarts'
    }
});

require(
    [
        'echarts',
        'echarts/chart/pie'
    ],

    function (ec) {
        //饼状图
        myChart = ec.init(document.getElementById('main'));     
        option = {
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            calculable : false,
            series : [
                {
                    name:'访问来源',
                    type:'pie',
                    radius : '65%',
                    center: ['40%', '52%'],
                    itemStyle:{
                        normal:{
                            borderWidth:0
                        }
                    },
                    data:<%=request.getAttribute("list")%>
                }
            ]
        };
        myChart.setOption(option);   
   }
);

</script>
</body>
</html>

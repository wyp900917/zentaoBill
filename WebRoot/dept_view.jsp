<%@ page language="java" import="java.util.*" import="com.model.*"
	import="com.dao.*" import="java.sql.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	String dept = (String) request.getParameter("dept");
	deptInfo deptinfo = null;
	if (null != dept) {
		deptinfo = deptInfoDAO.selectDept(Integer.parseInt(dept));
	} else {
		deptinfo = deptInfoDAO.selectDept(1);
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>禅道年度账单-部门年视图</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" href="plugins/Swiper/dist/idangerous.swiper.css">
<link rel="stylesheet"
	href="plugins/Swiper/src/idangerous.swiper.scrollbar.css">
<link rel="stylesheet"
	href="plugins/customer/jquery.mCustomScrollbar.css">
<style type="text/css">
html {
	background: #0c212a;
}

.swiper-container {
	width: 1273px;
	height: 400px;
}

.swiper-slide {
	position: relative;
	width: 5085px;
	height: 400px;
}

.swiper-scrollbar {
	width: 100%;
	height: 8px;
	position: absolute;
	left: 0;
	bottom: 0px;
	z-index: 1;
}
</style>

</head>

<body>
	<!-- head -->
	<div class="head clearfix">
		<div class="w1273">
			<h2>
				<a href="####" class="arrow"></a>2015禅道年度账单-部门视图
			</h2>
			<div class="right">
				<div class="sel sel1">
					<%
						if(null != deptinfo){
					%>
					<span><%=deptinfo.getName()%></span>
					<%
						}else{
					%>
					<span>请选择</span>
					<%
						}
					%>
				</div>
				<ul class="namelist">
					<%
						List<deptInfo> dept_list = deptInfoDAO.selectAllDept();
								for (deptInfo d : dept_list) {
					%>
					<li><a href="dept_view.jsp?dept=<%=d.getId()%>"><%=d.getName()%></a>
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
	<div class="dpwrap pt10 yearview">
		<div class="w1273 clearfix">
			<div class="yearwrap">
				<div class="swiper-container">
					<div class="swiper-scrollbar"></div>
					<div class="swiper-wrapper">
						<div class="swiper-slide clearfix">
							<%
								for(int i=0; i<12; i++) {
							%>
							<div class="monthbox <%if(i!=0){%>lf<%=i+1%><%}%> bg<%=i%6%>">
								<span class="titnum white"><span><i>3</i>个项目</span> </span>
								<ul class="scollbox">
									<%
										List<projectInfo> list_project = projectInfoDAO.selectProjectPerMonth(2015, i+1);
										for(projectInfo project : list_project)
											project.setConsume(projectInfoDAO.getConsumeBydate(project.getId(), 2015, i+1));
										Collections.sort(list_project);
										for(projectInfo project : list_project) {
											
									%>
									<li><a
										href="project_view.jsp?project=<%=project.getId()%>"><%=project.getName()%></a>
										<span class="time"><%=project.getConsume()%>h</span> <span class="people"><%=project.getPm()%></span>
									</li>
									<%
										}
									%>
								</ul>
							</div>

							<%
								}
							%>
							<!-- 12月份图 -->
							<img src="images/yearline.png" height="85" width="5085"
								class="img_center">

						</div>
					</div>
				</div>
				<img src="images/img_center.png" class="fiximg">
			</div>


			<!-- 项目Top5 -->
			<div class="lfbox dptop5">
				<div class="dp_title">项目Top10</div>
				<div class="dp_cont1">
					<ul class="toplist clearfix">
						<%
							List<projectYearInfo> list_proyear = projectInfoDAO.selectTop10(2015);
							for(int i=0; i<list_proyear.size(); i++) {
											projectInfo projectinfo = projectInfoDAO.selectProject(list_proyear.get(i).getId());
						%>
						<li><em><%=i+1%></em>
							<h3>
								<a href="project_view.jsp?project=<%=projectinfo.getId()%>"><%=projectinfo.getName()%></a>
							</h3>
							<p>
								负责人：<%=projectinfo.getPm()%></p> <span><%=list_proyear.get(i).getConsume()%>h</span>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<!-- 项目Top5 end -->

			<!-- 人员动态 -->
			<div class="lfbox chart">
				<div class="dp_title">
					<span class="all"><em></em>总人数</span> <span class="out"><em></em>离职人数</span>
					<span class="in"><em></em>新入职人数</span>
				</div>
				<div class="dp_cont1">
					<div id="main" style=" height: 270px;"></div>
				</div>
			</div>
			<!-- 产品人员动态end -->

			<!-- 人员Top5 -->
			<div class="lfbox peoptop5">
				<div class="dp_title">人员Top5</div>
				<div class="dp_cont1">
					<ul class="toplist lmg clearfix">
						<%
							List<personYearInfo> list_person = userPerYearDAO.selectTop5(2015);
										for(personYearInfo person : list_person) {
											String name = userInfoDAO.selectUser(person.getAccount()).getRealname();
											String taskname = taskInfoDAO.selectTaskname(person.getTaskid());
						%>
						<li><em><img src="images/<%=person.getAccount()%>.png">
						</em>
							<h3>
								<a href="person.jsp?account=<%=person.getAccount()%>"><%=name%></a>
							</h3>
							<p>
								最长工时任务：<%=taskname%></p> <span><%=person.getConsume()%>h</span></li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<!-- 人员Top5end -->

		</div>

	</div>


	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script src="plugins/Swiper/dist/idangerous.swiper.min.js"></script>
	<script src="plugins/Swiper/src/idangerous.swiper.scrollbar-2.1.js"></script>
	<script src="plugins/customer/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="plugins/echarts/echarts.js"></script>
	<!--echart图表插件-->
	<script type="text/javascript" src="js/year.js"></script>
	<script type="text/javascript">
		var mySwiper = new Swiper('.swiper-container', {
			scrollContainer : true,
			scrollbar : {
				container : '.swiper-scrollbar'
			},
			scrollbarHide : false
		});
	</script>
</body>
</html>

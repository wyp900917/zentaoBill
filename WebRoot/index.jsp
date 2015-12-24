<%@ page language="java" import="java.util.*" import="java.sql.*"
	import="com.model.*" import="com.dao.*" pageEncoding="utf-8"%>
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

<title>禅道年度账单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="plugins/nicesrcoll/jquery.js"></script>
<script type="text/javascript"
	src="plugins/nicesrcoll/jquery.nicescroll.js"></script>
<style type="text/css">
html {
	background: #0c212a;
}
</style>
</head>

<body>
	<!-- head -->
	<div class="head clearfix">
		<div class="w1273">
			<h2>
				<a href="####" class="arrow"></a>2015禅道年度账单-部门年度视图
			</h2>
			<div class="right">
				<div class="sel sel1">
					<%
						if (null != deptinfo) {
					%>
					<span><%=deptinfo.getName()%></span>
					<%
						} else {
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
					<li><a href="index.jsp?dept=<%=d.getId()%>"><%=d.getName()%></a>
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
							for (productInfo pi : list_product) {
						%>
						<li><a href="product_view.jsp?product=<%=pi.getId()%>"><%=pi.getName()%></a>
						</li>
						<%
							}
						%>
					</ul>
				</div>
				<!-- 产品end -->
				<!-- 分组 -->
				<div class="gpwrap clearfix">
					<div class="group_img"></div>
					<div class="group ml0">
						<div class="title">
							<a href="####">公共产品线</a>
						</div>
						<div class="cont bg10">
							<span></span>
							<ul class="grouplist clearfix">
								<li class="leader"><a href="person.jsp?account=li.sen">李森</a>
								</li>
								<li><a href="person.jsp?account=shi.yafeng">史亚风</a>
								</li>
								<li><a href="person.jsp?account=xu.lei2">徐磊</a>
								</li>
								<li><a href="person.jsp?account=zhao.xueru">赵雪茹</a>
								</li>
								<li><a href="person.jsp?account=wang.gang3">王刚</a>
								</li>
								<li><a href="person.jsp?account=wu.jian">吴建</a>
								</li>
								<li><a href="person.jsp?account=li.lingyue">李凌悦</a>
								</li>
								<li><a href="person.jsp?account=zhang.zilong">张子龙</a>
								</li>
								<li><a href="person.jsp?account=xing.hang">邢航</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="group">
						<div class="title">
							<a href="####">UED团队</a>
						</div>
						<div class="cont bg11">
							<span></span>
							<ul class="grouplist clearfix">
								<li class="leader"><a href="person.jsp?account=ren.liping">任丽萍</a>
								</li>
								<li><a href="person.jsp?account=yang.xia">杨霞</a>
								</li>
								<li><a href="person.jsp?account=li.lili">李丽丽</a>
								</li>
								<li><a href="person.jsp?account=zhou.xiaoli">周晓莉</a>
								</li>
								<li><a href="person.jsp?account=meng.linghong">孟令红</a>
								</li>
								<li><a href="person.jsp?account=wan.di">宛笛</a>
								</li>
								<li><a href="person.jsp?account=li.zelan">李泽蓝</a>
								</li>
								<li><a href="person.jsp?account=wang.shengzhong">王盛忠</a>
								</li>
								<li><a href="person.jsp?account=zhang.jiming">张继明</a>
								</li>
								<li><a href="person.jsp?account=chen.chen">陈琛</a>
								</li>
								<li><a href="person.jsp?account=luo.qian">罗茜</a>
								</li>
								<li><a href="person.jsp?account=du.fangjia">杜方家</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="group">
						<div class="title">
							<a href="####">集成产品线</a>
						</div>
						<div class="cont bg12">
							<span></span>
							<ul class="grouplist clearfix">
								<li class="leader"><a href="person.jsp?account=wang.zhen">王震</a>
								</li>
								<li class="leader"><a href="person.jsp?account=zhang.tao">张涛</a>
								</li>
								<li class="leader"><a href="person.jsp?account=zhao.weiwei">赵伟伟</a>
								</li>
								<li class="leader"><a href="person.jsp?account=fan.wenbin">范文斌</a>
								</li>
								<li><a href="person.jsp?account=cai.ya">蔡亚</a>
								</li>
								<li><a href="person.jsp?account=zhang.maodou">张毛斗</a>
								</li>
								<li><a href="person.jsp?account=sheng.gang">盛刚</a>
								</li>
								<li><a href="person.jsp?account=pei.xiaozhen">裴孝贞</a>
								</li>
								<li><a href="person.jsp?account=long.juantao">龙卷涛</a>
								</li>
								<li><a href="person.jsp?account=cao.cong">曹聪</a>
								</li>
								<li><a href="person.jsp?account=ni.liang">倪亮</a>
								</li>
								<li><a href="person.jsp?account=qin.haisheng">覃海胜</a>
								</li>
								<li><a href="person.jsp?account=liang.hao">梁浩</a>
								</li>
								<li><a href="person.jsp?account=wan.shijie">万世界</a>
								</li>
								<li><a href="person.jsp?account=gui.bin">桂斌</a>
								</li>
								<li><a href="person.jsp?account=wang.yaping">王亚平</a>
								</li>
								<li><a href="person.jsp?account=li.chun">李春</a>
								</li>
								<li><a href="person.jsp?account=liu.yuanyuan">刘媛媛</a>
								</li>
								<li><a href="person.jsp?account=yu.meiling">俞美玲</a>
								</li>
								<li><a href="person.jsp?account=ma.sai">马赛</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="group">
						<div class="title">
							<a href="####">实施团队</a>
						</div>
						<div class="cont bg13">
							<span></span>
							<ul class="grouplist clearfix">
								<li class="leader"><a href="person.jsp?account=fan.xiangfeng">范祥峰</a>
								</li>
								<li><a href="person.jsp?account=wang.meng">王檬</a>
								</li>
								<li><a href="person.jsp?account=wang.tao">王涛</a>
								</li>
							</ul>
						</div>
					</div>

				</div>
				<!-- 分组end -->
			</div>

			<!-- 项目 -->
			<div class="rgbox">
				<div class="dp_title">项目</div>
				<div class="dp_cont1" id="dp_cont1">
					<ul class="dp_nmlist clearfix">
						<%
							List<projectInfo> list_project = projectInfoDAO
									.selectAllProject(2015);
							for (int i = 0; i < list_project.size(); i++) {
						%>
						<li><em><%=i + 1%></em> <a
							href="project_view.jsp?project=<%=list_project.get(i).getId()%>"><%=list_project.get(i).getName()%></a>
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
</body>
</html>

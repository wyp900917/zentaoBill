<%@ page language="java" import="java.util.*" import="com.model.*"
	import="com.dao.*" import="java.sql.*" import="net.sf.json.JSONArray" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	String product = (String) request.getParameter("product");
	productInfo productinfo = null;
	if (null != product) {
		productinfo = productInfoDAO.selectProductByID(Integer.parseInt(product));
	} else {
		productinfo = productInfoDAO.selectProductByID(3);
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>禅道年度账单-产品视图</title>

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
	bottom: 0;
	z-index: 1;
	background: rgba(255, 255, 255, 0.1)
}

.swiper-scrollbar-drag {
	background: rgba(255, 255, 255, 0.4);
}
</style>

</head>

<body>
	<div class="head clearfix">
		<div class="w1273">
			<h2>
				<a href="####" class="arrow"></a>2015禅道年度账单-产品视图
			</h2>
		</div>
	</div>
	<!-- head end -->

	<!-- 人员信息 -->
	<div class="person">
		<div class="w1273 clearfix">
			<div class="left">
				<div class="sel"><span><%=productinfo.getName()%></span>
				</div>
				<ul class="pditems pro">
					<%
						List<productInfo> product_list = productInfoDAO.selectAllProduct();
						for (productInfo p : product_list) {
					%>
					<li><a href="product_view.jsp?product=<%=p.getId()%>"><%=p.getName()%></a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="right">
				<span class="ing"><%=productinfo.getStatus()%></span>
				<div class="itm">
					开始时间:<span><%=productinfo.getCreatedate()%></span>
				</div>
				<!-- <div class="itm">
					结束时间:<span>2015-9-20</span>
				</div> -->
				<span class="admin mr70"><%=userInfoDAO.selectUser(productinfo.getPo()).getRealname()%></span>
				<div class="myphoto">
					<div class="photowrap">
						<img src="images/<%=productinfo.getPo()%>.png">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 人员信息 end -->
	<!-- time wrap -->
	<div class="dpwrap pd0 product">
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
										List<projectInfo> list_project = projectInfoDAO.selectProjectPerMonthByProductID(productinfo.getId(), 2015, i+1);
										for(projectInfo project : list_project) {
												double consume = projectInfoDAO.getConsumeBydate(project.getId(), 2015, i+1);
									%>
									<li><a
										href="project_view.jsp?project=<%=project.getId()%>"><%=project.getName()%></a>
										<span class="time"><%=consume%>h</span> <span class="people"><%=project.getPm()%></span>
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
							<img src="images/productline.png" height="85" width="5085"
								class="img_center">

						</div>
					</div>
				</div>
				<img src="images/img_center.png" class="fiximg">
			</div>

		</div>
	</div>
	<div class="midwrap pt0">
		<div class="w1273 clearfix">
			<div class="midbox">
				<div class="midtitle">个人投入Top 5</div>
				<div class="cont">
					<ul class="toplist lmg clearfix">
						<%
							List<personYearInfo> list_person = projectPerYearDAO.selectTop5ConsumedByProductID(productinfo.getId(), 2015);
		                	for(personYearInfo person : list_person) {
						%>
						<li><em><img src="images/<%=person.getAccount()%>.png">
						</em>
							<h3>
								<a href="person.jsp?account=<%=person.getAccount()%>"><%=userInfoDAO.selectUser(person.getAccount()).getRealname()%></a>
							</h3>
							<p>最长工时任务：<%=projectPerYearDAO.selectTasknameByConsume(person.getAccount(), 2015, person.getTconsume())%></p> <span><%=person.getConsume()%>h</span>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
			<div class="midbox mlr16">
				<div class="midtitle">项目投入Top 5</div>
				<div class="cont">
					<ul class="toplist clearfix">
					<%
						List<projectYearInfo> list_project = projectInfoDAO.selectTop5ByProductID(productinfo.getId(), 2015);
						for(int i=0; i<list_project.size(); i++) {
					%>
						<li><em><%=i+1%></em>
							<h3>
								<a href="project_view.jsp?project=<%=list_project.get(i).getId()%>"><%=projectInfoDAO.selectProject(list_project.get(i).getId()).getName()%></a>
							</h3>
							<p>最长任务：<%=taskInfoDAO.selectTop1Task(list_project.get(i).getId())%></p> <span><%=list_project.get(i).getConsume()%>h</span>
						</li>
					<%
						}
					%>
					</ul>
				</div>
			</div>
			<div class="midbox w425">
				<div class="midtitle">需求类别比</div>
				<div class="cont">
					<div id="main" style=" height: 190px;"></div>
					<div class="legend lgd1">
						<ul>
						<%
							List<storyTypeInfo> list_story = storyTypeInfoDAO.selectTaskType(productinfo.getId());
							request.setAttribute("list", JSONArray.fromObject(list_story).toString());
							for(storyTypeInfo story : list_story) {
						%>
							<li><i><%=story.getName()%></i><span><%=story.getCount()%></span><span><%=story.getValue()%>%</span></li>
						<%
							}
						%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script src="plugins/Swiper/dist/idangerous.swiper.min.js"></script>
	<script src="plugins/Swiper/src/idangerous.swiper.scrollbar-2.1.js"></script>
	<script src="plugins/customer/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="plugins/echarts/echarts.js"></script>
	<!--echart图表插件-->
	<script type="text/javascript">
		var mySwiper = new Swiper('.swiper-container', {
			scrollContainer : true,
			scrollbar : {
				container : '.swiper-scrollbar'
			},
			scrollbarHide : false
		});
	</script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					//选择人
					$(".sel").click(function() {
						$(this).toggleClass("up");
						$(".pditems").slideToggle();
					});
					$(".pditems li").click(function() {
						$(".sel span").text($(this).text());
						$(".pditems").hide();
						$(".sel").removeClass("up");
					});

					$(".titnum span i").each(
							function() {
								var k = $(this).parents(".titnum").next(
										".scollbox").find("li").size();
								$(this).text(k);
							});
				});

		(function($) {
			$(window).load(function() {
				$(".scollbox").mCustomScrollbar({
					theme : "dark"
				});
			});
		})(jQuery);
	</script>
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
					center : [ '50%', '62%' ],
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

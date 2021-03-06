<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/common/taglib.jsp" %>
<!-- Page refresh -->
<ul class="nav navbar-nav refresh">
    <li class="divided">
        <a href="#" class="page-refresh"><i class="fa fa-refresh"></i></a>
        <a><span style="font-size: 23px;color:#FFFFFF;"><strong>${areaName}</strong> 智慧工地云平台</span></a>
    </li>
</ul>
<!-- /Page refresh -->

<!-- Search -->
<div class="search" id="main-search">
	<input type="hidden" id="ctx" value="${pageContext.request.contextPath}">
	<input type="hidden" id="pid" value="${project.id}">
	<span style="line-height: 45px;color:#EFEEFF; font-size: 18px;vertical-align: middle;">
		<b id="currentProject">
		<c:if test="${project!=null}">
			${project.name}
		</c:if>
		<c:if test="${project==null}">
			${currentProject.name}
		</c:if>
		</b>
	</span>
	<span class="hidden" style="line-height: 45px;">
		<a href="javascript:switchProject('${pageContext.request.contextPath}')" class="btn btn-primary btn-xs " style="vertical-align: middle;" title="在App上进行切换后，点此刷新">切换</a>
	</span>
</div>
<!-- Search end -->



<!-- Quick Actions -->
<ul class="nav navbar-nav quick-actions">

    <li class="dropdown divided hidden">

        <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
            <i class="fa fa-tasks"></i>
            <span class="label label-transparent-black">2</span>
        </a>

        <ul class="dropdown-menu wide arrow nopadding bordered">
            <li><h1>You have <strong>2</strong> new tasks</h1></li>
            <li>
                <a href="#">
                    <div class="task-info">
                        <div class="desc">Layout</div>
                        <div class="percent">80%</div>
                    </div>
                    <div class="progress progress-striped progress-thin">
                        <div class="progress-bar progress-bar-green" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                            <span class="sr-only">40% Complete (success)</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="task-info">
                        <div class="desc">Schemes</div>
                        <div class="percent">15%</div>
                    </div>
                    <div class="progress progress-striped active progress-thin">
                        <div class="progress-bar progress-bar-cyan" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                            <span class="sr-only">45% Complete</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="task-info">
                        <div class="desc">Forms</div>
                        <div class="percent">5%</div>
                    </div>
                    <div class="progress progress-striped progress-thin">
                        <div class="progress-bar progress-bar-orange" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 5%">
                            <span class="sr-only">5% Complete (warning)</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="task-info">
                        <div class="desc">JavaScript</div>
                        <div class="percent">30%</div>
                    </div>
                    <div class="progress progress-striped progress-thin">
                        <div class="progress-bar progress-bar-red" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                            <span class="sr-only">30% Complete (danger)</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="task-info">
                        <div class="desc">Dropdowns</div>
                        <div class="percent">60%</div>
                    </div>
                    <div class="progress progress-striped progress-thin">
                        <div class="progress-bar progress-bar-amethyst" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                            <span class="sr-only">60% Complete</span>
                        </div>
                    </div>
                </a>
            </li>
            <li><a href="#">Check all tasks <i class="fa fa-angle-right"></i></a></li>
        </ul>

    </li>

    <li class="dropdown divided hidden">

        <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
            <i class="fa fa-envelope"></i>
            <span class="label label-transparent-black">1</span>
        </a>

        <ul class="dropdown-menu wider arrow nopadding messages">
            <li><h1>You have <strong>1</strong> new message</h1></li>
            <li>
                <a class="cyan" href="#">
                    <div class="profile-photo">
                        <img src="${pageContext.request.contextPath}/resource/template_s/assets/images/ici-avatar.jpg" alt />
                    </div>
                    <div class="message-info">
                        <span class="sender">Ing. Imrich Kamarel</span>
                        <span class="time">12 mins</span>
                        <div class="message-content">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum</div>
                    </div>
                </a>
            </li>

            <li>
                <a class="green" href="#">
                    <div class="profile-photo">
                        <img src="${pageContext.request.contextPath}/resource/template_s/assets/images/arnold-avatar.jpg" alt />
                    </div>
                    <div class="message-info">
                        <span class="sender">Arnold Karlsberg</span>
                        <span class="time">1 hour</span>
                        <div class="message-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit</div>
                    </div>
                </a>
            </li>

            <li>
                <a href="#">
                    <div class="profile-photo">
                        <img src="${pageContext.request.contextPath}/resource/template_s/assets/images/profile-photo.jpg" alt />
                    </div>
                    <div class="message-info">
                        <span class="sender">John Douey</span>
                        <span class="time">3 hours</span>
                        <div class="message-content">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</div>
                    </div>
                </a>
            </li>

            <li>
                <a class="red" href="#">
                    <div class="profile-photo">
                        <img src="${pageContext.request.contextPath}/resource/template_s/assets/images/peter-avatar.jpg" alt />
                    </div>
                    <div class="message-info">
                        <span class="sender">Peter Kay</span>
                        <span class="time">5 hours</span>
                        <div class="message-content">Ut enim ad minim veniam, quis nostrud exercitation</div>
                    </div>
                </a>
            </li>

            <li>
                <a class="orange" href="#">
                    <div class="profile-photo">
                        <img src="${pageContext.request.contextPath}/resource/template_s/assets/images/george-avatar.jpg" alt />
                    </div>
                    <div class="message-info">
                        <span class="sender">George McCain</span>
                        <span class="time">6 hours</span>
                        <div class="message-content">Lorem ipsum dolor sit amet, consectetur adipisicing elit</div>
                    </div>
                </a>
            </li>


            <li class="topborder"><a href="#">Check all messages <i class="fa fa-angle-right"></i></a></li>
        </ul>

    </li>

    <li class="dropdown divided hidden">

        <a class="dropdown-toggle button" data-toggle="dropdown" href="#">
            <i class="fa fa-bell"></i>
            <span class="label label-transparent-black">3</span>
        </a>

        <ul class="dropdown-menu wide arrow nopadding bordered">
            <li><h1>You have <strong>3</strong> new notifications</h1></li>

            <li>
                <a href="#">
                    <span class="label label-green"><i class="fa fa-user"></i></span>
                    New user registered.
                    <span class="small">18 mins</span>
                </a>
            </li>

            <li>
                <a href="#">
                    <span class="label label-red"><i class="fa fa-power-off"></i></span>
                    Server down.
                    <span class="small">27 mins</span>
                </a>
            </li>

            <li>
                <a href="#">
                    <span class="label label-orange"><i class="fa fa-plus"></i></span>
                    New order.
                    <span class="small">36 mins</span>
                </a>
            </li>

            <li>
                <a href="#">
                    <span class="label label-cyan"><i class="fa fa-power-off"></i></span>
                    Server restared.
                    <span class="small">45 mins</span>
                </a>
            </li>

            <li>
                <a href="#">
                    <span class="label label-amethyst"><i class="fa fa-power-off"></i></span>
                    Server started.
                    <span class="small">50 mins</span>
                </a>
            </li>

            <li><a href="#">Check all notifications <i class="fa fa-angle-right"></i></a></li>
        </ul>

    </li>

    <li class="dropdown divided user" id="current-user">
        <div class="profile-photo">
            <img src="${pageContext.request.contextPath}/resource/upload/bap/user/default_photo.png" alt />
        </div>
        <a class="dropdown-toggle options" data-toggle="dropdown" href="#">
            ${loginUser.name} <i class="fa fa-caret-down"></i>
        </a>

        <ul class="dropdown-menu arrow settings">

            <li>

                <h3>设置背景:</h3>
                <ul id="color-schemes">
                    <li><a href="#" class="bg-1"></a></li>
                    <li><a href="#" class="bg-2"></a></li>
                    <li><a href="#" class="bg-3"></a></li>
                    <li><a href="#" class="bg-4"></a></li>
                    <li><a href="#" class="bg-5"></a></li>
                    <li><a href="#" class="bg-6"></a></li>
                </ul>

                <div class="form-group videobg-check hidden">
                    <label class="col-xs-8 control-label">Video BG</label>
                    <div class="col-xs-4 control-label">
                        <div class="onoffswitch greensea small">
                            <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="videobg-check">
                            <label class="onoffswitch-label" for="videobg-check">
                                <span class="onoffswitch-inner"></span>
                                <span class="onoffswitch-switch"></span>
                            </label>
                        </div>
                    </div>
                </div>

            </li>

            <li class="divider"></li>

            <li>
                <a href="${pageContext.request.contextPath}/s/account/info"><i class="fa fa-user"></i> 个人信息</a>
            </li>

            <li>
                <a href="javascript:editPwd()"><i class="fa fa-edit"></i> 修改密码</a>
            </li>

            <li>
                <a href="#"><i class="fa fa-envelope hidden"></i> Inbox <span class="badge badge-red" id="user-inbox">3</span></a>
            </li>

            <li class="divider"></li>

            <li>
                <a href="${pageContext.request.contextPath}/account/logout"><i class="fa fa-power-off"></i>登出</a>
            </li>
        </ul>
    </li>

    <li style="visibility: hidden;">
        <a href="#mmenu"><i class="fa fa-comments"></i></a>
    </li>
</ul>
<!-- /Quick Actions -->

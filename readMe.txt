

1.权限部分
	添加用户，默认一些基本的权限
	
	用户登录时，将此用户的所有权限放置到session中
	在访问页面时，用以下语句，进行隐藏某链接
	${sessionScope.uu.indexOf("2")}
	${sessionScope.uu.contains("2")}
	<c:if test="${sessionScope.uu.contains(\"2\")}">
		四十四
	</c:if>

	1.默认存在一个角色是系统管理员
		admin，可以访问所有权限
	
	2.删除角色时，同时要删除其拥有的权限
	
	3. ${sessionScope.user.hasRight("/articl/admin/article") }
	
	<au:a href="${ctx }/admin/article/addArticle" sn="article_add" class="test ddd">添加文章</au:a>
	
	
文章管理
	article_publish 
	article_add 
	article_list 
	
栏目管理
	栏目列表		channel_edit 
	添加子栏目	channel_addChild 
	channel_listAllChannels 
	channel_addParentChannel 
	
	
	
	
2.用户部分
	CMS不属于论坛类的网站，不适合做用户的注册，可以手动添加用户信息

3.用户列表部分
	翻页，上一页和下一页，需要改进

4.栏目
	添加一个栏目类型
		链接类型 --> 此类型不能添加子类
		分类类型
		
	
5.文章
	http://localhost:8080/channelName/new Date().getTime()
	
	文章栏目，禁用父栏目
	<select class="selectpicker">
     	  <optgroup label="Picnic">
	          <option>Mustard</option>
	          <option>Ketchup</option>
	          <option>Relish</option>
          </optgroup>
	      <optgroup label="Camping">
	          <option>Tent</option>
	          <option>Flashlight</option>
	          <option>Toilet Paper</option>
	      </optgroup>
     </select>
     
	同时也要过滤链接类型的channel，
	
	文章摘要，在后台自动完成，截图前200数字，后台处理
	
	文章缩略图，
		1) 没提供，则使用系统默认提供的图片
		2) 没设置，则默认使用第一个图片
		
	设置缩略图时，则将普通图片改为文章缩略图，并加粗
	
	在关闭编辑文章窗口时，弹出警告框，不要随意关闭
	
6.验证码
	Kaptcha
	
7.sn 代表唯一标示号

8.栏目的父类停用了，那么子类也将处于停用状态
    父栏目删除时，子栏目同时删除
    
    
    ★★★★★★
	栏目删除时，带有该栏目的文章也该删除
	★★
    ★★★★★★

9.添加时，为了防止页面跳转
	1),发送ajax请求
	2),使用load方法
	
	post之后的重定向
		可以使用ajax请求，然后后台获取状态，前台进行 ajax.load即可
	
	
10.系统清理，清理一些缓存文件，例如上传的文件等

11.后台左边菜单，无需再另写一个类，固定死

12.status 0 启用，1 停用

13.对于编辑，若是小的编辑，则不要搞一个页面，使用弹出窗口会比较好
	例如编辑栏目
	
	编辑文章需要一个大页面

14.主页的轮播图片，，可以单独设置图片并可以选择关联文章，，考虑设置图片库，这样就方便了

15.系统清理时怎么判断 upload文件夹中的文件是不是临时文件还是正在使用的文件

16.事务处理，遇到异常则写入日志文件

17.附件的处理，
	图片：可以插入文章中
	文档：则改为插入相关附件中
		对于没插入的，则默认是未添加
	
	若图片要作为附件的话，则需要压缩为压缩包
	
	有时间的话做个md5处理，，唯一性，，这样就不会重复添加文件了
	
	删除附件时，从文章中删除，并不从服务器中删除
		服务器中的留着系统清理时做
	
	
18.增加事务处理，--> 优化时再做，，事物做在service层，，不做在controller层 
   或者将事物声明到service这一层


19.链接管理
	1) 导航中的链接
	2) 友情链接
	
	
	
开发：
	关闭权限拦截
	关闭登录拦截
	
20.爬虫所爬文章的附件不考虑
	
	
21.约定
	栏目分类一定分为父子类，不存在单一个类目
	
22.轮播图片默认显示一张
	
23.错误页面返回
	error.jsp
	
24.登陆时，将session生命周期永不过期
	
	




# Part_timeJob

## 用户表：

## user
	id 手机号 一个手机号只能注册一个 varchar(11)
	username 昵称 varchar(15) 主键
	password 密码 varchar(64) sha-256加密
	registeredDate 注册日期 TIMESTAMP
	userId 身份证号 varchar(18)
	creditLevel 信用等级 int(9)
	location 地点 varchar(44)
## 旅游信息：
	tourism
	id 唯一标示 int(9) 自增
	userId 发布者id varchar(11) 
	departure 出发地 varchar(44)
	destination 目的地 varchar(44)
	existPeople 已有人数 int(9)
	planPeople 计划人数 int(9)
	departureTime 出发时间 TIMESTAMP
	returnTime 返回时间 TIMESTAMP
	budget 旅游预算 varchar(10)
	transportation 交通工具 varchar(10)
	publishTime 发布时间 TIMESTAMP
	detailed 详细信息 varchar(255)
	valid 是否有效 int(2) 1有效0无效
## 近程跑腿：
	close
	id 唯一标示 int(9) 自增
	userId 发布者id varchar(11) 
	departure 出发地 varchar(44)
	destination 目的地 varchar(44)
	existPeople 已有人数 int(9)
	planPeople 计划人数 int(9)
	departureTime 出发时间 TIMESTAMP
	returnTime 返回时间 TIMESTAMP
	publishTime 发布时间 TIMESTAMP
	detailed 详细信息 varchar(255)
	type 类型 varchar(50)
## 商品 trip
	id 唯一标示 int(9) 自增
	name 名称 varchar(25)
	describe 描述 varchar(255)
	price 价格 double 
	grade 评分 double
	collection 收藏 int(9)
	order 下单 int(9)
	publishTime 上传时间 timestamp  
	goTime varchar(255) 出行时间
	stroke varchar(255) 行程安排
	know varchar(255) 旅行须知
## 全局约定：
	返回值形式：{status:(请求的状态),message:(一个简单短语解释状态码),data:{返回的数据object}}
	状态码： 200表示请求成功
		300 表示请求失败
		400 表示没有权限
	所有涉及到分页的URL，统一请求参数：
		page:第几页
		rows：每页多少个
	所有返回有/无的接口，返回值统一是{success:m} m可取值为0，1 其中0代表失败1代表成功
	全局约定中声明好的返回数据，在本文档中具体接口中留空
	旅游和近程接口类似，不再重复声明，规定Tourism更换为Close，参数中加上type即为近程接口
-----------------------------------------------------------------------------
# 用户相关：
	统一使用/user前缀
## 设置,获取基本信息：
	userInfo[post/get]
	参数：
		username 昵称
		location 所在地
	返回值
	[注]获取基本信息不传参数
## 实名认证：
	realName[post]
	参数：
		userId 身份证号（前端进行有效验证）
## 查看自己报名的旅游信息：
	userTourism[get]
	参数：
	返回值：
		[{id 唯一标示 int(9) 自增
		  userId 发布者id
	          departure 出发地
	 	  destination 目的地
		  existPeople 已有人数
	  	  planPeople 计划人数
	    	  departureTime 出发时间
		  returnTime 返回时间
		  budget 旅游预算
		  transportation 交通工具
		  publishTime 发布时间
		  detailed 详细信息
		  valid 是否有效
                  applyTime 报名时间}]
## 发布旅游信息：
	addTourism[post]
	参数：
		departure 出发地 varchar(44)
		destination 目的地 varchar(44)
		planPeople 计划人数 int(9)
		departureTime 出发时间 TIMESTAMP
		returnTime 返回时间 TIMESTAMP
		budget 旅游预算 varchar(10)
		transportation 交通工具 varchar(10)
		detailed 详细信息 varchar(255)
	返回值：
## 报名旅游信息：
	applyTourism[post]
	参数：
		id 要报名的旅游
	返回值：
## 删除旅游信息：
	deleteTourism[post]	
	参数：
		id 要删除的旅游
	返回值
## 下单
	order[post]
	参数：
		id 预定的商品的id
		goTime 出行日期
	返回值 
		orderId 订单id
## 付款
	pay[post]
	参数 
		orderId 订单id
	返回值
## 查看我的订单
	myOrder[get]
		参数 
	返回值 
	{
		订单 id
		下单时间 orderTime
		下单商品 tripId
		结算时间 payTime
		评分 grade null未评分 其他的是分数
		出行日期 goTime 
	}
## 收藏
	collection[post]
	参数 
		id 收藏的id
	返回值
## 查看我的收藏
	myCollection[get]
	参数	
	返回值
		{商品信息}
## 取消收藏
	cancelCollection[post]
	参数
		id 要取消的商品id
	返回值
## 评分
	grade[post]
	参数：
		id 评分的订单
		mark 分数
	返回值：
## 未付款
	notPay[get]
	参数：
	返回值：
		{订单信息}
## 已完成
        hasPay[get]
        参数：
        返回值：
                {订单信息}
## 已去过
        hasGone[get]
        参数：
        返回值：
                {订单信息}

-----------------------------------------------------------------------------
# 常规业务：
	统一使用/common前缀
## 获取旅游信息：
	getTourism[get]
	参数：
	返回值：
		[{id 唯一标示 int(9) 自增
		  userId 发布者id varchar(11) 
	          departure 出发地 varchar(44)
	 	  destination 目的地 varchar(44)
		  existPeople 已有人数 int(9)
	  	  planPeople 计划人数 int(9)
	    	  departureTime 出发时间 TIMESTAMP
		  returnTime 返回时间 TIMESTAMP
		  budget 旅游预算 varchar(10)
		  transportation 交通工具 varchar(10)
		  publishTime 发布时间 TIMESTAMP
		  detailed 详细信息 varchar(255)}]
## 发送验证码：
	sendMessage[get]
	参数：
		mobile 手机号
	返回值：
## 验证验证码是否正确
	check[get]
	参数：
		mobile 手机号
		code 用户输入的验证码
	返回值
## 登录：
	login[post]
	参数：
		id 手机号
		password 密码
	返回值：
## 注册：
	registered[post]
	参数：
		id 手机号
		password 密码 （重复密码在前端进行验证）
	返回值
## 检查用户名是否存在：
	exists[get]
	参数：
		id 手机号
	返回值
## 获取商品
	getTrip[get]
	参数：
	返回值：
		{商品所有信息，
		go 商品信息中的出行日期数组
		ifCollected [0,1]当前用户是否收藏， 0否1是
		}
## 按照id获取指定商品
	getTripById[get]
	参数：
		id 要查看的商品的id
	返回值
		{商品的基本信息
		go 商品信息中的出行日期数组}

/*设置客户端连接服务器端的编码*/
SET NAMES UTF8;
/*丢弃数据库，如果存在*/
DROP DATABASE IF EXISTS tesla;
/*创建新的数据库，设置存储编码*/
CREATE DATABASE tesla CHARSET=UTF8;
/*进入该数据库*/
USE tesla;

/*创建保存用户信息数据的表*/
CREATE TABLE tesla_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,  # 用户名唯一ID主键且自增
	username VARCHAR(32) NOT NULL, # 用户名字
	surnames VARCHAR(32) NOT NULL, # 姓氏
	email VARCHAR(64) NOT NULL UNIQUE, # 电子邮箱
	password VARCHAR(32) NOT NULL, # 密码,MD5格式
	phone VARCHAR(11) , # 电话
	id_card VARCHAR(32) # 身份证
);
/*插入数据*/
INSERT INTO tesla_user VALUES(1,'leilei','li','1222345@qq.com','12345678','18322233344','110101199003071655');
INSERT INTO tesla_user VALUES(2,'san','zhang','1222346@qq.com','12345678','18322233345','110101199003076632');

/*汽车订制*/ 
/*汽车头部导航*/
CREATE TABLE tesla_customized_nav(
	id smallint(5) PRIMARY KEY AUTO_INCREMENT, #导航id
	nav_name varchar(30) NOT NULL #头部导航名字
);
INSERT INTO tesla_customized_nav VALUES(1,'1.车型');
INSERT INTO tesla_customized_nav VALUES(2,'2.外观');
INSERT INTO tesla_customized_nav VALUES(3,'3.内饰');
INSERT INTO tesla_customized_nav VALUES(4,'4.Autopilot 自动辅助驾驶');
INSERT INTO tesla_customized_nav VALUES(5,'5.付款');

/*创建保存车型数据的表*/
CREATE TABLE tesla_car_Type(
	tid INT PRIMARY KEY AUTO_INCREMENT, #车型ID,主键且自增
	carType_img  VARCHAR(128) NOT NULL, #车型图片
	carType_range VARCHAR(16) NOT NULL,  # 续航里程
	carType_TopSpeed VARCHAR(16) NOT NULL, #最高时速
	carType_acceleration VARCHAR(16) NOT NULL, #百公里加速
	Double_wheel_drive VARCHAR(32) NOT NULL,  #双电机全轮驱动
	Double_wheel_drive1 VARCHAR(32) NOT NULL,  #双电机全轮驱动配置1
	Double_wheel_drive2 VARCHAR(32) NOT NULL,  #双电机全轮驱动配置2
	Double_wheel_drive1_price VARCHAR(16) NOT NULL,  #双电机全轮驱动配置1的价格
	Double_wheel_drive2_price VARCHAR(16) NOT NULL,  #双电机全轮驱动配置2的价格
	carType_Introduction VARCHAR(250) NOT NULL #车型文章内容
);
INSERT INTO tesla_car_Type VALUES(11,'车型图片1','468 km','225 km/h','5.6 秒','双电机全轮驱动','长续航版','Performance 高性能版','¥ 488,000','¥ 535,000','Tesla 全轮驱动车型搭载两台独立电机以提升冗余度，每台电机只有一个活动部件，耐用性高且易于维护。与传统的全轮驱动系统不同，两台电机可精准地分配前后轮扭矩，操控性和牵引力控制更为出色。</br>价格仅为预估，实际价格以最终公布为准。</br>待监管机构批准。');
INSERT INTO tesla_car_Type VALUES(22,'车型图片2','505 km','217 km/h','5.1 秒','双电机全轮驱动','长续航版','Performance 高性能版','¥ 249,900','¥ 309,900','Tesla 全轮驱动车型搭载两台独立电机以提升冗余度，每台电机只有一个活动部件，耐用性高且易于维护。与传统的全轮驱动系统不同，两台电机可精准地分配前后轮扭矩，操控性和牵引力控制更为出色。</br>价格仅为预估，实际价格以最终公布为准。</br>待监管机构批准。');
INSERT INTO tesla_car_Type VALUES(33,'车型图片3','719 km','250 km/h','3.8 秒','双电机全轮驱动','长续航版','Performance 高性能版','¥ 488,000','¥ 535,000','Tesla 全轮驱动车型搭载两台独立电机以提升冗余度，每台电机只有一个活动部件，耐用性高且易于维护。与传统的全轮驱动系统不同，两台电机可精准地分配前后轮扭矩，操控性和牵引力控制更为出色。</br>价格仅为预估，实际价格以最终公布为准。</br>待监管机构批准。');
/*创建保存车外观数据的表*/
CREATE TABLE tesla_car_Appearance(
	aid INT PRIMARY KEY AUTO_INCREMENT, #车外观ID,主键且自增
	car_Appearance_img  VARCHAR(128) NOT NULL, #车外观图片
	car_color1 VARCHAR(16) NOT NULL, # 选择颜色1
	car_color2 VARCHAR(16) NOT NULL, # 选择颜色2
	car_color3 VARCHAR(16) NOT NULL, # 选择颜色3
	car_color4 VARCHAR(16) NOT NULL, # 选择颜色4
	car_color5 VARCHAR(16) NOT NULL, # 选择颜色5
	car_color_price VARCHAR(16) NOT NULL, # 选择颜色价格
	car_tyre1 VARCHAR(16) NOT NULL, # 选择轮毂1
	car_tyre2 VARCHAR(16) NOT NULL, # 选择轮毂2
	car_tyre_price VARCHAR(16) NOT NULL # 选择轮毂价格

);
INSERT INTO tesla_car_Appearance VALUES(111,'车外观图片1',"纯黑色车漆","珍珠白（多涂层）车漆","冷光银车漆","深海蓝车漆","中国红（多涂层）车漆","¥ 8,000","18 英寸动力轮毂","19 英寸运动轮毂","¥ 6,000");

/*创建保存车内饰数据的表*/
CREATE TABLE tesla_car_Interior(
	Iid INT PRIMARY KEY AUTO_INCREMENT, #车内饰ID,主键且自增
	car_Interior_img  VARCHAR(128) NOT NULL, #车内饰图片
	car_Seat_color1 VARCHAR(16) NOT NULL, # 车内饰颜色1 
	car_Seat_color2 VARCHAR(16) NOT NULL, # 车内饰颜色2
	car_Seat_color3 VARCHAR(16), # 车内饰颜色3
	car_Seat_color4 VARCHAR(16), # 车内饰颜色4
	car_Seat_price VARCHAR(16), #车内饰价格
	car_Interior_contains VARCHAR(300) NOT NULL # 车内饰包含的内容
);
INSERT INTO tesla_car_Interior VALUES(1111,'车内饰图片1',"纯黑色高级内饰（黑色座椅）","黑白高级内饰（白色座椅）",NULL,NULL,'¥ 8,000',"<ul><li>前排座椅加热，可向12个方向电动调节</li><li>高级座椅材质与饰板</li><li>升级版音响系统，沉浸式音效</li><li>高级车载娱乐服务（30 天免费）</li><li>通过蓝牙进行音乐和媒体播放</li><li>有色玻璃车顶，有效阻隔紫外线和红外线</li><li>电动折叠、加热式侧后视镜</li><li>驾驶员偏好设置</li><li>中控台无线手机充电器</li></ul>");
INSERT INTO tesla_car_Interior VALUES(1222,'车内饰图片1',"纯黑色高级内饰（黑色座椅）","黑白高级内饰（白色座椅）",NULL,NULL,'¥ 8,000',"<ul><li>前排座椅加热，可向12个方向电动调节</li><li>高级座椅材质与饰板</li><li>升级版音响系统，沉浸式音效</li><li>高级车载娱乐服务（30 天免费）</li><li>通过蓝牙进行音乐和媒体播放</li><li>有色玻璃车顶，有效阻隔紫外线和红外线</li><li>电动折叠、加热式侧后视镜</li><li>驾驶员偏好设置</li><li>中控台无线手机充电器</li></ul>");
/*创建保存 Autopilot自动辅助驾驶数据的表*/
CREATE TABLE tesla_Autopilot(
	Aid INT PRIMARY KEY AUTO_INCREMENT, #ID,主键且自增
	title VARCHAR(32) NOT NULL, #本页标题
	title_Details VARCHAR(250) NOT NULL, #本页标题详情
	video VARCHAR(64) NOT NULL, #本页视频路径
	Basic_Edition  VARCHAR(250) NOT NULL, #基础版辅助驾驶功能
	Fully_automatic VARCHAR(250) NOT NULL, #完全自动驾驶能力
	Coming_soon VARCHAR(250) NOT NULL, #即将推出
	Configuration_price VARCHAR(16) NOT NULL, #配置价格
	Autopilot_contains VARCHAR(250) NOT NULL #配置完全自动驾驶车载电脑
);
INSERT INTO tesla_Autopilot VALUES(1,'Autopilot 自动辅助驾驶','Autopilot 自动辅助驾驶先进的安全与便捷功能，旨在帮助您将驾驶化繁为简。所有全新 Tesla 车辆均标配基础驾驶辅助功能，如紧急制动、碰撞预警和盲点监测等。','视频路径1','<li>车辆能够根据其他车辆与行人在行驶车道内自动辅助实施转向、加速和制动。</li>','<ul><li>自动泊车：平行泊车与垂直泊车。</li><li>自动辅助导航驾驶：自动驶入和驶出高速公路匝道或立交桥岔路口，超过行驶缓慢的车辆。
</li><li>智能召唤：在合适的场景下，停在车位的车辆会响应您的召唤，驶出车位并前往您所在的位置。</li></ul>','<ul><li>识别交通信号灯和停车标志并做出反应。,</li><li>在城市街道中自动辅助驾驶。</li></ul>','¥ 54,000','完全自动驾驶能力可在交付后进行购买，价格可能会随着新功能的推出而升高</br>目前可用的功能需要驾驶员主动进行监控，车辆尚未实现完全自动驾驶。上述功能的激活与使用将需要数十亿英里的行驶里程的论证，以达到远超人类驾驶员的可靠性；同时还有赖于行政审批（某些司法管辖区可能会需要更长的时间）。随着上述自动驾驶功能的进化与完善，您的车辆将通过 OTA 空中软件更新而持续升级。');
INSERT INTO tesla_Autopilot VALUES(2,'Autopilot 自动辅助驾驶','Autopilot 自动辅助驾驶先进的安全与便捷功能，旨在帮助您将驾驶化繁为简。所有全新 Tesla 车辆均标配基础驾驶辅助功能，如紧急制动、碰撞预警和盲点监测等。','视频路径1','<li>车辆能够根据其他车辆与行人在行驶车道内自动辅助实施转向、加速和制动。</li>','<ul><li>自动泊车：平行泊车与垂直泊车。</li><li>自动辅助导航驾驶：自动驶入和驶出高速公路匝道或立交桥岔路口，超过行驶缓慢的车辆。
</li><li>智能召唤：在合适的场景下，停在车位的车辆会响应您的召唤，驶出车位并前往您所在的位置。</li></ul>','<ul><li>识别交通信号灯和停车标志并做出反应。,</li><li>在城市街道中自动辅助驾驶。</li></ul>','¥ 64,000','完全自动驾驶能力可在交付后进行购买，价格可能会随着新功能的推出而升高</br>目前可用的功能需要驾驶员主动进行监控，车辆尚未实现完全自动驾驶。上述功能的激活与使用将需要数十亿英里的行驶里程的论证，以达到远超人类驾驶员的可靠性；同时还有赖于行政审批（某些司法管辖区可能会需要更长的时间）。随着上述自动驾驶功能的进化与完善，您的车辆将通过 OTA 空中软件更新而持续升级。');


/*汽车详情页面*/
CREATE TABLE tesla_Details(
	id INT PRIMARY KEY AUTO_INCREMENT, #ID,主键且自增
	car_Type VARCHAR(8) NOT NULL, #车名
	car_Type_sm VARCHAR(16), #车名-小字体
	Security_Title VARCHAR(32),  #安全性标题
	Security_content VARCHAR(250),  #安全性内容
	Performance_Title VARCHAR(32) , #性能标题
	Performance_content VARCHAR(250), #性能内容
	mileage_Title VARCHAR(32), #里程标题
	mileage_content VARCHAR(250), #里程内容
	Autopilot_Title VARCHAR(32), #自动辅助驾驶标题
	Autopilot_content VARCHAR(250) , #自动辅助驾驶内容
	Interior_Title VARCHAR(32), #内饰标题
	Interior_content VARCHAR(250), #内饰内容
	Appearance_Title VARCHAR(32), #外观标题
	Appearance_content VARCHAR(250), #外观内容
	Driver_Title VARCHAR(32), #驱动标题
	Driver_content VARCHAR(250), #驱动内容
	Practical_Title VARCHAR(32), #实用性标题
	Practical_content VARCHAR(250) #实用性内容
);
INSERT INTO tesla_Details VALUES(1,'Model S','Tesla 豪华旗舰轿车','高强度碰撞保护','Model S 基于纯电动车平台打造，拥有高强度的车身结构和位于底盘的坚固电池组，提供极佳的碰撞保护。','卓越的加速性能','Model S 在性能和安全性方面奠定了行业标准。得益于 Tesla 先进的电动动力总成，以及双电机全轮驱动、自适应空气悬架和卓越的加速性能，Model S 拥有全天候的、出色的总体性能表现，百公里加速最快仅需 2.5 秒。','不断扩展的充电网络','Model S 拥有行业领先的续航里程，以及多种充电方式。不断扩展的 Tesla 充电网络已覆盖全国主要城市和热门线路，让您充电无忧。','未来的驾驶方式','Autopilot 自动辅助驾驶旨在提升行车安全性和便利性，帮助车主应对枯燥重复的操作环节，从而更好地享受驾驶乐趣。','以驾驶员为中心进行设计','Model S 内部空间宽敞，最多容纳五名成人，还配有 17 英寸车载触摸屏。先进的降噪工程技术实现了媲美录音室的音响效果。全景玻璃车顶让所有乘客的视野更开阔，体验更佳。','设计以效率为先','Model S 的外观设计追求速度与耐用性，实现了出色的空气动力学表现和卓越的加速性能，同时兼顾设计美学。车门把手会在人员靠近时自动弹出，车门关闭后自动缩回。',NULL,NULL,NULL,NULL);
INSERT INTO tesla_Details VALUES(2,'Model 3',NULL,'设计以安全为先','安全性是 Model 3 整体设计的重中之重。车身架构采用钢铝混合金属材质，保证各部位的支撑强度。在一次内部翻滚测试中，Model 3 在配置全景玻璃车顶的情况下，仍成功抵御了四倍于其自身质量的重压，大约相当于两只成年非洲象的重量。','卓越的加速性能','Model 3 Performance 高性能版搭载双电机全轮驱动、19 英寸运动动力轮毂和高级制动系统，悬架更低，在绝大部分天气条件下都拥有极佳的操控体验。碳纤维扰流板可提升高速行驶时的稳定性，使 Model 3 的加速性能达到 0-100 km/h 3.4 秒。','不断扩展的充电网络','Model 3 是一款纯电动车，因此您再也不必前往加油站。日常驾驶中，只需夜晚在家中充电，第二天即可满电出行。长途驾驶时，可通过公共充电站或 Tesla 充电网络补充电量。我们在全球范围内拥有超过 20,000 个超级充电桩，平均每周新建 6 个站点。','未来的驾驶方式','Autopilot 自动辅助驾驶旨在提升行车安全性和便利性，帮助车主应对枯燥重复的操作环节，从而更好地享受驾驶乐趣。','以驾驶员为中心进行设计','Model 3 的内部设计十分独特。可通过 15 英寸触摸屏操控车辆，也可使用智能手机作为车钥匙，并访问触摸屏内的所有驾驶控制选项。全景玻璃车顶，整块玻璃从前舱盖根部一直延伸至车顶，使前后排乘客都拥有开阔的视野。',NULL,NULL,'双电机','Tesla 全轮驱动车型搭载两台独立电机以提升冗余度，每台电机只有一个活动部件，耐用性高且易于维护。与传统的全轮驱动系统不同，两台电机可精准地分配前后轮扭矩，操控性和牵引力控制更为出色。',NULL,NULL);
INSERT INTO tesla_Details VALUES(3,'Model X', 'Tesla 豪华旗舰 SUV', '设计以安全为先', '基于纯电动车平台打造，其车身、底盘、安全约束系统的设计和电池技术均旨在降低乘客受伤概率。', '卓越的加速性能', '得益于 Tesla 先进的电动动力总成，以及双电机全轮驱动、自适应空气悬架和卓越的加速性能，Model X 拥有全天候的、出色的总体性能表现，百公里加速最快仅需 2.8 秒。', '不断扩展的充电网络', 'Model X 拥有行业领先的续航里程，以及多种充电方式。不断扩展的 Tesla 充电网络已覆盖全国主要城市和热门线路，让您充电无忧。', '未来的驾驶方式', 'Autopilot 自动辅助驾驶旨在提升行车安全性和便利性，帮助车主应对枯燥重复的操作环节，从而更好地享受驾驶乐趣。', '以驾驶员为中心进行设计', 'Model X 拥有舒适宽敞的内部空间，配有 17 英寸车载触摸屏，可容纳最多七位成人，载物空间也十分充裕。七座版的后排座椅还可折叠以放置更多行李。', '设计以效率为先', 'Model X 的外观设计追求卓越效率，同时兼顾设计美学，无论是续航里程、性能表现还是实用性，均为行业领先。扰流板进一步提升空气动力学表现，风阻系数较同级别车型更低。',NULL,NULl,'宽敞空间','Model X 拥有超大载物空间，最多可容纳七位成人，牵引力最高可达 2,270 千克。独特的鹰翼门，配备传感器以监测周围情况，即使车位狭窄也可轻松应对。');
INSERT INTO tesla_Details VALUES(4,'Model Y', NULL, '设计以安全为先', '与每款 Tesla 一样，Model Y 拥有同级车型中杰出的安全性能。下移的重心布局、刚劲的车身架构以及充裕的撞击缓冲区，给您全方位的安全保障。', NULL, NULL, '不断扩展的充电网络', 'Model Y is fully electric, so you never need to visit a gas station again. If you charge overnight at home, you can wake up to a full battery every morning. And when you’re on the road, it’s easy to plug in along the way—at any public station or with the Tesla charging network. We currently have over 20,000 Superchargers worldwide, with six new locations opening every week.', '未来的驾驶方式', '所有全新 Tesla 车辆标配紧急制动、碰撞预警和盲点监测等功能。Model Y 将具有完全自动驾驶能力，支持城市街道以及高速公路上自动驾驶（等待监管部门批准），还兼具在停车场任意位置召唤爱车的能力。', '以驾驶员为中心进行设计', '驾驶位座椅调高，前围板调低，使驾驶员的前方道路视野更加开阔。Model Y 的内饰采用简约风格，标配 15 英寸触摸屏、沉浸式音效系统和全景玻璃车顶，头顶空间宽阔、敞亮，让天空景色一览无余。', NULL, NULL, '双电机', 'Tesla 全轮驱动系统，具有两台超灵敏的独立电机，以数字化方式控制前后轮扭矩，提供更加出色的操控、牵引及稳定性。Model Y 能够应对雨天、雪天、泥泞和越野环境。', '超大储物空间', 'Model Y 具有多功能性 — 最多能够容纳 7 名乘客及随身携带的行李。第二排的每一个座椅都可以单独折叠平放，轻松装运滑雪板、家具、行李等大件物品。掀背车门直抵行李箱底部，大口径开合，装卸轻松、快速。');
/*汽车详情页面的图片*/
CREATE TABLE tesla_Details_img(
	id INT PRIMARY KEY AUTO_INCREMENT, #ID,主键且自增
	p1_img1 VARCHAR(68), #第1屏图片路径
	p2_img2 VARCHAR(68), #第2屏图片路径
	p3_img3 VARCHAR(68), #第3屏图片路径
	pv4_img4 VARCHAR(68), #第4屏图片路径
	pv5_img5 VARCHAR(68), #第5屏图片路径
	p6_img6 VARCHAR(68), #第6屏图片路径
	p7_img7 VARCHAR(68), #第7屏图片路径
	py8_img8 VARCHAR(68), #第8屏图片路径
	py9_img9 VARCHAR(68) #第9屏图片路径
);
INSERT INTO tesla_Details_img VALUES(1,'/images/MODELS/model-s@2x.jpg','/images/MODELS/safety-model-s-hero.png','/images/MODELS/model-s-performance.jpg','/images/MODELS/video/119ZLJ_range.mp4-2000_TSMBHB.mp4','/images/MODELS/video/hero.mp4','/images/MODELS/hero@2_1.jpg','/images/MODELS/hero-high-viewport.jpg','/images/MODELS/MS-specs-desktop.jpg','/images/MODELS/models@2.jpg');
/*汽车详情页面的规格*/
CREATE TABLE tesla_Details_parameters(
	id INT PRIMARY KEY AUTO_INCREMENT, #ID,主键且自增
	Battery VARCHAR(16), #电池
	kg VARCHAR(16), #千克
	Acceleration VARCHAR(16), #加速
	Storage_space  VARCHAR(8),  #储物空间
	mileage VARCHAR(32), #续航里程
	Display VARCHAR(32), #显示屏
	Driver VARCHAR(32), #驱动
	Supercharge VARCHAR(32), #超级充电
	Seats VARCHAR(32), #座位数
	Quality VARCHAR(32), #质量保证
	tyre VARCHAR(32), #轮毂
	Highest VARCHAR(16) #最高车速
);
INSERT INTO tesla_Details_parameters VALUES(1,'长续航电池','2,242 kg','2.5 秒 0-100 公里/小时','804 升','694 公里','仪表盘 + 17 英寸触摸屏','全轮驱动','峰值功率 250 kW；按使用付费','5 个座位','整车质保：4 年或 8 万公里（先到者为准）</br>电池和驱动单元：8 年或 240,000 公里（先到者为准）','19 英寸或 21 英寸',NULL);
INSERT INTO tesla_Details_parameters VALUES(2,'长续航电池','2,190 kg','3.8 秒 0-100 公里/小时','804 升','719 公里','仪表盘 + 17 英寸触摸屏','全轮驱动','峰值功率 250 kW；按使用付费','5 个座位','整车质保：4 年或 8 万公里（先到者为准）</br>电池和驱动单元：8 年或 240,000 公里（先到者为准）','19 英寸或 21 英寸',NULL);
INSERT INTO tesla_Details_parameters VALUES(3,'长续航',NULL,'3.7 秒百公里加速','1.9 立方米','480 公里（WLTP 测算标准）','15 英寸中央触摸屏','双电机全轮驱动','按使用付费','最多 7 个座位',NULL,'21 英寸','217 公里/小时');
INSERT INTO tesla_Details_parameters VALUES(4,'长续航',NULL,'5.1 秒百公里加速','1.9 立方米','505 公里（WLTP 测算标准）','15 英寸中央触摸屏','双电机全轮驱动','按使用付费','最多 7 个座位',NULL,'19 英寸或 20 英寸','241 公里/小时');









CREATE TABLE province(
  pid INT PRIMARY KEY,
  proname varchar(20) NOT NULL
);
 -- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO province VALUES (1,'北京');
INSERT INTO province VALUES (2,'天津');
INSERT INTO province VALUES (3,'河北省');
INSERT INTO province VALUES (4,'山西省');
INSERT INTO province VALUES (5,'辽宁省');
INSERT INTO province VALUES (6,'吉林省');
INSERT INTO province VALUES (7,'黑龙江省');
INSERT INTO province VALUES (8,'上海');
INSERT INTO province VALUES (9,'江苏省');
INSERT INTO province VALUES (10,'浙江省');
INSERT INTO province VALUES (11,'福建省');
INSERT INTO province VALUES (12,'山东省');
INSERT INTO province VALUES (13,'河南省');
INSERT INTO province VALUES (14,'湖北省');


CREATE TABLE city (
  cid INT PRIMARY KEY,
  cityname varchar(20) NOT NULL,
  proId INT,
  FOREIGN KEY city(proId) REFERENCES province(pid)
);
-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO city VALUES (1,'东城区',1);
INSERT INTO city VALUES (2,'西城区',1);
INSERT INTO city VALUES (3,'朝阳区',1);
INSERT INTO city VALUES (4,'丰台区',1);
INSERT INTO city VALUES (5,'石景山区',1);
INSERT INTO city VALUES (6,'海淀区',1);
INSERT INTO city VALUES (7,'门头沟区',1);
INSERT INTO city VALUES (8,'房山区',1);
INSERT INTO city VALUES (9,'通州区',1);
INSERT INTO city VALUES (10,'顺义区',1);
INSERT INTO city VALUES (11,'和平区',2);
INSERT INTO city VALUES (12,'河东区',2);
INSERT INTO city VALUES (13,'河西区',2);
INSERT INTO city VALUES (14,'南开区',2);
INSERT INTO city VALUES (15,'河北区',2);
INSERT INTO city VALUES (16,'红桥区',2);

CREATE TABLE shop(
  id INT,
  shopname varchar(20) NOT NULL,
  adress varchar(80) NOT NULL,
  phone varchar(20) NOT NULL,
	lng 	varchar(20) NOT NULL,
	lat varchar(20) NOT NULL,
  cityId INT,
  FOREIGN KEY shop(cityId) REFERENCES city(cid)
);
-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO shop VALUES (1, '北京侨福芳草地体验店', '北京市朝阳区东大桥路9号侨福芳草地', '010-56692669','116.456078','39.92548',1);
INSERT INTO shop VALUES (2, '北京石景山山姆体验店', '北京市石景山区阜石路158号 F1F0011商铺', '010-56183495','116.333775','39.837038',1);
INSERT INTO shop VALUES (3, '天津万象城体验店', '天津市河西区乐园道9号 天津万象城购物中心','022-28456300','117.219851','39.09633',11);
INSERT INTO shop VALUES (4, '天津大寺特斯拉中心', '天津市西青区大寺镇储源道18号天津', '022-81117008','117.220627','39.095904',11);
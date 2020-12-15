// 加载Express模块
const express = require('express');

//加载MD5模块
const md5 = require('md5');

// 加载CORS模块
const cors = require('cors');

// 加载body-parser模块
const bodyParser = require('body-parser');

// 加载MySQL模块
const mysql = require('mysql');

// 创建MySQL连接池
const pool = mysql.createPool({
  // 数据库服务器的地址
  host: '127.0.0.1',
  // 数据库服务器的端口号
  port: 3306,
  // 数据库用户的用户名
  user: 'root',
  // 数据库用户的密码
  password: '',
  // 数据库名称
  database: 'tesla',
  // 编码方式
  charset: 'utf8',
  // 最大连接数
  connectionLimit: 20
});

// 创建WEB服务器实例
const server = express();

// 将CORS作为Server的中间件
server.use(cors({
  origin: ['http://localhost:8080', 'http://127.0.0.1:8080','http://127.0.0.1:3000']
}));

//将bodyParser作为Server的中间件
server.use(bodyParser.urlencoded({
  extended: false
}));

// 用户注册的接口
server.post('/t_register', (req, res) => {
  //console.log(md5('12345678')) ;
  //获取用户名和密码
  let username = req.body.username; //用户名字
  let surnames = req.body.surnames; //姓氏
  let email = req.body.email; //邮箱
  let password = req.body.password; //密码
  //查找用户是否存在
  let sql = 'SELECT COUNT(uid) AS count FROM tesla_user WHERE email=?';
  pool.query(sql, [email], (error, results) => {
    if (error) throw error;
    //如果用户不存在,则插入记录
    if (results[0].count == 0) {
      sql = 'INSERT INTO tesla_user(username,surnames,email,password) VALUES(?,?,?,MD5(?))';
      pool.query(sql, [username,surnames,email,password], (error, results) => {
        if (error) throw error;
        res.send({ message: '注册成功', code: 1 });
      })
    } else { //否则产生合理的错误提示
      res.send({ message: '用户已存在', code: 0 });
    }
  })
});


//用户登录的接口
server.post('/t_login', (req, res) => {
  //获取邮箱和密码
  let email = req.body.email;
  let password = req.body.password;
  //以用户名和密码为条件进行查找
  let sql = 'SELECT username,email FROM tesla_user WHERE email=? AND password=MD5(?)';
  pool.query(sql, [email, password], (error, results) => {
    if (error) throw error;
    if (results.length == 0) {
      res.send({ message: '登录失败', code: 0 });
    } else {
      res.send({ message: '登录成功', code: 1, results: results[0] });
    }
  });

});

//获取车型信息的接口
server.get('/t_design', (req, res) => {
  //获取文章分类表中的全部数据
  let sql = 'SELECT tid,carType_img,carType_range,carType_TopSpeed,carType_acceleration,Double_wheel_drive,Double_wheel_drive1,Double_wheel_drive2,Double_wheel_drive1_price,Double_wheel_drive2_price,carType_Introduction FROM tesla_car_Type';
  //通过连接池的query()方法来执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: '查询成功', code: 1, results: results });
  });
});


//获取汽车详情的接口
server.get('/t_details', (req, res) => {
  let num = req.query.id;
  //获取汽车详情表中的全部数据
  let sql = 'SELECT id,car_Type,car_Type_sm,Security_Title,Security_content,Performance_Title,Performance_content,mileage_Title,mileage_content,Autopilot_Title,Autopilot_content,Interior_Title,Interior_content,Appearance_Title,Appearance_content,Driver_Title,Driver_content,Practical_Title,Practical_content FROM tesla_Details where id=?';
  //通过连接池的query()方法来执行SQL语句
  pool.query(sql, [num],(error, results) => {
    if (error) throw error;
    res.send({ message: '查询成功', code: 1, results: results });
  });
});
//获取汽车详情图片的接口
server.get('/t_d_img', (req, res) => {
  let num = req.query.id;
  //获取汽车详情表中的全部数据
  let sql = 'SELECT id,p1_img1,p2_img2,p3_img3,pv4_img4,pv5_img5,p6_img6,p7_img7,py8_img8,py9_img9 FROM tesla_Details_img where id=?';
  //通过连接池的query()方法来执行SQL语句
  pool.query(sql, [num],(error, results) => {
    if (error) throw error;
    res.send({ message: '查询成功', code: 1, results: results });
  });
});
//汽车详情页面规格的接口
server.get('/t_d_parameters', (req, res) => {
  //获取汽车详情表中的全部数据
  let sql = 'SELECT id,Battery,kg,Acceleration,Storage_space,mileage,Display,Driver,Supercharge,Seats,Quality,tyre,Highest FROM tesla_Details_parameters';
  //通过连接池的query()方法来执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: '查询成功', code: 1, results: results });
  });
});

//获取所有省信息的接口
server.get('/drive',(req,res)=>{
  let sql='SELECT pid,proname FROM province';
  //通过连接池的query()方法来执行SQL语句
  pool.query(sql,(error,results)=>{
    if(error) throw error;
    res.send({message:'查询成功',code:1,results:results})
    //console.log(results)
  });
});

//获取所有市
server.get('/city',(req,res)=>{
  let id=req.query.pid;
  let sql = 'SELECT cid,cityname,proId FROM city WHERE proId=?'
  pool.query(sql,[id],(error,results)=>{
    if(error) throw error;
    res.send({message:'查询成功',code:1,results:results})
  });
});

//获取所有门店
server.get('/shop',(req,res)=>{
  let cid=req.query.cid;
  console.log(1)
  let sql = 'SELECT id,shopname,adress,phone,lng,lat FROM shop WHERE cityId=?'
  pool.query(sql,[cid],(error,results)=>{
    if(error) throw error;
    res.send({message:'查询成功',code:1,results:results})
  });
});
// 指定WEB服务器监听的端口
server.listen(5050,()=>{
  console.log('running');
});


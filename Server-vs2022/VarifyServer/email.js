const nodemailer = require('nodemailer');
const config_module = require("./config")
/**
 * 创建发送邮件的代理
 */
let transport = nodemailer.createTransport({
    host: 'smtp.163.com',
    port: 465,
    secure: true,
    auth: {
        user: config_module.email_user, // 发送方邮箱地址
        pass: config_module.email_pass // 邮箱授权码或者密码
    }
});

/**
 * 发送邮件的函数
 * @param {*} mailOptions_ 发送邮件的参数
 * @returns 
 */
function SendMail(mailOptions_){
    return new Promise(function(resolve, reject){//类似于C++future，在外部调用的时候用future.wait（）等待发送完成
        transport.sendMail(mailOptions_, function(error, info){//异步函数，非阻塞会直接返回，成功与否回调函数通知
            if (error) {
                console.log(error);
                reject(error);//理解成异常情况下的return
            } else {
                console.log('邮件已成功发送：' + info.response);
                resolve(info.response)//正常情况下的return
            }
        });
    })
}
module.exports.SendMail = SendMail
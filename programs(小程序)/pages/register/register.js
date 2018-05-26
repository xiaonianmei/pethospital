var util = require('../../utils/util.js');  
var app = getApp();

Page({
  data: {
    showTopTips: false,
    errorMsg: ""
  },
  onLoad: function () {
    var that = this;
    wx.getSystemInfo({
      success: function (res) {
        that.setData({
          windowHeight: res.windowHeight,
          windowWidth: res.windowWidth
        })
      }
    });
  },

  formSubmit: function (e) {
    // form 表单取值，格式 e.detail.value.name(name为input中自定义name值) ；使用条件：需通过<form bindsubmit="formSubmit">与<button formType="submit">一起使用  
    var account = e.detail.value.account;
    var password = e.detail.value.password;
    var subPassword = e.detail.value.subPassword;
    var nickname = e.detail.value.nickname;
    console.log(account)
    console.log(password)
    console.log(subPassword)
    var that = this;
    // 判断账号是否为空和判断该账号名是否被注册  
    if ("" == util.trim(account) || "" == util.trim(password) || "" == util.trim(subPassword) || "" == util.trim(nickname)) {
      
      util.isError("账号密码昵称不能为空", that);
      return;
    } else {
      if (subPassword != password) {
        util.isError("输入密码不一致", that);
        return;
      }
      util.clearError(that);
      wx.request({
        url: app.globalData.api +"/user/chcekAcount", //仅为示例，并非真实的接口地址
        method: 'GET',
        data: {
          account: account
        },
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        success: function (res) {
          console.log(res.data==1)
          if (res.data == 1){
            wx.showToast({
              title: '帐号已注册',
              icon: "none"
            })
          } else if (res.data == 0){
            wx.request({
              url: app.globalData.api +"/user/save", //仅为示例，并非真实的接口地址
              method: 'GET',
              data: {
                account: account,
                password: password,
                nickname: nickname
              },
              header: {
                "Content-Type": "application/x-www-form-urlencoded"
              },
              success: function (res) {
                console.log(res)
                console.log(res.data.status == 0)
                if (res.data.status == 0) {
                  wx.setStorageSync('user', res.data)
                  wx.showToast({
                    title: '成功',
                    icon: "none"
                  })
                }
                wx.switchTab({
                  url: '/pages/show/show'
                });
              },
              fail: function (res) {
                console.log(res.data)
                return res
              }
            })
          }else{
            wx.showToast({
              title: '链接失败',
              icon: "none"
            })
          }
        },
        fail: function (res) {
          console.log(res.data)
          return res
        }
      })
    }
    
    // 两个密码必须一致  
    
    // 验证都通过了执行注册方法
    
  }
})  
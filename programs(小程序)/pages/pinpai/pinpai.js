// pages/pinpai/pinpai.js
var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    account:null,
    hiddenmodalput: true, 
    password:"",
    repassword:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this
    var user=wx.getStorageSync('user')
    console.log(user.account)
    that.setData({
      account: user.account
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
  
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  },
  modalinput: function () {
    this.setData({
      hiddenmodalput: !this.data.hiddenmodalput
    })
  },
  //取消按钮  
  cancel: function () {
    this.setData({
      hiddenmodalput: true
    });
  },
  //确认  
  confirm: function () {
    var that = this
    this.setData({
      hiddenmodalput: true
    })
    var password = this.data.password
    var repassword = this.data.repassword
    var users = wx.getStorageSync('user')
    var id=users.id
    console.log(id)
    console.log(this.data.password)
    console.log(this.data.repassword)
    if (password.length < 6 || repassword.length<6){
      wx.showToast({
        title: '密码长度要大于6',
        icon: "none"
      })
      return
    }
    if (repassword != password) {
      wx.showToast({
        title: '输入密码不一致',
        icon: "none"
      })
      return;
    }
    wx.request({
      url: app.globalData.api +"/user/updateUser", //仅为示例，并非真实的接口地址
      method: 'GET',
      data: {
        password: password,
        id:id
      },
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        console.log(res)
        if(res.data==1){
          wx.showToast({
             title: '成功',
             icon: "none"
           })
           wx.redirectTo({
             url: '/pages/pinpai/pinpai',
           })
        } else if (res.data == 0) {
          wx.showToast({
            title: '失败',
            icon: "none"
          })
       
        }else{
          wx.showToast({
            title: '网络错误',
            icon: "none"
          })

        }
      },
      fail: function (res) {
        console.log(res.data)
        wx.showToast({
          title: '失败',
          icon: "none"
        })
        return res
      }
    })

  },
  realnameConfirm: function (e) {
    var that = this;
    that.setData({
      password: e.detail.value
    })
  },
  realnameConfirms: function (e) {
    var that = this;
    that.setData({
      repassword: e.detail.value
    })
  },
  loginout:function(){
    wx.removeStorageSync('user')
    wx.redirectTo({
      url: '/pages/index/index',
    })
  }
})
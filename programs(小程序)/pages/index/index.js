var app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    currentTab: 0,
    winWidth: 0,
    winHeight: 0
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this
    //var page=this;
    wx.getSystemInfo({

      success: function (res) {
        console.log(res)
        that.setData({
          winWidth: res.windowWidth,
          winHeight: res.windowHeight
        })
      },
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
  swithchNav: function (e) {
    var that = this;
    if (this.data.currentTab == e.target.dataset.current) {
      return false;
    } else {
      that.setData({
        currentTab: e.target.dataset.current
      })
    }
  },
  register: function (e) {
    wx.navigateTo({
      url: '/pages/register/register',
    })
  },
  formSubmit: function (e) {
    var that = this
    var account = e.detail.value.account;
    var password = e.detail.value.password;
    console.log(account)
    console.log(password)
    if ("" == account.replace(/(^\s*)|(\s*$)/g, "") || "" == password.replace(/(^\s*)|(\s*$)/g, "")) {
      console.log(1)
      wx.showToast({
        title: '账户密码不能为空',
        icon: "none"
      })
      return;
    } else {
      wx.request({
        url: app.globalData.api+"/user/login/", //仅为示例，并非真实的接口地址
        method: 'GET',
        data: {
          account: account,
          password: password
        },
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        success: function (res) {
          console.log(res.data)
          if (res.data.status==0){
            // wx.navigateTo({
            //   url: '/pages/show/show',
            // })
            wx.setStorageSync('user', res.data)
            wx.switchTab({
              url: '/pages/show/show'
            });  
          } else if(res.data.status == 1){
            wx.showToast({
              title: '帐号已被锁定',
              icon: "none"
            })
          }else{
           
          wx.showToast({
            title: '账号密码错误',
            icon: "none"
               })
          }
          return ;
        },
        fail: function (res) {
          console.log(res.data)
          return res
        }
      })
    }
  }
})
// pages/quick/quick.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
     list:[],
     hiddenmodalput: true,
     title:"",
     describe:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    var users = wx.getStorageSync('user')
    var id = users.id
    wx.request({
      url: app.globalData.api +"/user/selectByUserId", //仅为示例，并非真实的接口地址
      method: 'GET',
      data: {
        userId: id
      },
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        console.log(res)
        that.setData({
          list: res.data,
          hidden: true,
        });

        // wx.showToast({
        //   title: '网络错误',
        //   icon: "none"
        // })

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
    this.onLoad()
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
  
  }
  ,
  show:function(e){
    console.log(e.target.dataset.index)
    var index = e.target.dataset.index
    wx.setStorageSync('quick', this.data.list[index])
    //console.log(wx.setStorageSync('quick')
    wx.navigateTo({
      url: '/pages/quickdetail/quickdetail',
    })
  },
  modalinput: function(){
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
    // setTimeout(function () {
    //  console.log("延迟");
    // }, 2000);
    var that = this
    this.setData({
      hiddenmodalput: true
    })
    var title = this.data.title
    var describe = this.data.describe
    console.log(title)
    console.log(describe)
    var users = wx.getStorageSync('user')
    var id = users.id
    if (title == "" || describe == "" ) {
      wx.showToast({
        title: '请重新确认',
        icon: "none"
      })
      return
    }
 
   
    wx.request({
      url: app.globalData.api +"/user/userQuick", //仅为示例，并非真实的接口地址
      method: 'GET',
      data: {
        title: title,
        userId: id,
        describe: describe
     
      },
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        console.log(res)
        if (res.data == 1) {
          wx.showToast({
            title: '成功',
            icon: "none"
          })
          that.onLoad();

        } else if (res.data == 0) {
          wx.showToast({
            title: '失败',
            icon: "none"
          })

        } else {
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
      title: e.detail.value
    })
  },
  bindTextAreaBlur: function (e) {
    console.log(e.detail.value)
    var that = this;
    that.setData({
      describe: e.detail.value
    })
  },
  getquestion:function(){
    wx.navigateTo({
      url: '/pages/question/question',
    })
  }

})
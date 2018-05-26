var app = getApp()
Page({
  data: {
    list:[]
  },
  onLoad: function (options) {
    var that = this;
    var users = wx.getStorageSync('user')
    var id = users.id
    wx.request({
      url: app.globalData.api +"/user/selectHospitalByUserId", //仅为示例，并非真实的接口地址
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
          list: res.data
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
  //点击按钮痰喘指定的hiddenmodalput弹出框  
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
    this.setData({
      hiddenmodalput: true
    })
  }
  , radioChange: function (e) {
    console.log('radio发生change事件，携带value值为：', e.detail.value)
  }
  ,show:function(e){
    console.log(e.target.dataset.index)
    var index = e.target.dataset.index
    wx.setStorageSync('health', this.data.list[index])
    //console.log(wx.setStorageSync('quick')
    wx.navigateTo({
      url: '/pages/healthdetail/healthdetail',
    })
  }
})  
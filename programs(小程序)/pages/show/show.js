// pages/show/show.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    // text:"这是一个页面"
    list: [],
    dd: '',
    hidden: false,
    page: 1,
    size: 20,
    hasMore: true,
    hasRefesh: false,
    hiddenmodalput: true,
    items:[
     
    ],
    password:"",
    repassword: "",
    date:'',
    time:'',
    statu:0,
    doctorId:""
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    var users = wx.getStorageSync('user')
    var id = users.id
    wx.request({
      url: app.globalData.api +"/user/selectPredictByUserId", //仅为示例，并非真实的接口地址
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

    // var url = 'http://v.juhe.cn/weixin/query?key=f16af393a63364b729fd81ed9fdd4b7d&pno=1&ps=10';
    // network_util._get(url,
    //   function (res) {
    //     that.setData({
    //       list: res.data.list,
    //       hidden: true,
    //     });
    //   }, function (res) {
    //     console.log(res);
    //   });
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
  
  },
  modalinput: function () {
    var that = this;
    //console.log(this.data.doctor);
    wx.request({
      url: app.globalData.api +"/user/listManagerByRole", //仅为示例，并非真实的接口地址
      method: 'GET',
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        console.log(res)
        that.setData({
          items: res.data
        })
        console.log(that.data.items)
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
    var date = this.data.date
    var time = this.data.time
    var statu=this.data.statu
    var docotrId=this.data.doctorId
    var users = wx.getStorageSync('user')
    var id = users.id
    if(time==""||date==""||docotrId==""){
      wx.showToast({
         title: '信息为填完',
         icon: "none"
       })
       return
    }
    console.log(id)
    console.log(date)
    console.log(time)
    console.log(statu)
    console.log(docotrId)
    var datetime=date+"  "+time+":00"
    console.log(datetime)
    wx.request({
      url: app.globalData.api +"/user/addPredic", //仅为示例，并非真实的接口地址
      method: 'GET',
      data: {
        doctorId: docotrId,
        userId: id,
        datetime: datetime,
        statu: statu
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
      password: e.detail.value
    })
  },
  realnameConfirms: function (e) {
    var that = this;
    that.setData({
      repassword: e.detail.value
    })
  },
  redict:function(){
    wx.navigateTo({
      url: '/pages/predict/predict',
    })
  },
  bindDateChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      date: e.detail.value
    })
  },
  bindTimeChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      time: e.detail.value
    })
  },
  radiosChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      statu: e.detail.value
    })
  },
  radioChange: function (e) {
    console.log('picker发送选择改变，携带值为', e.detail.value)
    this.setData({
      doctorId: e.detail.value
    })
  },
})
// pages/question/question.js
var app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
     search:"",
     datalist:[],
     show:false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
     var that=this
     wx.request({
       url: app.globalData.api + "/user/selectSearch", //仅为示例，并非真实的接口地址
       method: 'GET',
       data: {
       },
       header: {
         "Content-Type": "application/x-www-form-urlencoded"
       },
       success: function (res) {
         console.log(res)
         that.setData({
           datalist: res.data,
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
  , showFrom(e) {
    var param = e.target.dataset.param;
    this.setData({
      isShowFrom3: param == 3 ? (this.data.isShowFrom3 ? false : true) : false
    });
  },
  changedetail:function(e){
    var index = e.target.dataset.index
    wx.setStorageSync('question', this.data.datalist[index])
    //console.log(wx.setStorageSync('quick')
    wx.navigateTo({
      url: '/pages/questionDetail/questionDetail',
    })
  },
  bindTextAreaBlur: function (e) {
    console.log(e.detail.value)
    var that = this;
    that.setData({
      search: e.detail.value
    })
  },
  check:function(){
    var that=this
    // if (that.data.search == undefined || that.search==""){
    //   that.setData({
    //    search:""
    //   });
    // }
    console.log(that.data.search)
    wx.request({
      url: app.globalData.api + "/user/selectSearch", //仅为示例，并非真实的接口地址
      method: 'GET',
      data: {
        search: that.data.search
      },
      header: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      success: function (res) {
        console.log(res)
        if (res.statusCode=200){
          that.setData({
            datalist: res.data,
          });
          if(res.data.length==0){
            that.setData({
              show: true,
            });
          }
        }
      
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
    console.log(this.data.search)
  }
})
App.repositories = App.cable.subscriptions.create("RepositoriesChannel", {
  connected: function () {
    return setTimeout((function (_this) {
      return function () {
        return _this.checkRepositoriesUpdate();
      };
    })(this), 1000);
  },
  checkRepositoriesUpdate: function () {
    return this.perform('follow');
  },
  disconnected: function () {
    return this.perform('unfollow');
  },
  received: function (data) {
    if (data.html) {
      $('#notice').text('');
      $('#repositories-grid').html(data.html);
    } else if(data.message != null) {
      $('#notice').text(data.message);
    }
  }
});
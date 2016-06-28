$(document).ready(function() {

  var logs = [];
  var score;

  // if (localStorage.score) {
  //   var score = parseInt(localStorage.score);
  // } else {
  //   getVotes()
  // }

  var getVotes = function(){
    $.ajax("/sandboxes/1/votecount.json", {
      success: function(data) {
        console.log(data)
        score = data.count

        displayVotes()

      },
      error: function() { alert("Cant get vote count!") }
    })

  }

  var displayVotes = function(){

    var votes = $("#votes")

    if (score > 10) {
      votes.addClass("overTen")
    }
    if (score <= 10){
      votes.removeClass("overTen")
    }

    votes.text( (score) )
    localStorage.score = score;
  }

  var resetVoteCount = function(){

    $.ajax("/sandboxes/1/reset.json", {
      method: "PATCH",
      success: function(data) {
        alert(data.message)
        getVotes()
       },
      error: function() { alert("Something went wrong!") }
    })
  }

  var resetLogs = function(){

    logs = []

  }


  $("#up-vote").click(function() {

    $.ajax("/sandboxes/1/like.json", {
      method: "PUT",
      success: function() {
        getVotes() },
      error: function() { alert("No upvotes for you!") }
    })

  })

  $("#down-vote").click(function() {

    $.ajax("/sandboxes/1/dislike.json", {
      method: "PUT",
      success: function() {
        alert("Vote Posted!")
        getVotes()
      },
      error: function() { alert("go downvote yourself!") }
    })

  })

  $("#reset").click(function() {

    now = new Date();
    var date = now.toLocaleDateString();
    var time = now.toLocaleTimeString();

    logs.push("Reset from " + score + " at " + time + " on " + date)

    var item = $("<li class='record'>")
    item.append( $("<span>").text("Reset from " + score + " at " + time + " on " + date ))

    $(".vote-list").prepend( item )

    resetVoteCount()

  })

  $("#clear-logs").click(function() {
    var items = $(".record")
    items.remove()
    // items.empty()

    localStorage.logs = logs

    resetLogs()
  })

  getVotes()


})

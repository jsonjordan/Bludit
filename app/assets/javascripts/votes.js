
//
//
//
// var computeVoteCount = function(change){
//
//   var votes = $("#votes")
//
//   change = parseInt(change)
//
//   score += change
//
//   if (score > 10) {
//     votes.addClass("overTen")
//   }
//   if ((score <= 10) && (votes.hasClass("overTen"))){
//     votes.removeClass("overTen")
//   }
//
//   votes.text( (score) )
// }
//
// var resetVoteCount = function(){
//
//   score = init
// }

$(document).ready(function() {

  var init = parseInt(count);

  var logs = [];

  if (localStorage.score) {
    var score = parseInt(localStorage.score);
  } else {
    var score = init;
  }

  var computeVoteCount = function(change){

    var votes = $("#votes")

    change = parseInt(change)

    score += change

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

    score = init
  }

  var resetLogs = function(){

    logs = []

  }


  $("#up-vote").click(function() {
    console.log("up vote clicked")

    contents = $("#up-vote")

    vote = contents.val()

    computeVoteCount(vote)

  })

  $("#down-vote").click(function() {
    console.log("down vote clicked")

    contents = $("#down-vote")

    vote = contents.val()

    computeVoteCount(vote)
  })

  $("#reset").click(function() {

    now = new Date();
    var date = now.toLocaleDateString();
    var time = now.toLocaleTimeString();

    var contents = $("#votes")

    var voteCount = contents.text()

    logs.push("Reset from " + voteCount + " at " + time + " on " + date)

    console.log(logs)

    var item = $("<li class='record'>")
    item.append( $("<span>").text("Reset from " + voteCount + " at " + time + " on " + date ))

    $(".vote-list").prepend( item )

    resetVoteCount()
    computeVoteCount(0)


  })

  $("#clear-logs").click(function() {
    var items = $(".record")
    items.remove()
    // items.empty()

    localStorage.logs = logs

    resetLogs()
  })

  computeVoteCount(0)

})

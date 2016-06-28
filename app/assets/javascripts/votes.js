
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

  var computeVoteCount = function(){

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

    score = init
  }

  var resetLogs = function(){

    logs = []

  }


  $("#up-vote").click(function() {

    score += 1

    computeVoteCount()

  })

  $("#down-vote").click(function() {

    score -= 1

    computeVoteCount()
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
    computeVoteCount()


  })

  $("#clear-logs").click(function() {
    var items = $(".record")
    items.remove()
    // items.empty()

    localStorage.logs = logs

    resetLogs()
  })

  computeVoteCount()

})

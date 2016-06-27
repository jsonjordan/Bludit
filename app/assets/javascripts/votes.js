
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

  var score = parseInt(count);
  var init = parseInt(count);



  var computeVoteCount = function(change){

    var votes = $("#votes")

    change = parseInt(change)

    score += change

    if (score > 10) {
      votes.addClass("overTen")
    }
    if ((score <= 10) && (votes.hasClass("overTen"))){
      votes.removeClass("overTen")
    }

    votes.text( (score) )
  }

  var resetVoteCount = function(){

    score = init
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

    var item = $("<li class='record'>")
    item.append( $("<span>").text("Reset from " + voteCount + " at " + time + " on " + date ))

    $(".vote-list").prepend( item )

    resetVoteCount()
    computeVoteCount(0)


  })

  $("#clear-logs").click(function() {
    var items = $(".record")
    items.remove()
  })

  computeVoteCount(0)

})

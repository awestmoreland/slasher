<?php

  /*
  =======================================
    SLASHBOT
  =======================================
  */

  include './_valid_tokens.inc';

  if(in_array($_POST['token'], $valid_tokens)) {

    $token          = $_POST['token'];
    $team_id        = $_POST['team_id'];
    $team_domain    = $_POST['team_domain'];
    $channel_id     = $_POST['channel_id'];
    $channel_name   = $_POST['channel_name'];
    $user_id        = $_POST['user_id'];
    $user_name      = $_POST['user_name'];
    $command        = $_POST['command'];
    $response_url   = $_POST['response_url'];

    // only urlencode &, < and > (not whole string). Order is important here!
    // More info at: https://api.slack.com/docs/formatting#how_to_escape_characters
    $text           = $_POST['text'];
              $text = str_replace("&", "&amp;", $text);
              $text = str_replace("<", "&lt;", $text);
              $text = str_replace(">", "&gt;", $text);


    $new_path = getcwd();
    set_include_path(get_include_path() . PATH_SEPARATOR . $new_path);

    // Include common functions
    include './_common_functions.inc';

    // Include Slackbot's commands
    include './team_status/_iam.cmd';
    include './team_status/_sup.cmd';


  }
  else { // bad token or none supplied
    echo "Not digging it :(";
  }


?>
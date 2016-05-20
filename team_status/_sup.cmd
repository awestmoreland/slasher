<?php

/*
=======================================
  /sup [@team-member]

  Get the most recent status of team member, e.g.
  /sup @andy
=======================================
*/

if($command == "/sup") {

  if($text != "") {

    $handle = fopen($status_file, 'r'); // open file for read
    $team_status = json_decode(fread($handle,filesize($status_file)), true); // read statuses from file
    fclose($handle); // close file

    $arr = explode(' ', trim($text, "@"));
    $team_member = $arr[0];

    if(array_key_exists($team_member, $team_status)) {

      $last_status = $team_status[$team_member]['status'];
      $last_update = $team_status[$team_member]["timestamp"];
      $now = time();
      $time_since_last_update = time_elapsed($now-$last_update);

      // create response
      $response = "Last I heard, @$team_member was $last_status, but that was $time_since_last_update ago.";

    }
    else {

      // create response
      $response = "Sorry, I don't have any information about @$team_member ¯\_(ツ)_/¯";

    }

    respond($response_url, $response);

  }
  else {

    respond_no_data($response_url);

  }

} // end /sup

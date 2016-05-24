<?php

/*
=======================================
  /sup [@team-member]

  Get the most recent status of team member, e.g.
  /sup @andy
=======================================
*/

include_once './team_status/team_status.settings';

if($command == "/sup") {

  $handle = fopen($status_file, 'r'); // open file for read
  $team_status = json_decode(fread($handle,filesize($status_file)), true); // read statuses from file
  fclose($handle); // close file

  if($text != "") {

    $arr = explode(' ', trim($text, "@"));
    $team_member = $arr[0];

    if(array_key_exists($team_member, $team_status)) {

      $last_status = $team_status[$team_member]['status'];
      $last_update = $team_status[$team_member]["timestamp"];
      $time_since_last_update = time_elapsed_since($last_update);

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

    // no team member was passed, so return status for all team members

    sksort($team_status, "timestamp"); // sort statuses by timestamp

    $all_team_statuses = "";
    foreach ($team_status as $member => $status_update) {
      $update      = $status_update['status'];
      $timestamp   = $status_update['timestamp'];
      $time_since_last_update = time_elapsed_since($timestamp);

      $all_team_statuses .= "*$member* was $update $time_since_last_update\n";
    }

    respond($response_url, $all_team_statuses);

  }

} // end /sup

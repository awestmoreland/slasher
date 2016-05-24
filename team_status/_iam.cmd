<?php

/*
=======================================
  /iam [status]

  Set my status, e.g.
  /iam going to lunch
=======================================
*/

include_once './team_status/team_status.settings';

if($command == "/iam") {

  if($text != "") {

    $handle = fopen($status_file, 'r'); // open file for read
    $team_status = json_decode(fread($handle,filesize($status_file)), true); // read statuses from file
    fclose($handle); // close file

    $team_status[$user_name]["status"] = $text; // update (or add) status for team member in array
    $team_status[$user_name]["timestamp"] = time(); // update (or add) status for team member in array
    $team_status = json_encode($team_status); // encode status array

    $handle = fopen($status_file, 'w'); // open file for write and truncate
    fwrite($handle, $team_status); // write team status array
    fclose($handle); // close file


    // respond to Slack
    $response = "*Status update:* $user_name is $text";
    respond($response_url, $response, true);

  }
  else {

    respond_no_data($response_url);

  }

} // end /iam

?>
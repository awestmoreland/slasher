<?php

  function respond($response_url, $response, $public = false) {

    $data = array(
      "response_type" => $public == true ? "in_channel" : "ephemeral",
      "text"          => $response,
    );

    $data_string = json_encode($data);

    $ch = curl_init($response_url);
          curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
          curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
          curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($data_string))
          );

    $result = curl_exec($ch);

  } // function respond()


  function user_emoji($username) {
    global $user_emojis, $user_emoji_prefix;
    return $user_emojis ? ":$user_emoji_prefix$username:" : "";
  }


  function respond_no_data($response_url) {

    // respond to Slack
    $response = "C'mon... gimme something to work with here!";
    respond($response_url, $response);

  } // function respond_no_data()



  function time_elapsed_since($previous){

    $now = time();
    $secs = $now-$previous;

    $bit = array(
        ' year'        => $secs / 31556926 % 12,
        ' week'        => $secs / 604800 % 52,
        ' day'        => $secs / 86400 % 7,
        ' hour'        => $secs / 3600 % 24,
        ' minute'    => $secs / 60 % 60,
        ' second'    => $secs % 60
        );

    foreach($bit as $k => $v){
        if($v > 1)$ret[] = $v . $k . 's';
        if($v == 1)$ret[] = $v . $k;
        }
    array_splice($ret, count($ret)-1, 0, 'and');
    $ret[] = 'ago.';

    return join(' ', $ret);
  } // function time_elapsed()



  // Sort multidimensional array by subarray key
  function sksort(&$array, $subkey="id", $sort_ascending=false) {

    if (count($array)) {
      $temp_array[key($array)] = array_shift($array);
    }

    foreach($array as $key => $val) {
      $offset = 0;
      $found = false;
      foreach($temp_array as $tmp_key => $tmp_val) {
        if(!$found and strtolower($val[$subkey]) > strtolower($tmp_val[$subkey])) {
          $temp_array = array_merge(
            (array)array_slice($temp_array,0,$offset),
            array($key => $val),
            array_slice($temp_array,$offset)
          );
          $found = true;
        }
        $offset++;
      }
      if(!$found) {
        $temp_array = array_merge($temp_array, array($key => $val));
      }
    }

    if ($sort_ascending) {
      $array = array_reverse($temp_array);
    }
    else {
      $array = $temp_array;
    }

  } // function sksort()

?>
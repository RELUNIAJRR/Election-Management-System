<html>
   
   <head>
      <title>Sending HTML email using PHP</title>
   </head>
   
   <body>
      
      <?php
         $to_email = "theresamasapol@gmail.com";
         $subject = "This is subject";
         
         $body = "<b>This is HTML message.</b>";
         $body .= "<h1>This is headline.</h1>";
         
         $headers = "From:abc@somedomain.com \r\n";
         $headers .= "Cc:afgh@somedomain.com \r\n";
         
         $retval = mail ($to_email,$subject,$body,"From: theresamasapol@gmail.com");
         
         if( $retval == true ) {
            echo "Message sent successfully...";
         }else {
            echo "Message could not be sent...";
         }
      ?>
      
   </body>
</html>
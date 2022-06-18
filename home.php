<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
    <?php include 'includes/menubar.php'; ?>
   
    <div class="content-wrapper">
      <div class="container">

        <!-- Main content -->
        <section class="content ">
        <?php
            $parse = parse_ini_file('admin/config.ini', FALSE, INI_SCANNER_RAW);
          $title = $parse['election_title'];
          ?>
          <h1 class="page-header text-center title"><b><?php echo strtoupper($title); ?></b></h1>
      <div class="text-center">
        <?php

        echo "<img src='image-name.png' >"; 

        ?>  
       </div> 

          <?php
              $sql = "SELECT * FROM votes WHERE voters_id = '".$voter['id']."'";
              $vquery = $conn->query($sql);
              if($vquery->num_rows > 0){
                ?>
                <div class="text-center">
                  <h3>You have already voted for this election. Thank You!</h3>
                  <a href="#view" data-toggle="modal" class="btn btn-flat btn-primary btn-lg">View Ballot</a>
                </div>
                <?php
              }
              else{
                ?>
                <div class="text-center">
                   
                   <br>

                </div>
                <div class = "text-center">
                    <button  type="button" style="font-size:30px" class="btn bg-white btn-flat" id="votenow"><a href = "vote.php" style='background-color:lightblue;' ><i class="fa fa-pencil-square-o"></i> VOTE NOW</a></button> 
                </div>

                <div class = "text-center">
                    <button  type="button" style="font-size:30px" class="btn bg-white btn-flat" id="votenow"><a href = "candidates.php" style='background-color:lightgray;' ><i class="fa fa-black-tie"></i> VIEW CANDIDATES</a></button> 
                </div>
         
                <?php
              }

            ?>

     
        </section>
       
      </div>
    </div>
  
    <?php include 'includes/footer.php'; ?>
    <?php include 'includes/ballot_modal.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>
<script>

$(function(){
  $('.content').iCheck({
    checkboxClass: 'icheckbox_flat-green',
    radioClass: 'iradio_flat-green'
  });

  $(document).on('click', '.reset', function(e){
      e.preventDefault();
      var desc = $(this).data('desc');
      $('.'+desc).iCheck('uncheck');
  });

  $(document).on('click', '.platform', function(e){
    e.preventDefault();
    $('#platform').modal('show');
    var platform = $(this).data('platform');
    var fullname = $(this).data('fullname');
    $('.candidate').html(fullname);
    $('#plat_view').html(platform);
  });

  $('#preview').click(function(e){
    e.preventDefault();
    var form = $('#ballotForm').serialize();
    if(form == ''){
      $('.message').html('You must vote atleast one candidate');
      $('#alert').show();
    }
    else{
      $.ajax({
        type: 'POST',
        url: 'preview.php',
        data: form,
        dataType: 'json',
        success: function(response){
          if(response.error){
            var errmsg = '';
            var messages = response.message;
            for (i in messages) {
              errmsg += messages[i]; 
            }
            $('.message').html(errmsg);
            $('#alert').show();
          }
          else{
            $('#preview_modal').modal('show');
            $('#preview_body').html(response.list);
          }
        }
      });
    }
    
  });

});

</script>

</body>
</html>


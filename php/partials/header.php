<?php 
namespace partials;

use lib\Auth;
use lib\Msg;

function header() {
?>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="<?php echo BASE_IMAGE_PATH; ?>icandoit-rogo.png">
        <title>We can do IT-アイティ-！</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=RocknRoll+One&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<?php echo BASE_CSS_PATH; ?>style.css">
    </head>
    <body>
        <div id="container">
            <header class="container my-5">
                <nav class="row align-items-center py-2">
                    <a href="<?php the_url('/'); ?>" class="col-md d-flex align-items-center mb-3 mb-md-0">
                        <img width="70" class="mr-2" src="<?php echo BASE_IMAGE_PATH; ?>wecandoit-siterogo.png" alt="We can do IT！　サイトロゴ">
                        <img width="300" class="mr-2" src="<?php echo BASE_IMAGE_PATH; ?>title.png" alt="サイトタイトル">
                        <?php // <span class="h2 font-weight-bold mb-0">We can do IT！</span> ?>
                    </a>
                    <div class="col-md-auto">
                        <?php if(Auth::isLogin()) : ?>
                            <?php // ログインしているとき ?>
                            <a href="<?php the_url('topic/create'); ?>" class="btn btn-primary mr-2">投稿</a>
                            <a href="<?php the_url('topic/archive'); ?>" class="mr-2">過去の投稿</a>
                            <a href="<?php the_url('logout'); ?>">ログアウト</a>
                        <?php else: ?>
                            <a href="<?php the_url('register'); ?>" class="btn btn-primary mr-2">登録</a>
                            <a href="<?php the_url('login'); ?>">ログイン</a>
                        <?php endif; ?>
                    </div>
                </nav>
            </header>
            <main class="container py-3">
<?php 

    Msg::flush(); 
}

?>
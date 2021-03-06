<?php 
namespace view\register;

function index() {
?>
<h1 class="sr-only">アカウント登録</h1>
<div class="mt-5">
    <div class="text-center mb-4">
        <img width="300" src="<?php echo BASE_IMAGE_PATH; ?>login-rogo.png" alt="We can do IT(アイティ)！　サイトロゴ">
    </div>
    <div class="login-form bg-white p-4 shadow mx-auto rounded">
        <form class="validate-form" action="<?php echo CURRENT_URI; ?>" method="POST" novalidate autocomplete="off">
            <div class="form-group">
                <label for="id">ユーザーID</label>
                <input id="id" type="text" name="id" class="form-control validate-target" minlength="4" required maxlength="10" pattern="[a-zA-Z0-9]+" autofocus tabindex="1"/>
                <div class="invalid-feedback"></div>
            </div>
            <div class="form-group">
                <label for="pwd">パスワード</label>
                <input id="pwd" type="password" name="pwd" minlength="4" required tabindex="2" pattern="[a-zA-Z0-9]+" class="form-control validate-target" />
                <div class="invalid-feedback"></div>
            </div>
            <div class="form-group">
                <label for="nickname">ニックネーム</label>
                <input id="nickname" type="text" name="nickname" class="form-control validate-target" required maxlength="10"  tabindex="3">
                <div class="invalid-feedback"></div>
            </div>
            <div class="d-flex align-items-center justify-content-between">
                <div>
                    <a href="<?php the_url('login'); ?>">ログインへ</a>
                </div>
                <div tabindex="4">
                    <input type="submit" value="登録" class="btn btn-primary shadow">
                </div>
            </div>
        </form>
    </div>
</div>
<?php } ?>

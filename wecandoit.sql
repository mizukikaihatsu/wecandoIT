--
--
DROP USER mizuki@localhost;

SET NAMES cp932;

DROP DATABASE IF EXISTS wecandoit;
CREATE DATABASE wecandoit DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE wecandoit;

/* ユーザーに権限の付与 */
CREATE USER IF NOT EXISTS 'mizuki'@'localhost' IDENTIFIED BY 'pwd';
GRANT ALL ON wecandoit.* TO 'mizuki'@'localhost';

--
--

--
-- コメントのテーブル
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'コメントID',
  `topic_id` int(10) NOT NULL COMMENT 'トピックID',
  `agree` int(1) NOT NULL COMMENT '賛否（そう思う！: 1, それ以外！: 0）',
  `body` varchar(100) DEFAULT NULL COMMENT '本文',
  `user_id` varchar(10) NOT NULL COMMENT '作成したユーザーID',
  `del_flg` int(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ(1: 削除、0: 有効)',
  `updated_by` varchar(20) NOT NULL DEFAULT 'wecandoit' COMMENT '最終更新者',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最終更新日時'
);

--
-- トピックのテーブル
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT 'トピックID',
  `title` varchar(30) NOT NULL COMMENT 'トピック本文',
  `published` int(1) NOT NULL COMMENT '公開状態(1: 公開、0: 非公開)',
  `views` int(10) NOT NULL DEFAULT '0' COMMENT 'PV数',
  `likes` int(10) NOT NULL DEFAULT '0' COMMENT 'そう思う！数',
  `dislikes` int(10) NOT NULL DEFAULT '0' COMMENT 'それ以外！数',
  `user_id` varchar(10) NOT NULL COMMENT '作成したユーザーID',
  `del_flg` int(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ(1: 削除、0: 有効)',
  `updated_by` varchar(20) NOT NULL DEFAULT 'wecandoit' COMMENT '最終更新者',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最終更新日時'
);

--
-- ユーザーのテーブル
--

CREATE TABLE `users` (
  `id` varchar(10) PRIMARY KEY COMMENT 'ユーザーID',
  `pwd` varchar(60) NOT NULL COMMENT 'パスワード',
  `nickname` varchar(10) NOT NULL COMMENT '画面表示用名',
  `del_flg` int(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ(1: 削除、0: 有効)',
  `updated_by` varchar(20) NOT NULL DEFAULT 'wecandoit' COMMENT '最終更新者',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最終更新日時'
);

START TRANSACTION;

SET time_zone = "+09:00";

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `topic_id`, `agree`, `body`, `user_id`, `del_flg`) VALUES
(1, 1, 0, 'Goの評価は二分すると思います...', 'test', 0),
(2, 1, 1, 'こちらの記事とかいかがでしょう。https://zenn.dev/nobonobo', 'test', 0),
(3, 1, 0, 'map, reduceのような機能がない', 'test', 0),
(4, 1, 0, 'JSON などの外部リソースを扱うときに構造体が必要', 'test', 0),
(5, 1, 0, 'コードの記述量が多い！', 'test', 0),
(6, 1, 1, '僕は好きでも嫌いでもないですが、現時点のWeb業界のバックエンドではGoを使えるとキャリア形成が有利になりやすいというのは事実', 'test', 0),
(7, 1, 1, 'トレンドは「とりあえず学習。流行りが終わったら捨てよう」という姿勢で良いのではないかなと', 'test', 0),
(8, 1, 1, '同感。一番よくないのはトレンドに乗らないこと', 'test', 0),
(9, 2, 0, '好みの問題と思いますが私はバックエンドを中心とした学習をしています', 'test', 0),
(10, 2, 1, 'はい。現在は「SPA」がトレンドになっているので。', 'test', 0),
(11, 2, 1, '僕はフロントエンド開発にもフルスタックで対応出来る人を目指して勉強してます！', 'test', 0),
(12, 3, 0, 'ほとんどのサービス開発はバックエンドのタスクがもっとも大きくなります', 'test', 0),
(13, 3, 0, 'バックエンドエンジニアの知識は必須', 'test', 0),
(14, 3, 0, 'バックエンドを中心にしてそれ以外の分野も担当できる人を目指した方が...', 'test', 0),
(15, 3, 1, '希少なスマホアプリエンジニアになろう', 'test', 0),
(16, 4, 0, '今からやるならiOSとAndroid両方作れるFlutterがおすすめです！', 'test', 0),
(17, 4, 1, 'SwiftUIを使って、簡単にUI作れるので直感的にいいかなと思います。', 'test', 0),
(18, 4, 1, '僕の知る限り、Swiftに関して国内で一番詳しいエンジニアが集う場: "わいわいswiftc" https://iosdiscord.connpass.com', 'test', 0),
(19, 4, 1, 'こちらもおすすめコミュニティ: https://medium.com/swift-column/discord-ios-20d586e373c0', 'test', 0),
(20, 4, 0, '何をやりたいかによって、そもそもSwiftを学ぶのが最短なのか結論変わると思いました。', 'test', 0),
(21, 4, 0, 'Webも同時に開発できるFlutterがおすすめです。', 'test', 0),
(22, 4, 0, 'swiftは言語を覚えるというよりmac/iosに特化した開発の手法を知るということになるかと', 'test', 0),
(23, 4, 1, '参考にしてね！国内最大のカンファレンス: https://twitter.com/iosdcjp', 'test', 0),
(24, 4, 0, 'まずモバイルアプリ開発以外を極めよう！', 'test', 0);

--(7, 4, 0, 'エラー解決の時には「自分で考える癖」をつけましょう！', 'test', 0),
--(7, 4, 0, '初学者は質問OK。けれどその時、少し自分で仮説を立てたり考えたりしてみましょう。', 'test', 0),
--(7, 4, 0, '考える癖をつけることで、いつまでも聞くあなたから脱却し、自己解決できる経験を積むことができます。', 'test', 0),
--(7, 4, 1, '勝手にいじることが一番いけないことです。取り返しがつかなくなることも', 'test', 0),
--
-- トピック
--

INSERT INTO `topics` (`id`, `title`, `published`, `views`, `likes`, `dislikes`, `user_id`, `del_flg`) VALUES
(1, 'Go言語は使った方がいい?', 1, 25, 4, 4, 'test', 0),
(2, 'VueやReactを学習した方がいい?', 1, 9, 2, 1, 'test', 0),
(3, 'バックエンドエンジニアはレッドオーシャン?避けた方がいい?', 1, 21, 1, 3, 'test', 0),
(4, 'iOS App開発志望ならSwift？', 1, 38, 4, 5, 'test', 0);
--(5, 'エラーが発生したらすぐ質問するのを推奨してる？', 1, 38, 4, 5, 'test', 0),

--
-- ユーザー
--

INSERT INTO `users` (`id`, `pwd`, `nickname`, `del_flg`) VALUES
('test', '$2y$10$n.PPvod4ai0r0qpqn5DurenOoxTyRhvef3S7DxoMu5BLRspG5oiBK', 'ミズキ', 0);


COMMIT;


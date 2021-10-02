<?php

namespace model;

use lib\Msg;

class CommentModel extends AbstractModel
{

    public int $id;
    public int $topic_id;
    public string $user_id;
    public int $del_flg;
    public string $body;
    public string $agree;
    public string $nickname;

    public function isValidAgree()
    {
        return static::validateAgree($this->agree);
    }

    public static function validateAgree($val)
    {

        $res = true;

        if (!isset($val)) {
            Msg::push(Msg::ERROR, 'そう思う！かそれ以外！か選択してください。');

            // publishedが0、または1以外の時
            if (!($val == 0 || $val == 1)) {
                Msg::push(Msg::ERROR, 'そう思う！かそれ以外！、どちらかの値を選択してください。');
            }

            $res = false;
        }

        return $res;

    }

    public function isValidBody() {
        return static::validateBody($this->body); 
    }

    public static function validateBody($val)
    {
        $res = true;

        if (mb_strlen($val) > 250) {

            Msg::push(Msg::ERROR, 'コメントは250文字以内で入力してください。');
            $res = false;

        }

        return $res;
    }

    public function isValidTopicId() {
        return TopicModel::validateId($this->topic_id);
    }
}

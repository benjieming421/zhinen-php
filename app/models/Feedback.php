<?php

namespace app\models;

use fastphp\base\Model;
use fastphp\db\Db;


class Feedback extends Model
{

    protected $table = 'studys_feedback';

    public function index()
    {
        $sql = "select * from `$this->table`";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();
    }

    public function search_data($search_time)
    {
        $sql = "select * from `$this->table` where createtime>='$search_time->begin' and createtime<='$search_time->end';";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();
    }
}

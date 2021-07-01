<?php

namespace app\models;

use fastphp\base\Model;
use fastphp\db\Db;


class Personal extends Model
{

    protected $table = 'studys_user_resource';

    public function index($userid)
    {
        // $sql = "select * from `$this->table`";
        $sql = "SELECT * FROM `$this->table` WHERE userid='$userid'";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();
    }
}

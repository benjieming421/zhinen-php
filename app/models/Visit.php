<?php

namespace app\models;

use fastphp\base\Model;
use fastphp\db\Db;


class Visit extends Model
{

    protected $table = 'studys_visitor';

    public function index()
    {
        $sql = "select * from `$this->table`";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();
    }
}

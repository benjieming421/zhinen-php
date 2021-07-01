<?php

namespace app\models;

use fastphp\base\Model;
use fastphp\db\Db;


class Learn extends Model
{

    protected $table = 'studys_learn';

    public function index()
    {
        $sql = "select * from `$this->table`";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();
    }

    public function search($keyword)
    {
        $sql = "select * from `$this->table` where `reName` like :keyword";
        $sth = Db::pdo()->prepare($sql);
        $sth = $this->formatParam($sth, [':keyword' => "%$keyword%"]);
        $sth->execute();

        return $sth->fetchAll();
    }
}

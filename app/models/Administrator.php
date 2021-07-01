<?php

namespace app\models;

use fastphp\base\Model;
use fastphp\db\Db;


class Administrator extends Model
{

    protected $table = 'studys_administrator';

    public function index()
    {
        $sql = "select * from `$this->table`";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();
    }

    public function insert_user($data)
    {
        $sql = "INSERT INTO `$this->table` (managerName, managerTelphone, managerPw) VALUES ('$data->managerName','$data->mTelphone','$data->managerPw')";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->rowCount();
    }

    public function select_user($data)
    {
        $sql = "SELECT * FROM `$this->table` WHERE managerName='$data->name'";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetch();
    }

    public function search($keyword)
    {
        $sql = "select * from `$this->table` where `managerName` like :keyword";
        $sth = Db::pdo()->prepare($sql);
        $sth = $this->formatParam($sth, [':keyword' => "%$keyword%"]);
        $sth->execute();

        return $sth->fetchAll();
    }

    public function change_password($data)
    {
        $pass = $data['managerPw'];
        $id = $data['managerName'];
        $sql = "UPDATE `$this->table` SET managerPw='$pass' WHERE managerName='$id'";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->rowCount();
    }
}

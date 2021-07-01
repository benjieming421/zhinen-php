<?php

namespace app\models;

use fastphp\base\Model;
use fastphp\db\Db;
use PDO;
use PDOException;


class User extends Model
{

    protected $table = 'studys_user';

    public function index()
    {
        $sql = "select * from `$this->table`";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();
    }

    public function insert_user($data)
    {
        $db = new PDO("mysql:host=localhost;dbname=studysystem", "root", "123456");
        $db->query("set names utf8");
        $sql = "INSERT INTO `$this->table` (name, password, education, phone, email) VALUES ('$data->name','$data->password','$data->education','$data->phone','$data->email')";
        $db->exec($sql);
        return $db->lastInsertId();
    }


    public function select_user($data)
    {
        $sql = "SELECT * FROM `$this->table` WHERE name='$data->name'";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetch();
    }

    public function change_password($data)
    {
        $pass = $data['password'];
        $id = $data['id'];
        $sql = "UPDATE `$this->table` SET password='$pass' WHERE id='$id'";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->rowCount();
    }
}

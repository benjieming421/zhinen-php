<?php
namespace app\models;

use fastphp\base\Model;
use fastphp\db\Db;


class Calendar extends Model{
    
    protected $table = 'studys_agency';

    public function index(){
        $sql = "select * from `$this->table`";
        $sth = Db::pdo()->prepare($sql);
        $sth->execute();
        return $sth->fetchAll();
    }

    public function del($data){
        $sql_del = "DELETE FROM `$this->table` WHERE id = $data";
        $sth = Db::pdo()->prepare($sql_del);
        $sth->execute();
        return $sth->rowCount();
    }
}
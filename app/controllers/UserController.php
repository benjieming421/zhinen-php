<?php

namespace app\controllers;

use fastphp\base\Controller;
use app\models\Feedback;
use app\models\Calendar;
use app\models\Resource;
use app\models\Opinion;
use app\models\User;
use app\models\Administrator;
use app\models\Videos;
use app\models\Personal;
use app\models\Visit;

class UserController extends Controller
{

    //feedback模块数据返回

    //返回所有数据
    public function index()
    {
        $items = (new Feedback())->index();
        exit(json_encode($items));
    }
    //添加反馈意见
    public function text()
    {
        $post_data = $_GET;
        if ($post_data['ideaUtext'] == "") {
            exit('请输入内容');
        }
        $items = (new Feedback)->add($post_data);
        echo $items;
    }


    //learn模块数据返回

    public function learn_index()
    {
        $items = (new Resource())->index();
        exit(json_encode($items));
    }

    //calendar模块数据添加
    public function calendar_add()
    {
        $post_data = $_GET;
        if ($post_data['content'] == "") {
            exit('请输入内容');
        }
        $items = (new Calendar)->add($post_data);
        echo $items;
    }

    //calendar模块数据返回
    public function calendar_index()
    {
        $items = (new Calendar())->index();
        exit(json_encode($items));
    }

    //calendar模块数据删除
    public function calendar_del()
    {
        $post_data = $_GET;
        if ($post_data['id'] == "") {
            exit('请输入内容');
        }
        $items = (new Calendar())->del($post_data['id']);
        echo $items;
    }

    //calendar模块数据更新
    public function calendar_update()
    {
        $post_data = $_GET;
        if ($post_data['id'] == "") {
            exit('请输入内容');
        }
        $items = (new Calendar)->update($post_data);
        echo $items;
    }

    //Resource模块返回全部数据
    public function resource_index()
    {
        $items = (new Resource())->index();
        exit(json_encode($items));
    }

    //Opinion模块返回全部数据
    public function opinion_index()
    {
        $items = (new Opinion())->index();
        exit(json_encode($items));
    }


    //Opinion模块数据添加
    public function opinion_add()
    {
        $post_data = $_GET;
        if ($post_data['ideaUtext'] == "") {
            exit('请输入内容');
        }
        $items = (new Opinion)->add($post_data);
        echo $items;
    }

    public function user_data()
    {
        $items = (new User())->index();
        exit(json_encode($items));
    }

    //Register用户注册
    public function register()
    {
        $access_to_information = json_decode($_GET['user']);
        $record_formal_school = ["专科", "本科", "硕士", "博士"];
        $access_to_information->education = $record_formal_school[$access_to_information->education];
        //添加到数据库
        //stdclass转数组 
        $items = (new User())->insert_user($access_to_information);
        echo json_encode($items);
    }

    //用户登录接口
    public function userlogin()
    {
        //输入的
        $access_to_information = json_decode($_GET['user']);
        //数据库的
        $items = (new User())->select_user($access_to_information);
        if (!$items) {
            exit('登录失败,没有找到用户');
        }
        if ($items['password'] != $access_to_information->password) {
            exit('密码错误');
        }
        echo json_encode(['登录成功', $items]);
    }



    //Administrator模块返回全部数据
    public function administrator_index()
    {
        $items = (new Administrator())->index();
        exit(json_encode($items));
    }

    //管理员添加
    public function administrator_insert()
    {
        $access_to_information = json_decode($_GET['user']);
        $items = (new Administrator())->insert_user($access_to_information);
        echo $items;
    }

    //管理员登录接口
    public function administrator_login()
    {
        //输入的
        $access_to_information = json_decode($_GET['user']);
        //数据库的
        $items = (new Administrator())->select_user($access_to_information);
        if (!$items) {
            exit('登录失败,没有找到用户');
        }
        if ($items['managerPw'] != $access_to_information->password) {
            exit('密码错误');
        }
        exit('登录成功');
    }

    public function feedback_search()
    {
        $search_time = json_decode($_GET['search']);
        $items = (new Feedback)->search_data($search_time);
        echo json_encode($items);
    }

    public function resource_search()
    {
        $search_str = $_GET['search'];
        $items = (new Resource)->search($search_str);
        echo json_encode($items);
    }

    //resource添加数据
    public function resource_add()
    {
        $date = json_decode($_GET['date'], true);
        $items = (new Resource)->add($date);
        $arr = [];
        $arr['title'] = $date['reName'];
        $arr['videosrc'] = $date['reNet'];
        $arr['videoimg'] = $date['rePicture'];
        $arr['type'] = $date['type'];
        $itemx = (new Videos())->add($arr);
    }

    public function visitor_add(){
        $date = json_decode($_GET['data'], true);
        $items = (new Visit)->add($date);
    }

    public function personal_add()
    {
        $date = json_decode($_GET['date'], true);
        $arr = [];
        $arr['title'] = $date['title'];
        $arr['videosrc'] = $date['videosrc'];
        $arr['videoimg'] = $date['videoimg'];
        $arr['type'] = $date['type'];
        $arr['userid'] = $date['userid'];
        $itemx = (new Personal())->add($arr);
    }

    //管理员搜索
    public function administrator_search()
    {
        $search_str = $_GET['search'];
        $items = (new Administrator)->search($search_str);
        echo json_encode($items);
    }

    //
    public function opinion_search()
    {
        $search_time = json_decode($_GET['search']);
        $items = (new Opinion)->search_data($search_time);
        echo json_encode($items);
    }

    //videos模块返回全部数据
    public function videos_index()
    {
        $items = (new Videos())->index();
        exit(json_encode($items));
    }



    //personal模块返回全部数据
    public function personal_index()
    {
        $userid = $_GET['date'];
        $items = (new Personal())->index($userid);
        exit(json_encode($items));
    }

    //videos模块记录学习时间
    public function videos_time()
    {
        $returns_time_of = $_GET;
        $items = (new Videos)->update($returns_time_of);
    }

    //修改用户密码
    public function retrieve_password()
    {
        $returns_time_of = $_GET;
        //确定用户是否存在
        $id_v = $returns_time_of['id'];
        $user_is = (new User)->where(["id = $id_v"])->fetch();
        if (!$user_is) {
            exit('id不存在');
        }
        if ($user_is['name'] != $returns_time_of['name']) {
            exit('id正确，但用户不存在');
        }
        $arr = [];
        $arr['id'] = $returns_time_of['id'];
        $arr['password'] = $returns_time_of['password'];
        $items = (new User)->change_password($arr);
        exit('密码修改成功');
    }
    public function Administrator_password()
    {
        $returns_time_of = $_GET;
        //确定用户是否存在
        $id_v = $returns_time_of['managerName'];
        $user_is = (new Administrator)->where(["managerName = '$id_v'"])->fetch();
        if (!$user_is) {
            exit('但用户不存在');
        }
        $arr = [];
        $arr['managerName'] = $returns_time_of['managerName'];
        $arr['managerPw'] = $returns_time_of['managerPw'];
        $items = (new Administrator)->change_password($arr);
        exit('密码修改成功');
    }

}

<form action="" method="get">
    <input type="text" value="<?php echo $keyword ?>" name="keyword">
    <input type="submit" value="搜索">
</form>

<p><a href="/index.php/item/manage">新建</a></p>

<table>
    <tr>
        <th>ID</th>
        <th>内容</th>
        <th>操作</th>
    </tr>
    <?php foreach ($items as $item): ?>
        <tr>
            <td><?php echo $item['id'] ?></td>
            <td>
                <a href="/index.php/item/detail/<?php echo $item['id'] ?>" title="查看详情">
                    <?php echo $item['user_name'] ?>
                </a>
            </td>
            <td>
                <a href="/index.php/item/manage/<?php echo $item['id'] ?>">编辑</a>
                <a href="/index.php/item/delete/<?php echo $item['id'] ?>">删除</a>
            </td>
        </tr>
    <?php endforeach ?>
</table>

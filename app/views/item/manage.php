<form  <?php if (isset($item['id'])) { ?>
            action="/index.php/item/update/<?php echo $item['id'] ?>"
        <?php } else { ?>
            action="/index.php/item/add"
        <?php } ?>
      method="post">

    <?php if (isset($item['id'])): ?>
        <input type="hidden" name="id" value="<?php echo $item['id'] ?>">
    <?php endif; ?>
    <input type="text" name="value" value="<?php echo isset($item['user_name']) ? $item['user_name'] : '' ?>">
    <input type="submit" value="提交">
</form>

<a class="big" href="/index.php/item/index">返回</a>
<div class="container">
    <h2>Добавить предмет</h2>
    <form method="POST">
        <div class="form-group">
            <label>ID предмета</label>
            <input type="number" name="item_id" required class="form-control">
        </div>
        <div class="form-group">
            <label>Количество</label>
            <input type="number" name="count" required class="form-control">
        </div>
        <div class="form-group">
            <label>Доп. данные (JSON)</label>
            <textarea name="data" class="form-control"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Добавить</button>
    </form>
</div>
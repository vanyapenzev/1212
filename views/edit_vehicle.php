<div class="container">
    <h2>Редактировать транспорт</h2>
    <form method="POST">
        <input type="hidden" name="player_uuid" value="<?= $_GET['player'] ?>">
        
        <div class="form-group">
            <label>Модель</label>
            <input type="text" name="model" value="<?= $vehicle['model'] ?>" required class="form-control">
        </div>
        
        <div class="form-group">
            <label>Топливо</label>
            <input type="number" name="fuel" value="<?= $vehicle['fuel'] ?>" required class="form-control">
        </div>
        
        <div class="form-group">
            <label>Компоненты (JSON)</label>
            <textarea name="components" required class="form-control"><?= $vehicle['components'] ?></textarea>
        </div>
        
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</div>
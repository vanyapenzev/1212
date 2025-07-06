<?php ob_start(); ?>
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
    <div class="card p-6">
        <h3 class="text-xl font-bold mb-2"><i class="fas fa-users mr-2"></i>Онлайн игроков</h3>
        <p class="text-3xl"><?= $stats['online_players'] ?></p>
    </div>
    
    <div class="card p-6">
        <h3 class="text-xl font-bold mb-2"><i class="fas fa-database mr-2"></i>Всего игроков</h3>
        <p class="text-3xl"><?= $stats['total_players'] ?></p>
    </div>
    
    <div class="card p-6">
        <h3 class="text-xl font-bold mb-2"><i class="fas fa-car mr-2"></i>Транспорта</h3>
        <p class="text-3xl"><?= $stats['vehicles'] ?></p>
    </div>
    
    <div class="card p-6">
        <h3 class="text-xl font-bold mb-2"><i class="fas fa-home mr-2"></i>Недвижимости</h3>
        <p class="text-3xl"><?= $stats['houses'] ?></p>
    </div>
</div>

<div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
    <div class="card p-6">
        <h3 class="text-xl font-bold mb-4"><i class="fas fa-list mr-2"></i>Последние действия</h3>
        <div class="overflow-x-auto">
            <table class="min-w-full">
                <thead>
                    <tr>
                        <th class="py-2">Администратор</th>
                        <th class="py-2">Действие</th>
                        <th class="py-2">Время</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($adminActions as $log): ?>
                    <tr class="border-t border-gray-700">
                        <td class="py-3"><?= htmlspecialchars($log['admin']) ?></td>
                        <td class="py-3"><?= htmlspecialchars($log['action']) ?></td>
                        <td class="py-3"><?= date('d.m.Y H:i', strtotime($log['time'])) ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="card p-6">
        <h3 class="text-xl font-bold mb-4"><i class="fas fa-server mr-2"></i>Логи сервера</h3>
        <div class="overflow-x-auto">
            <table class="min-w-full">
                <thead>
                    <tr>
                        <th class="py-2">Логин</th>
                        <th class="py-2">Действие</th>
                        <th class="py-2">IP</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($serverLogs as $log): ?>
                    <tr class="border-t border-gray-700">
                        <td class="py-3"><?= htmlspecialchars($log['login']) ?></td>
                        <td class="py-3"><?= htmlspecialchars($log['action']) ?></td>
                        <td class="py-3"><?= htmlspecialchars($log['ip']) ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php
$content = ob_get_clean();
include 'layout.php';
?>
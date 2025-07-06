<!DOCTYPE html>
<html lang="ru" class="h-full bg-gray-900">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($title) ?> | Админ-панель</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Анимации -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#121212',
                        secondary: '#1e1e1e',
                        accent: '#BB86FC',
                        danger: '#CF6679'
                    }
                }
            }
        }
    </script>
    
    <style>
        body {
            font-family: 'Segoe UI', system-ui, sans-serif;
        }
        
        .sidebar {
            transition: all 0.3s ease;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            .sidebar.open {
                transform: translateX(0);
            }
        }
        
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: linear-gradient(145deg, #1a1a1a, #151515);
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }
        
        .animate-fade-in {
            animation: fadeIn 0.5s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="flex flex-col min-h-screen text-gray-200 bg-primary">
    <!-- Навигация -->
    <nav class="bg-secondary border-b border-gray-800">
        <div class="container mx-auto px-4 py-3 flex items-center justify-between">
            <div class="flex items-center space-x-4">
                <button id="menu-toggle" class="md:hidden text-accent">
                    <i class="fas fa-bars text-xl"></i>
                </button>
                <a href="/" class="text-xl font-bold flex items-center">
                    <i class="fas fa-shield-alt text-accent mr-2"></i>
                    RAGE:MP Admin
                </a>
            </div>
            
            <div class="flex items-center space-x-4">
                <div class="hidden md:block">
                    <span class="text-sm"><?= $_SESSION['admin_name'] ?? 'Гость' ?></span>
                    <span class="ml-2 px-2 py-1 bg-accent text-gray-900 rounded text-xs font-bold">
                        Ур. <?= $_SESSION['admin_level'] ?? '0' ?>
                    </span>
                </div>
                <?php if (isset($_SESSION['admin_logged_in'])): ?>
                    <a href="/logout" class="hover:text-accent transition-colors">
                        <i class="fas fa-sign-out-alt"></i>
                    </a>
                <?php endif; ?>
            </div>
        </div>
    </nav>
    
    <div class="flex flex-1 overflow-hidden">
        <!-- Боковая панель -->
        <aside id="sidebar" class="sidebar w-64 bg-secondary border-r border-gray-800 flex-shrink-0 hidden md:block">
            <div class="p-4">
                <div class="text-sm uppercase text-gray-500 mb-2 px-2">Навигация</div>
                <nav>
                    <a href="/dashboard" class="flex items-center px-4 py-3 hover:bg-gray-800 rounded-lg transition-colors <?= $currentPage == 'dashboard' ? 'bg-gray-800 text-accent' : '' ?>">
                        <i class="fas fa-tachometer-alt mr-3"></i>
                        Панель управления
                    </a>
                    
                    <a href="/players" class="flex items-center px-4 py-3 hover:bg-gray-800 rounded-lg transition-colors <?= $currentPage == 'players' ? 'bg-gray-800 text-accent' : '' ?>">
                        <i class="fas fa-users mr-3"></i>
                        Игроки
                    </a>
                    
                    <?php if ($_SESSION['admin_level'] >= 6): ?>
                        <div class="text-sm uppercase text-gray-500 mt-6 mb-2 px-2">Логи</div>
                        <a href="/logs/admin" class="flex items-center px-4 py-3 hover:bg-gray-800 rounded-lg transition-colors <?= $currentPage == 'admin_logs' ? 'bg-gray-800 text-accent' : '' ?>">
                            <i class="fas fa-user-shield mr-3"></i>
                            Админ-логи
                        </a>
                        <a href="/logs/server" class="flex items-center px-4 py-3 hover:bg-gray-800 rounded-lg transition-colors <?= $currentPage == 'server_logs' ? 'bg-gray-800 text-accent' : '' ?>">
                            <i class="fas fa-server mr-3"></i>
                            Логи сервера
                        </a>
                    <?php endif; ?>
                    
                    <div class="text-sm uppercase text-gray-500 mt-6 mb-2 px-2">Аккаунт</div>
                    <a href="/logout" class="flex items-center px-4 py-3 hover:bg-gray-800 rounded-lg transition-colors">
                        <i class="fas fa-sign-out-alt mr-3"></i>
                        Выход
                    </a>
                </nav>
            </div>
        </aside>
        
        <!-- Основное содержимое -->
        <main class="flex-1 overflow-y-auto p-4 animate-fade-in">
            <?= $content ?>
        </main>
    </div>
    
    <!-- Скрипты -->
    <script>
        // Мобильное меню
        document.getElementById('menu-toggle').addEventListener('click', function() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('open');
            sidebar.classList.toggle('hidden');
            sidebar.classList.toggle('absolute');
            sidebar.classList.toggle('z-50');
            sidebar.classList.toggle('h-screen');
        });
        
        // Подтверждение действий
        document.querySelectorAll('.confirm-action').forEach(button => {
            button.addEventListener('click', e => {
                if (!confirm('Вы уверены, что хотите выполнить это действие?')) {
                    e.preventDefault();
                }
            });
        });
        
        // Инициализация графиков
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('activityChart');
            if (ctx) {
                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'],
                        datasets: [{
                            label: 'Активность игроков',
                            data: [120, 190, 170, 210, 180, 250, 220],
                            borderColor: '#BB86FC',
                            backgroundColor: 'rgba(187, 134, 252, 0.1)',
                            tension: 0.3,
                            fill: true
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                labels: {
                                    color: '#e0e0e0'
                                }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                grid: {
                                    color: 'rgba(255, 255, 255, 0.1)'
                                },
                                ticks: {
                                    color: '#b0b0b0'
                                }
                            },
                            x: {
                                grid: {
                                    color: 'rgba(255, 255, 255, 0.1)'
                                },
                                ticks: {
                                    color: '#b0b0b0'
                                }
                            }
                        }
                    }
                });
            }
        });
    </script>
</body>
</html>
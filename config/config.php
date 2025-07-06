<?php
return [
    'site' => [
        'name' => 'Админ-панель RAGE:MP',
        'debug' => true // поменять на false в продакшене
    ],
    'security' => [
        'password_policy' => [
            'min_length' => 12,
            'require_mixed_case' => true,
            'require_numbers' => true,
            'require_symbols' => true
        ],
        'session' => [
            'timeout' => 1800, // 30 минут
            'regenerate_id' => true
        ]
    ]
];
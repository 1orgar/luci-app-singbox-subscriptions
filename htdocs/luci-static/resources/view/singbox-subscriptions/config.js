'use strict';
'use math';

const fs = L.require('fs');
const ui = L.require('ui');
const form = L.require('form');

return L.view.extend({
	// Функция для кнопки "Обновить" (запуск скрипта-заглушки)
	handleUpdate: function(ev) {
		return fs.exec('/usr/bin/singbox-update')
			.then(res => {
				if (res.code === 0) {
					ui.addNotification(null, E('p', _('Обновление успешно: ') + (res.stdout || 'OK')), 'info');
				} else {
					throw new Error(res.stderr || _('Ошибка выполнения скрипта'));
				}
			})
			.catch(e => ui.addNotification(null, E('p', e.message), 'danger'));
	},

	render: function() {
		let m, s, o;

		// Привязываемся к файлу /etc/config/singbox_subscriptions
		m = new form.Map('singbox_subscriptions', _('Sing-box Subscriptions'), 
			_('Настройка ссылок на подписки и прямых конфигураций SS/VLESS.'));

		// Секция основных настроек (Вкл/Выкл)
		s = m.section(form.TypedSection, 'global', _('Общие настройки'));
		s.anonymous = true;
		s.option(form.Flag, 'enabled', _('Включить клиент Sing-box'));

		// Секция списка ссылок (Таблица с кнопками Добавить/Удалить)
		s = m.section(form.GridSection, 'subscription', _('Список подписок'));
		s.addremove = true; // Разрешить добавлять и удалять строки
		s.anonymous = true;

		// Поле: Название (для удобства пользователя)
		s.option(form.Value, 'name', _('Название'));
		
		// Поле: URL (с базовой валидацией)
		o = s.option(form.Value, 'url', _('URL подписки или прямая ссылка'));
		o.placeholder = 'https://... или vless://...';
		o.validate = function(section_id, value) {
			if (!value) return _('Поле не может быть пустым');
			if (value.startsWith('http') || value.startsWith('vless://') || value.startsWith('ss://')) {
				return true;
			}
			return _('Неверный формат ссылки (нужен http, vless или ss)');
		};

		return m.render().then(mapEl => {
			// Создаем контейнер для нашей кастомной кнопки "Обновить"
			let btnContainer = E('div', { 'class': 'cbi-page-actions' }, [
				E('button', {
					'class': 'btn cbi-button-action important',
					'click': ui.createHandlerFn(this, 'handleUpdate')
				}, _('Обновить подписки сейчас'))
			]);

			mapEl.appendChild(btnContainer);
			return mapEl;
		});
	}
});

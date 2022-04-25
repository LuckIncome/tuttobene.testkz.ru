-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: 10.0.0.125:3306
-- Время создания: Окт 15 2021 г., 05:52
-- Версия сервера: 10.1.48-MariaDB
-- Версия PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `004_tuttobene`
--

-- --------------------------------------------------------

--
-- Структура таблицы `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map` text COLLATE utf8mb4_unicode_ci,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `branches`
--

INSERT INTO `branches` (`id`, `title`, `logo`, `image`, `body`, `address`, `map`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Головной офис', 'branches\\July2021\\BOIDxKrGF7SzsjYpKqQ0.svg', NULL, '<h2>Головной офис</h2>\r\n<p>Республика Казахстан, A05B5C3,<br />г. Алматы, ул. Ауэзова, д. 3</p>\r\n<p><strong>Телефоны:</strong></p>\r\n<p><a href=\"tel:+77273956988\">+7 727 395 69 88</a><br /><a href=\"tel:+77478467237\">+7 747 846 72 37</a></p>\r\n<p><strong>Электронная почта:</strong></p>\r\n<p><a href=\"mailto:info@tuttobene.kz\">info@tuttobene.kz</a><br /><a href=\"mailto:tutto-bene@mail.ru\">tutto-bene@mail.ru</a></p>', '#', NULL, 1, 1, '2021-07-30 05:43:19', '2021-07-30 05:43:19'),
(2, 'Джелатерия в ТРЦ «Dostyk Plaza»', 'branches\\July2021\\BbDSo9OQYpdO0it3Yb9p.svg', 'branches\\July2021\\qxkTrzEeErUaeQpleZR4.png', '<p>г. Алматы, Самал 2-й микрорайон, 111, 3-й этаж (напротив детского парка)</p>\r\n<p><strong>График работы:</strong></p>\r\n<p>c 10.00 до 22.00, ежедневно, кроме субботы и воскресенья</p>\r\n<p><strong>Ассортимент:</strong></p>\r\n<p>18 сортов мороженого, десерты на холодном столе, молочные коктейли, торты-мороженое, мороженое фасованное по 0,4 кг, кофе, напитки, чай</p>', 'г. Алматы, Самал 2-й микрорайон, 111, 3-й этаж (напротив Funky Town)', '{\"id\":\"2\",\"city_id\":\"1\",\"coord\":\"43.233668, 76.957015\",\"zoom\":17,\"title\":\"\",\"description\":\"&lt;strong&gt;\\u0414\\u0436\\u0435\\u043b\\u0430\\u0442\\u0435\\u0440\\u0438\\u044f \\u0432 \\u0422\\u0420\\u0426 &amp;quot;Dostyk Plaza&amp;quot;&lt;\\/strong&gt;&lt;br \\/&gt;\\u0433. \\u0410\\u043b\\u043c\\u0430\\u0442\\u044b, \\u0421\\u0430\\u043c\\u0430\\u043b 2-\\u0439 \\u043c\\u0438\\u043a\\u0440\\u043e\\u0440\\u0430\\u0439\\u043e\\u043d, &lt;br \\/&gt;111, 3-\\u0439 \\u044d\\u0442\\u0430\\u0436 (\\u043d\\u0430\\u043f\\u0440\\u043e\\u0442\\u0438\\u0432 Funky Town)\"}', 2, 1, '2021-07-30 05:45:24', '2021-07-30 05:45:24'),
(3, 'Мини-джелатерия в ТРЦ «Atakent Mall»', 'branches/October2021/o6xQeMLEaSKw0ALEtCl0.svg', 'branches/October2021/rwLU6IqWRG9t9XFJDShT.jpg', '<p>г. Алматы, Самал 2-й микрорайон, 111, 3-й этаж (напротив детского парка)</p>\r\n<p><strong>График работы:</strong></p>\r\n<p>c 10.00 до 22.00, ежедневно, кроме субботы и воскресенья</p>\r\n<p><strong>Ассортимент:</strong></p>\r\n<p>18 сортов мороженого, десерты на холодном столе, молочные коктейли, торты-мороженое, мороженое фасованное по 0,4 кг, кофе, напитки, чай</p>', 'г. Алматы, ул. Тимирязева, 42', '{\"id\":\"3\",\"city_id\":\"1\",\"coord\":\"43.225075, 76.909147\",\"zoom\":17,\"title\":\"\",\"description\":\"&lt;strong&gt;\\u041c\\u0438\\u043d\\u0438-\\u0434\\u0436\\u0435\\u043b\\u0430\\u0442\\u0435\\u0440\\u0438\\u044f \\u0432 \\u0422\\u0420\\u0426 &amp;quot;Atakent Mall&amp;quot;&lt;\\/strong&gt;&lt;br \\/&gt;\\u0433. \\u0410\\u043b\\u043c\\u0430\\u0442\\u044b, \\u0443\\u043b. \\u0422\\u0438\\u043c\\u0438\\u0440\\u044f\\u0437\\u0435\\u0432\\u0430, 42&lt;br \\/&gt;&amp;nbsp;\"}', 3, 1, '2021-07-30 05:47:00', '2021-10-15 07:21:00'),
(6, 'Мини-джелатерия в ТРЦ «Mega»', 'branches\\July2021\\x0r8mO0pGIIYBHDXcimS.svg', 'branches/October2021/6oUIUYdABUAVxS9UKvUY.jpg', '<p>г. Алматы, Самал 2-й микрорайон, 111, 3-й этаж (напротив детского парка)</p>\r\n<p><strong>График работы:</strong></p>\r\n<p>c 10.00 до 22.00, ежедневно, кроме субботы и воскресенья</p>\r\n<p><strong>Ассортимент:</strong></p>\r\n<p>18 сортов мороженого, десерты на холодном столе, молочные коктейли, торты-мороженое, мороженое фасованное по 0,4 кг, кофе, напитки, чай</p>', 'г. Алматы, ул. Розыбакиева, д. 247а, 2-й этаж', '{\"id\":\"6\",\"city_id\":\"1\",\"coord\":\"43.20222903579267,76.89186321163936\",\"zoom\":17,\"title\":\"\",\"description\":\"&lt;strong&gt;\\u041c\\u0438\\u043d\\u0438-\\u0434\\u0436\\u0435\\u043b\\u0430\\u0442\\u0435\\u0440\\u0438\\u044f \\u0432 \\u0422\\u0420\\u0426 &amp;laquo;Mega&amp;raquo;&lt;br \\/&gt;&lt;\\/strong&gt;\\u0433. \\u0410\\u043b\\u043c\\u0430\\u0442\\u044b, \\u0443\\u043b. \\u0420\\u043e\\u0437\\u044b\\u0431\\u0430\\u043a\\u0438\\u0435\\u0432\\u0430, \\u0434. 247\\u0430, 2-\\u0439 \\u044d\\u0442\\u0430\\u0436\"}', 6, 1, '2021-07-30 06:48:00', '2021-10-15 07:22:07'),
(7, 'Мини-джелатерия в ТРЦ «Mega-2»', 'branches\\July2021\\e9ptGCylgdzXONSjMSSR.svg', 'branches/October2021/DOCBGgLezJngkJc7NTgC.jpg', '<p>г. Алматы, Самал 2-й микрорайон, 111, 3-й этаж (напротив детского парка)</p>\r\n<p><strong>График работы:</strong></p>\r\n<p>c 10.00 до 22.00, ежедневно, кроме субботы и воскресенья</p>\r\n<p><strong>Ассортимент:</strong></p>\r\n<p>18 сортов мороженого, десерты на холодном столе, молочные коктейли, торты-мороженое, мороженое фасованное по 0,4 кг, кофе, напитки, чай</p>', 'г. Алматы, ул. Розыбакиева, д. 263, 2-й этаж', '{\"id\":\"7\",\"city_id\":\"1\",\"coord\":\"43.201192997784275,76.89222799206541\",\"zoom\":17,\"title\":\"\",\"description\":\"&lt;strong&gt;\\u041c\\u0438\\u043d\\u0438-\\u0434\\u0436\\u0435\\u043b\\u0430\\u0442\\u0435\\u0440\\u0438\\u044f \\u0432 \\u0422\\u0420\\u0426 &amp;laquo;Mega-2&amp;raquo;&lt;\\/strong&gt;&lt;br \\/&gt;\\u0433. \\u0410\\u043b\\u043c\\u0430\\u0442\\u044b, \\u0443\\u043b. \\u0420\\u043e\\u0437\\u044b\\u0431\\u0430\\u043a\\u0438\\u0435\\u0432\\u0430, \\u0434. 263, 2-\\u0439 \\u044d\\u0442\\u0430\\u0436\"}', 7, 1, '2021-07-30 06:50:00', '2021-10-15 07:22:26');

-- --------------------------------------------------------

--
-- Структура таблицы `cakes`
--

CREATE TABLE `cakes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `min_weight` double(8,2) NOT NULL DEFAULT '1.00',
  `max_weight` double(8,2) DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cakes`
--

INSERT INTO `cakes` (`id`, `title`, `image`, `slug`, `price`, `min_weight`, `max_weight`, `body`, `seo_title`, `meta_description`, `meta_keywords`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ягодный микс', 'cakes/September2021/PitZpDNPxVjTCfNbvxxj.jpg', 'yagodnyj-miks', 7500, 1.00, 3.70, '<p>НОВИНКА! <br />Яркий и легкий торт из двух сортов джелато. Классический сорт - Сливочное и сорбет - Черника. Украшение из свежих ягод: ежевика, голубика, малина, красная смородина.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Ягодный микс', 'Ягодный микс', 'Ягодный микс', 1, 1, '2021-08-05 08:44:00', '2021-09-23 07:04:52'),
(2, 'OREO', 'cakes/September2021/NffEtoZDhXYOhqDlVksu.jpg', 'oreo', 6000, 1.00, NULL, '<p>НОВИНКА! <br />Холодный десерт в черно-белой гамме с роскошным вкусом шоколадного торта OREO. Состав: классический сорт итальянского джелато Страчателла, взбитые сливки, шоколадная крошка, начинка Горячий шоколад, печенье Oreo.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'OREO', 'OREO', 'OREO', 2, 1, '2021-08-05 08:44:00', '2021-09-23 09:18:28'),
(3, 'Сливочно-шоколадный', 'cakes/September2021/zd8eKRWgBfWuF562hG9Y.jpg', 'slivochno-shokoladnyj', 7500, 1.00, NULL, '<p>НОВИНКА!</p>\r\n<p>Праздничный торт из классического мороженого с нарядным украшением.</p>\r\n<p>Состав: джелато Сливочное и Шоколад, взбитые сливки, свежие ягоды (малина, ежевика, клубника), начинка Горячий шоколад.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Сливочно-шоколадный', 'Сливочно-шоколадный', 'Сливочно-шоколадный', 3, 1, '2021-08-05 08:44:00', '2021-09-23 07:13:31'),
(4, 'Бабл Гам', 'cakes/September2021/fTgVAylWE6nXfFNFWdBZ.jpg', 'babl-gam', 6000, 1.00, NULL, '<p>НОВИНКА!</p>\r\n<p>Веселый яркий торт из обожаемого детьми сорта мороженого Бабл гам прекрасно поднимает настроение!</p>\r\n<p>Состав: Мороженое Бабл гам, декор в виде двухцветных шоколадных шаров.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Бабл Гам', 'Бабл Гам', 'Бабл Гам', 4, 1, '2021-08-05 08:44:00', '2021-09-23 09:19:53'),
(5, 'Золотая звезда', 'cakes/September2021/iSDNrMzwrHKLkrnAK0cv.jpg', 'zolotaya-zvezda', 6000, 1.00, NULL, '<p>НОВИНКА!</p>\r\n<p>Оригинальные торты в новогоднем оформлении из вашего любимого джелато и шоколадного декора.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Золотая звезда', 'Золотая звезда', 'Золотая звезда', 6, 1, '2021-08-05 08:44:00', '2021-09-24 08:15:06'),
(6, 'Вишневый бисквит', 'cakes/September2021/0RPOrvAUMEGt0OE1xwZW.jpg', 'vishnevyj-biskvit', 6000, 1.00, NULL, '<p>Оригинальный торт из йогуртового мороженого Амарена.</p>\r\n<p>Бисквитный корж пропитывается фруктово-ягодной начинкой Вишня Амарена.</p>\r\n<p>Состав: Мороженое Амарена, белый сливочный бисквит, шоколадный декор.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Готовый торт можно приобрести в джелатерии в ТРЦ Dostyk Plaza.</p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Вишневый бисквит', 'Вишневый бисквит', 'Вишневый бисквит', 7, 1, '2021-08-05 08:44:00', '2021-09-24 08:15:47'),
(9, 'Звезда', 'cakes/September2021/Xupx7p518SPdbbmLdPrV.jpg', 'zvezda', 6000, 1.00, NULL, '<p>НОВИНКА!</p>\r\n<p>Оригинальные торты в новогоднем оформлении из вашего любимого джелато и шоколадного декора.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Звезда', 'Звезда', 'Звезда', 5, 1, '2021-09-24 08:17:00', '2021-09-24 08:17:29'),
(10, 'SNICKERS', 'cakes/September2021/MzrffJMGfDZ8gGQOc6Fr.jpg', 'snickers', 6000, 1.00, NULL, '<p>НОВИНКА!</p>\r\n<p>Торт, по вкусу напоминающий любимый всеми шоколадный батончик SNICKERS.</p>\r\n<p>Состав: мороженое SNICKERS, украшение из горячего шоколада и кусочков батончика.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'SNICKERS', 'SNICKERS', 'SNICKERS', 8, 1, '2021-09-24 08:21:25', '2021-09-24 08:21:25'),
(12, 'Клубника со сливками', 'cakes/September2021/7HfJfMr2vd5MqGjzvrL2.jpg', 'klubnika-so-slivkami-tort', 6000, 1.00, NULL, '<p>НОВИНКА!</p>\r\n<p>Торт из мороженого Клубника со сливками со светлым бисквитом на масле и начинкой из спелой клубники.</p>\r\n<p>Состав: Мороженое Клубника со сливками, начинка Клубника, светлый воздушный бисквит и горячий шоколад.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Клубника со сливками', 'Клубника со сливками', 'Клубника со сливками', 9, 1, '2021-09-27 10:30:00', '2021-09-27 10:31:52'),
(13, 'Брауни', 'cakes/September2021/2v0CK5Huiyh3a94CO1NQ.jpg', 'brauni', 6000, 1.00, NULL, '<p>НОВИНКА!</p>\r\n<p>Для всех любителей насышенного шоколада!</p>\r\n<p>Насыщенный шоколадный вкус. Нежность джелато и взбитых сливок.</p>\r\n<p>Состав: Шоколадный корж, мороженое шоколад, декор из черного шоколада.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Брауни', 'Брауни', 'Брауни', 10, 1, '2021-09-27 10:34:12', '2021-09-27 10:34:12'),
(14, 'Тирамису', 'cakes/October2021/FSK0Sv5whEtYzhAXZlqM.jpg', 'tiramisu', 6000, 1.00, NULL, '<p>НОВИНКА!</p>\r\n<p>Вкус знаменитого итальянского десерта, который прочно завоевал сердца гурманов.</p>\r\n<p>В нем объединились нежность сыра маскарпоне и утонченный вкус бисквита, пропитанного ароматным кофе.</p>\r\n<p>Состав: Мороженое Тирамису, печенье Савоярди, кофе, взбитые сливки, какао.</p>\r\n<p><strong>Внимание! Заказ торта за 48 часов!</strong></p>\r\n<p>Минимальный вес торта - 1,7 кг</p>', 'Тирамису', 'Тирамису', 'Тирамису', 11, 1, '2021-09-27 10:37:00', '2021-10-15 06:43:24');

-- --------------------------------------------------------

--
-- Структура таблицы `cake_products`
--

CREATE TABLE `cake_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `stage` int(11) NOT NULL DEFAULT '1',
  `shape` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'circle',
  `biscuit` tinyint(1) NOT NULL DEFAULT '0',
  `tastes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `product_data` text COLLATE utf8mb4_unicode_ci,
  `comments` mediumtext COLLATE utf8mb4_unicode_ci,
  `confirmed` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cake_products`
--

INSERT INTO `cake_products` (`id`, `order_id`, `stage`, `shape`, `biscuit`, `tastes`, `count`, `price`, `product_data`, `comments`, `confirmed`, `created_at`, `updated_at`) VALUES
(1, 19, 2, 'square', 0, 'a:2:{i:0;i:2;i:1;i:3;}', 2, 24700, 'Вес - 3.8 кг. <br>Надпись - TEST 234', 'TEst et34t534tfe geg erg erg rwe gerg ew ger ger gTEst et34t534tfe geg erg erg rwe gerg ew ger ger gTEst et34t534tfe geg erg erg rwe gerg ew ger ger gTEst et34t534tfe geg erg erg rwe gerg ew ger ger g', 1, '2021-08-14 13:38:41', '2021-08-14 13:38:41'),
(2, 20, 1, 'circle', 0, 'a:1:{i:0;i:6;}', 1, 13000, 'Вес - 2 кг.', NULL, 0, '2021-08-14 13:59:27', '2021-08-14 13:59:27'),
(3, 21, 1, 'circle', 0, 'a:1:{i:0;i:6;}', 1, 13000, 'Вес - 2 кг.', NULL, 0, '2021-08-14 13:59:30', '2021-08-14 13:59:30'),
(4, 22, 1, 'circle', 0, 'a:1:{i:0;i:6;}', 1, 13000, 'Вес - 2 кг.', NULL, 0, '2021-08-14 13:59:42', '2021-08-14 13:59:42'),
(5, 23, 1, 'circle', 0, 'a:1:{i:0;i:6;}', 1, 13000, 'Вес - 2 кг.', NULL, 0, '2021-08-14 13:59:43', '2021-08-14 13:59:43'),
(6, 24, 1, 'circle', 0, 'a:1:{i:0;i:6;}', 1, 13000, 'Вес - 2 кг.', NULL, 0, '2021-08-14 13:59:44', '2021-08-14 13:59:44'),
(7, 25, 1, 'circle', 0, 'a:1:{i:0;i:6;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 13:59:54', '2021-08-14 13:59:54'),
(8, 26, 1, 'circle', 0, 'a:1:{i:0;i:7;}', 1, 13000, 'Вес - 2 кг.', NULL, 0, '2021-08-14 14:01:10', '2021-08-14 14:01:10'),
(9, 27, 1, 'circle', 0, 'a:1:{i:0;i:7;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:01:18', '2021-08-14 14:01:18'),
(10, 28, 1, 'circle', 0, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:03:42', '2021-08-14 14:03:42'),
(11, 29, 1, 'circle', 0, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:03:49', '2021-08-14 14:03:49'),
(12, 30, 1, 'circle', 0, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:03:50', '2021-08-14 14:03:50'),
(13, 31, 1, 'circle', 0, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:03:52', '2021-08-14 14:03:52'),
(14, 32, 1, 'circle', 0, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:05:58', '2021-08-14 14:05:58'),
(15, 33, 1, 'circle', 1, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:07:55', '2021-08-14 14:07:55'),
(16, 34, 1, 'circle', 0, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:08:12', '2021-08-14 14:08:12'),
(17, 35, 1, 'circle', 1, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг.', NULL, 1, '2021-08-14 14:08:22', '2021-08-14 14:08:22'),
(18, 36, 1, 'circle', 1, 'a:1:{i:0;i:5;}', 1, 13000, 'Вес - 2 кг. <br>Надпись - TEST 45435345', NULL, 1, '2021-08-14 14:10:19', '2021-08-14 14:10:19'),
(19, 42, 1, 'square', 1, 'a:1:{i:0;i:2;}', 2, 16900, 'Вес - 2.6 кг. <br>Надпись - TEST', 'tewtwet', 1, '2021-08-19 04:49:37', '2021-08-19 04:49:37'),
(20, 49, 1, 'circle', 0, 'a:1:{i:0;i:45;}', 4, 26000, 'Вес - 4 кг. <br>Надпись - С Днем рождения', 'Вишни, малина клубника', 0, '2021-09-20 09:32:18', '2021-09-20 09:32:18');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `certificates`
--

INSERT INTO `certificates` (`id`, `name`, `image`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(17, NULL, 'certificates/October2021/DlP794coXKPSSaFDSzNt.jpg', 1, 1, '2021-10-15 06:53:46', '2021-10-15 06:53:46'),
(18, NULL, 'certificates/October2021/E0kr937JGUJlWR3Os8HT.jpg', 2, 1, '2021-10-15 06:54:10', '2021-10-15 06:54:10'),
(19, NULL, 'certificates/October2021/MWKM55vm2qyLo3Uua2J6.jpg', 3, 1, '2021-10-15 06:54:24', '2021-10-15 06:54:24'),
(20, NULL, 'certificates/October2021/XKijqFDwHADYZn7A5a6G.jpg', 4, 1, '2021-10-15 06:54:39', '2021-10-15 06:54:39'),
(21, NULL, 'certificates/October2021/A9kBj0sYR2oMatRIlClh.jpg', 5, 1, '2021-10-15 06:54:54', '2021-10-15 06:54:54'),
(22, NULL, 'certificates/October2021/uNh2I6FN685E63KHNqqd.jpg', 6, 1, '2021-10-15 06:55:07', '2021-10-15 06:55:07'),
(23, NULL, 'certificates/October2021/8f9vkhoVBA0CNYvbtEpx.jpg', 7, 1, '2021-10-15 06:55:21', '2021-10-15 06:55:21'),
(24, NULL, 'certificates/October2021/CzzIRNLowb9qkdTURzEd.jpg', 8, 1, '2021-10-15 06:55:51', '2021-10-15 06:55:51'),
(25, NULL, 'certificates/October2021/R9zTpuXhMdmf7jxJB8Jg.jpg', 9, 1, '2021-10-15 06:56:07', '2021-10-15 06:56:07'),
(26, NULL, 'certificates/October2021/V7jMrIcCoAlmvUe9s6QV.jpg', 10, 1, '2021-10-15 06:56:25', '2021-10-15 06:56:25');

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('phone','social','address','email') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'phone',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `is_main`, `type`, `value`, `link`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'phone', '+7 727 395 69 88', 'tel:+77273956988', 1, 1, '2021-07-30 05:31:26', '2021-07-30 05:31:26'),
(2, 1, 'phone', '+7 747 846 72 37', 'tel:+77478467237', 2, 1, '2021-07-30 05:31:52', '2021-07-30 05:31:52'),
(3, 1, 'address', 'г. Алматы, ул. Ауэзова, д. 3', NULL, 1, 1, '2021-07-30 05:32:05', '2021-07-30 05:32:05'),
(4, 1, 'email', 'info@tuttobene.kz', 'mailto:info@tuttobene.kz', 1, 1, '2021-07-30 05:32:33', '2021-07-30 05:32:33'),
(5, 0, 'email', 'tutto-bene@mail.ru', 'mailto:tutto-bene@mail.ru', 2, 1, '2021-07-30 05:32:51', '2021-07-30 05:32:51'),
(6, 1, 'social', 'fb', '#', 1, 1, '2021-07-30 05:33:29', '2021-07-30 05:33:29'),
(7, 1, 'social', 'inst', '#', 2, 1, '2021-07-30 05:33:44', '2021-07-30 05:33:44');

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 3),
(46, 6, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{}', 4),
(47, 6, 'excerpt', 'text_area', 'Описание', 0, 0, 1, 1, 1, 1, '{}', 5),
(48, 6, 'body', 'rich_text_box', 'Контент', 0, 0, 1, 1, 1, 1, '{}', 7),
(49, 6, 'slug', 'text', 'Ссылка (Уникальная)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 8),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 10),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 11),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"ACTIVE\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\"}}', 12),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 13),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(55, 6, 'image', 'image', 'Изображение', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1200\",\"height\":null},\"quality\":\"90%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"],\"thumbnails\":[{\"name\":\"small\",\"scale\":\"25%\"}]}', 6),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'logo', 'image', 'Лого', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"90%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 3),
(59, 7, 'image', 'image', 'Изображение', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"90%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 4),
(60, 7, 'body', 'rich_text_box', 'Контент', 1, 0, 1, 1, 1, 1, '{}', 5),
(61, 7, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 8),
(62, 7, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 9),
(63, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 10),
(64, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(65, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(66, 8, 'is_main', 'checkbox', 'Основной', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0414\\u0430\",\"off\":\"\\u041d\\u0435\\u0442\",\"checked\":true}', 2),
(67, 8, 'type', 'select_dropdown', 'Тип', 1, 1, 1, 1, 1, 1, '{\"default\":\"phone\",\"options\":{\"phone\":\"\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d\",\"social\":\"\\u0421\\u043e\\u0446\\u0441\\u0435\\u0442\\u044c\",\"address\":\"\\u0410\\u0434\\u0440\\u0435\\u0441\",\"email\":\"Email\"}}', 3),
(68, 8, 'value', 'text_area', 'Значение', 1, 1, 1, 1, 1, 1, '{}', 4),
(69, 8, 'link', 'text', 'Ссылка', 0, 1, 1, 1, 1, 1, '{}', 5),
(70, 8, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 6),
(71, 8, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 7),
(72, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 8),
(73, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(74, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 9, 'name', 'text', 'Название', 0, 1, 1, 1, 1, 1, '{}', 2),
(76, 9, 'image', 'image', 'Изображение', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"100%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 3),
(77, 9, 'link', 'text', 'Ссылка', 0, 1, 1, 1, 1, 1, '{}', 4),
(78, 9, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 5),
(79, 9, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 6),
(80, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 7),
(81, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(82, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(83, 10, 'name', 'text', 'Название', 0, 1, 1, 1, 1, 1, '{}', 2),
(84, 10, 'image', 'image', 'Изображение', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"100%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"],\"thumbnails\":[{\"name\":\"small\",\"scale\":\"25%\"}]}', 3),
(85, 10, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 4),
(86, 10, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 5),
(87, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 6),
(88, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(89, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(90, 11, 'spec', 'text', 'Специализация', 1, 1, 1, 1, 1, 1, '{}', 2),
(91, 11, 'name', 'text', 'ФИО', 1, 1, 1, 1, 1, 1, '{}', 3),
(92, 11, 'image', 'image', 'Фото', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"90%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 4),
(93, 11, 'excerpt', 'text_area', 'Описание', 0, 0, 1, 1, 1, 1, '{}', 5),
(94, 11, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 6),
(95, 11, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 7),
(96, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 8),
(97, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(98, 6, 'seo_title', 'text', 'Seo Title', 0, 0, 1, 1, 1, 1, '{}', 9),
(99, 6, 'type', 'select_dropdown', 'Тип страницы', 1, 1, 1, 1, 1, 1, '{\"default\":\"simple\",\"options\":{\"home\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430\",\"about\":\"\\u041e \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438\",\"jelato\":\"\\u041e \\u0434\\u0436\\u0435\\u043b\\u0430\\u0442\\u043e\",\"certs\":\"\\u0421\\u0435\\u0440\\u0442\\u0438\\u0444\\u0438\\u043a\\u0430\\u0442\\u044b\",\"partners\":\"\\u041f\\u0430\\u0440\\u0442\\u043d\\u0435\\u0440\\u044b\",\"team\":\"\\u041a\\u043e\\u043c\\u0430\\u043d\\u0434\\u0430\",\"contacts\":\"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b\",\"cooperation\":\"\\u0421\\u043e\\u0442\\u0440\\u0443\\u0434\\u043d\\u0438\\u0447\\u0435\\u0441\\u0442\\u0432\\u043e\",\"franchise\":\"\\u0424\\u0440\\u0430\\u043d\\u0448\\u0438\\u0437\\u0430\",\"horeca\":\"HoReCa\",\"material\":\"\\u0421\\u044b\\u0440\\u044c\\u0435\",\"catalog\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\",\"services\":\"\\u0412\\u044b\\u0435\\u0437\\u0434\\u043d\\u043e\\u0435 \\u043e\\u0431\\u0441\\u043b\\u0443\\u0436\\u0438\\u0432\\u0430\\u043d\\u0438\\u0435\",\"constructor\":\"\\u0421\\u043e\\u0437\\u0434\\u0430\\u0439 \\u0441\\u0432\\u043e\\u0439 \\u0442\\u043e\\u0440\\u0442\",\"posts\":\"\\u041d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438\",\"simple\":\"\\u0414\\u0440\\u0443\\u0433\\u043e\\u0435\"}}', 2),
(100, 7, 'address', 'text', 'Адрес', 1, 0, 1, 1, 1, 1, '{}', 6),
(101, 7, 'map', 'code_editor', 'Карта JS', 1, 0, 1, 1, 1, 1, '{}', 7),
(102, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(103, 12, 'page_id', 'text', 'Страница', 1, 1, 1, 1, 1, 1, '{}', 3),
(104, 12, 'title', 'text', 'Заголовок', 0, 1, 1, 1, 1, 1, '{}', 4),
(105, 12, 'image', 'image', 'Изображение', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"100%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 6),
(106, 12, 'icon', 'image', 'Иконка (svg)', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"100%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 7),
(107, 12, 'body', 'rich_text_box', 'Текст', 0, 0, 1, 1, 1, 1, '{}', 8),
(108, 12, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 11),
(109, 12, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 12),
(110, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 13),
(111, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(112, 12, 'image_text_belongsto_page_relationship', 'relationship', 'Страница', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Page\",\"table\":\"pages\",\"type\":\"belongsTo\",\"column\":\"page_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(113, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(114, 13, 'title', 'text', 'Альт текст', 0, 1, 1, 1, 1, 1, '{}', 2),
(115, 13, 'image', 'image', 'Изображение', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"90%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 3),
(116, 13, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 4),
(117, 13, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 5),
(118, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 6),
(119, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(120, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(121, 14, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{}', 2),
(122, 14, 'excerpt', 'text_area', 'Краткое описание', 1, 1, 1, 1, 1, 1, '{}', 3),
(123, 14, 'description', 'text_area', 'Описание', 1, 1, 1, 1, 1, 1, '{}', 4),
(124, 14, 'image', 'image', 'Изображение', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"90%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 5),
(125, 14, 'content', 'rich_text_box', 'Контент', 1, 0, 1, 1, 1, 1, '{}', 6),
(126, 14, 'price', 'number', 'Цена', 1, 1, 1, 1, 1, 1, '{}', 7),
(127, 14, 'body', 'rich_text_box', 'Полный контент', 1, 0, 1, 1, 1, 1, '{}', 8),
(128, 14, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 9),
(129, 14, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 10),
(130, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 11),
(131, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(132, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(133, 15, 'type_id', 'text', 'Категория', 0, 1, 1, 1, 1, 1, '{}', 3),
(134, 15, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{}', 4),
(135, 15, 'image', 'image', 'Изображение', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"100%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"],\"thumbnails\":[{\"name\":\"small\",\"scale\":\"25%\"}]}', 5),
(136, 15, 'slug', 'text', 'Ссылка (Уникальная)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:icecreams,slug\"}}', 6),
(137, 15, 'body', 'rich_text_box', 'Контент', 0, 0, 1, 1, 1, 1, '{}', 7),
(138, 15, 'seo_title', 'text', 'SEO Заголовок', 0, 0, 1, 1, 1, 1, '{}', 8),
(139, 15, 'meta_description', 'text_area', 'Meta Описание', 0, 0, 1, 1, 1, 1, '{}', 9),
(140, 15, 'meta_keywords', 'text_area', 'Meta Ключевые слова', 0, 0, 1, 1, 1, 1, '{}', 10),
(141, 15, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 11),
(142, 15, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 12),
(143, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 13),
(144, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(145, 15, 'icecream_belongsto_ice_type_relationship', 'relationship', 'Категория', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\IceType\",\"table\":\"ice_types\",\"type\":\"belongsTo\",\"column\":\"type_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(146, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(147, 16, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 2),
(148, 16, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 7),
(149, 16, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 8),
(150, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 9),
(151, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(152, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(153, 17, 'icecream_id', 'text', 'Мороженное', 1, 1, 1, 1, 1, 1, '{}', 3),
(154, 17, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{}', 4),
(155, 17, 'icon', 'image', 'Иконка (svg)', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"90%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"]}', 5),
(156, 17, 'excerpt', 'text', 'Описание', 0, 1, 1, 1, 1, 1, '{}', 6),
(157, 17, 'price', 'number', 'Цена', 1, 1, 1, 1, 1, 1, '{}', 7),
(158, 17, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 9),
(159, 17, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 10),
(160, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 11),
(161, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(162, 17, 'ice_portion_belongsto_icecream_relationship', 'relationship', 'Мороженное', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Icecream\",\"table\":\"icecreams\",\"type\":\"belongsTo\",\"column\":\"icecream_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(163, 16, 'slug', 'text', 'Ссылка (Уникальная)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:ice_types,slug\"}}', 3),
(164, 16, 'seo_title', 'text', 'SEO Заголовок', 0, 0, 1, 1, 1, 1, '{}', 4),
(165, 16, 'meta_description', 'text_area', 'Meta Описание', 0, 0, 1, 1, 1, 1, '{}', 5),
(166, 16, 'meta_keywords', 'text_area', 'Meta Ключевые слова', 0, 0, 1, 1, 1, 1, '{}', 6),
(167, 15, 'featured', 'checkbox', 'Популярное', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0414\\u0430\",\"off\":\"\\u041d\\u0435\\u0442\",\"checked\":false}', 5),
(168, 17, 'default', 'checkbox', 'По умолчанию', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0414\\u0430\",\"off\":\"\\u041d\\u0435\\u0442\",\"checked\":false}', 8),
(169, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(170, 18, 'name', 'text', 'ФИО', 1, 1, 1, 1, 1, 1, '{}', 2),
(171, 18, 'phone', 'text', 'Телефон', 1, 1, 1, 1, 1, 1, '{}', 3),
(172, 18, 'delivery', 'text', 'Доставка', 1, 1, 1, 1, 1, 1, '{}', 4),
(173, 18, 'payment', 'text', 'Оплата', 1, 1, 1, 1, 1, 1, '{}', 5),
(174, 18, 'date', 'text', 'Дата доставки', 0, 0, 1, 1, 1, 1, '{}', 6),
(175, 18, 'address', 'text', 'Адреса доставки', 0, 0, 1, 1, 1, 1, '{}', 7),
(176, 18, 'branch_id', 'text', 'Пункт самовывоза', 0, 0, 1, 1, 1, 1, '{}', 9),
(177, 18, 'amount', 'text', 'Сумма', 1, 1, 1, 1, 1, 1, '{}', 11),
(178, 18, 'status', 'text', 'Статус', 1, 1, 1, 1, 1, 1, '{}', 12),
(179, 18, 'confirmed', 'text', 'Подтвержден', 1, 1, 1, 1, 1, 1, '{}', 13),
(180, 18, 'created_at', 'timestamp', 'Дата создания', 0, 1, 1, 1, 0, 1, '{}', 14),
(181, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(182, 18, 'order_belongsto_branch_relationship', 'relationship', 'Пункт самовывоза', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Branch\",\"table\":\"branches\",\"type\":\"belongsTo\",\"column\":\"branch_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(183, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(184, 19, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 2),
(185, 19, 'image', 'image', 'Изображение', 1, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":null},\"quality\":\"100%\",\"upsize\":false,\"formats\":[\"original\",\"webp\"],\"thumbnails\":[{\"name\":\"small\",\"scale\":\"25%\"}]}', 3),
(186, 19, 'slug', 'text', 'Ссылка (Уникальная)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:cakes,slug\"}}', 4),
(187, 19, 'price', 'number', 'Цена за кг', 1, 1, 1, 1, 1, 1, '{}', 5),
(188, 19, 'body', 'rich_text_box', 'Контент', 0, 0, 1, 1, 1, 1, '{}', 9),
(189, 19, 'seo_title', 'text', 'SEO Заголовок', 0, 0, 1, 1, 1, 1, '{}', 10),
(190, 19, 'meta_description', 'text_area', 'Meta Описание', 0, 0, 1, 1, 1, 1, '{}', 11),
(191, 19, 'meta_keywords', 'text_area', 'Meta Ключевые слова', 0, 0, 1, 1, 1, 1, '{}', 12),
(192, 19, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 13),
(193, 19, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 14),
(194, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 15),
(195, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
(196, 19, 'min_weight', 'number', 'Минимальный вес (кг)', 1, 1, 1, 1, 1, 1, '{}', 6),
(197, 19, 'max_weight', 'number', 'Максимальный вес (кг)', 0, 1, 1, 1, 1, 1, '{}', 7),
(199, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(200, 20, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 2),
(201, 20, 'price', 'number', 'Сумма доставки', 1, 1, 1, 1, 1, 1, '{}', 3),
(202, 20, 'sort_id', 'number', 'Порядковый номер', 1, 1, 1, 1, 1, 1, '{}', 5),
(203, 20, 'status', 'checkbox', 'Статус', 1, 1, 1, 1, 1, 1, '{\"on\":\"\\u0412\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"off\":\"\\u041e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\",\"checked\":true}', 6),
(204, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 7),
(205, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(206, 18, 'delivery_price', 'text', 'Сумма доставки', 0, 1, 1, 1, 1, 1, '{}', 10),
(207, 20, 'amount', 'number', 'Бесплатная доставка с суммы', 0, 1, 1, 1, 1, 1, '{}', 4),
(208, 12, 'slug', 'text', 'Ссылка (Уникальная)', 1, 0, 0, 0, 0, 0, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 10),
(209, 12, 'title_two', 'text', 'Заголовок второй', 0, 0, 1, 1, 1, 1, '{}', 5),
(210, 12, 'body_two', 'rich_text_box', 'Текст второй', 0, 0, 1, 1, 1, 1, '{}', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2021-07-29 15:02:28', '2021-07-30 05:19:34'),
(7, 'branches', 'branches', 'Точка', 'Точки', 'voyager-buy', 'App\\Models\\Branch', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-30 03:40:10', '2021-07-30 05:23:15'),
(8, 'contacts', 'contacts', 'Контакт', 'Контакты', 'voyager-location', 'App\\Models\\Contact', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-30 03:45:08', '2021-07-30 03:45:08'),
(9, 'partners', 'partners', 'Партнер', 'Партнеры', 'voyager-world', 'App\\Models\\Partner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-30 03:46:54', '2021-07-30 03:46:54'),
(10, 'certificates', 'certificates', 'Сертификат', 'Сертификаты', 'voyager-certificate', 'App\\Models\\Certificate', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-30 03:50:33', '2021-07-30 03:50:33'),
(11, 'members', 'members', 'Команда', 'Команды', 'voyager-people', 'App\\Models\\Member', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-30 03:56:12', '2021-07-30 03:56:12'),
(12, 'image_texts', 'image-texts', 'ИнфоБлок', 'ИнфоБлоки', 'voyager-window-list', 'App\\Models\\ImageText', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-07-31 10:28:17', '2021-10-14 09:30:36'),
(13, 'sliders', 'sliders', 'Слайдер на главной', 'Слайдеры на главной', 'voyager-images', 'App\\Models\\Slider', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-31 14:26:12', '2021-07-31 14:26:12'),
(14, 'services', 'services', 'Обслуживание', 'Обслуживания', 'voyager-paint-bucket', 'App\\Models\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-07-31 15:08:23', '2021-07-31 15:08:23'),
(15, 'icecreams', 'icecreams', 'Мороженое', 'Мороженные', 'voyager-diamond', 'App\\Models\\Icecream', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-01 03:27:19', '2021-08-01 12:33:18'),
(16, 'ice_types', 'ice-types', 'Категория Мороженного', 'Категории Мороженных', 'voyager-shop', 'App\\Models\\IceType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-01 03:29:31', '2021-08-01 07:31:23'),
(17, 'ice_portions', 'ice-portions', 'Порция мороженного', 'Порции мороженных', 'voyager-bag', 'App\\Models\\IcePortion', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-01 06:02:44', '2021-08-01 12:57:22'),
(18, 'orders', 'orders', 'Заказ', 'Заказы', 'voyager-bag', 'App\\Models\\Order', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":\"confirmed\"}', '2021-08-05 07:53:06', '2021-08-06 02:52:18'),
(19, 'cakes', 'cakes', 'Торт', 'Торты', 'voyager-pie-chart', 'App\\Models\\Cake', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-05 08:37:40', '2021-08-06 03:42:57'),
(20, 'districts', 'districts', 'Район доставки', 'Районы доставки', 'voyager-truck', 'App\\Models\\District', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-08-06 02:23:50', '2021-08-16 01:57:09');

-- --------------------------------------------------------

--
-- Структура таблицы `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `districts`
--

INSERT INTO `districts` (`id`, `title`, `price`, `amount`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(9, 'Внутри квадрата Аль Фараби-Момышулы-Рыскулова-ВОАД', 1000, 10000, 1, 1, '2021-08-19 02:14:56', '2021-08-19 02:14:56'),
(10, 'Внутри границы города (Развилка на Бутаковское ущелье - Алмарасанская плотина - Алтын-Орда - Аэропорт', 2000, NULL, 2, 1, '2021-08-19 02:17:43', '2021-08-19 02:17:43');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `icecreams`
--

CREATE TABLE `icecreams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `icecreams`
--

INSERT INTO `icecreams` (`id`, `type_id`, `title`, `image`, `featured`, `slug`, `body`, `seo_title`, `meta_description`, `meta_keywords`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(9, 1, 'Апельсин', 'icecreams/September2021/jGhf16krtldW5qpvcaat.jpg', 1, 'apelsin', '<p>Сорбет из концентрированного апельсинового сока.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,27 гр; жиры 1,47 гр; углеводы 26,3 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 119 ккал.</p>', NULL, NULL, NULL, 1, 1, '2021-09-02 09:03:00', '2021-09-07 07:41:19'),
(10, 1, 'Арбуз', 'icecreams/September2021/12l7VXe1TAXtb5ruNfB8.jpg', 1, 'arbuz', '<p>Освежающий сорбет из концентрата сока и мякоти спелого арбуза.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,16 гр; жиры 1,57 гр; углеводы 25,13 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>105,5 ккал.</p>', NULL, NULL, NULL, 2, 1, '2021-09-02 09:04:00', '2021-09-07 08:44:36'),
(11, 1, 'Зеленое яблоко', 'icecreams/September2021/oeGJP5EUW1xUTzbWFzD8.jpg', 1, 'zelenoe-yabloko', '<p>Сорбет со вкусом кисло-сладкого зеленого яблока.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0 гр; жиры 1,57гр; углеводы 48,6 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>119 ккал</p>', NULL, NULL, NULL, 3, 1, '2021-09-02 09:04:00', '2021-09-07 08:44:53'),
(12, 1, 'Киви', 'icecreams/September2021/zjBqgpNlCL9AO26nALD6.jpg', 1, 'kivi', '<p>Тропический сорбет из мякоти и сока плодов киви. Непревзойденный источник витамина С.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,24 гр; жиры 1,57 гр; углеводы 26,52 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>118,4 ккал</p>', NULL, NULL, NULL, 4, 1, '2021-09-02 09:06:00', '2021-09-07 08:44:21'),
(13, 1, 'Клубника - Банан', 'icecreams/September2021/Bmuvs47d3yXfukwJMeHm.jpg', 1, 'klubnika-banan', '<p>Нежный сорбет из мякоти банана и спелой ароматной клубники.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,16 гр; жиры 1,57 гр; углеводы 24,7 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>112,7 ккал</p>', NULL, NULL, NULL, 5, 1, '2021-09-02 09:08:00', '2021-09-07 08:44:09'),
(14, 1, 'Клубника', 'icecreams/September2021/yWci0vJ4CRuScbMh56PD.jpg', 0, 'klubnika', '<p>Сочный сорбет из ягод клубники.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,16 гр; жиры 1,57 гр; углеводы 24,7 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>112,7 ккал</p>', NULL, NULL, NULL, 6, 1, '2021-09-02 09:12:00', '2021-09-07 08:29:12'),
(15, 1, 'Лесные ягоды', 'icecreams/September2021/1eR0TymC3rEdHemJ9nbh.jpg', 0, 'lesnye-yagody', '<p>Пробуя это мороженое Вы как-будто попадаете на лесную поляну, залитую солнцем. В нем вся палитра ягодных вкусов - ежевика, малина, клубника&hellip;</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,24 гр; жиры 1,57 гр; углеводы 24,8 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>112,9 ккал</p>', NULL, NULL, NULL, 7, 1, '2021-09-02 09:12:00', '2021-09-07 08:43:46'),
(16, 1, 'Лимон', 'icecreams/September2021/TDUFqQR4jyk3N5cgWvUp.jpg', 0, 'limon', '<p>Бодрящий сорбет из сока и мякоти лимона. Прекрасен как диджестив и освежающее лакомство в перерывах между подачей основных блюд.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,24 гр; жиры 1,57 гр; углеводы 26,52 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>118,5 ккал.</p>', NULL, NULL, NULL, 8, 1, '2021-09-02 09:13:00', '2021-09-07 08:26:58'),
(17, 1, 'Малина', 'icecreams/September2021/35ruaDBrAt0MI1H3ba2m.jpg', 0, 'malina', '<p>Ягодный ароматный сорбет из спелой малины.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,16 гр; жиры 1,57 гр; углеводы 25,13 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>105,5 ккал</p>', NULL, NULL, NULL, 9, 1, '2021-09-02 09:13:00', '2021-09-07 08:27:09'),
(18, 3, 'Манго - Маракуйя', 'icecreams/September2021/yipAiCRYCPMgwJaJRYS2.jpg', 0, 'mango-marakujya', '<p>Экзотический сорбет из мякоти спелых плодов сладкого манго и кислой маракуйи.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,14 гр; жиры 1,07 гр; углеводы 36,52 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>118,5 ккал</p>', NULL, NULL, NULL, 10, 1, '2021-09-02 09:14:00', '2021-10-14 12:12:09'),
(19, 1, 'Мандарин', 'icecreams/September2021/oojPDkYGORnnPzkqWYeJ.jpg', 0, 'mandarin', NULL, NULL, NULL, NULL, 11, 1, '2021-09-02 09:14:59', '2021-09-02 09:14:59'),
(20, 1, 'Черная смородина', 'icecreams/September2021/HNgml5RmfsR3fOCM87Iz.jpg', 0, 'chernaya-smorodina', '<p>Сорбет с насыщенным и ярким вкусом ягод черной смородины.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0,02 гр; жиры 1,57 гр; углеводы 23,6 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 105,2 ккал</p>', NULL, NULL, NULL, 12, 1, '2021-09-02 09:15:00', '2021-09-07 08:24:15'),
(21, 1, 'Черника', 'icecreams/September2021/jn0awhQAXcWHeUI8QOfP.jpg', 0, 'chernika', '<p>Сорбет из ягод черники. Полезен для повышения остроты зрения.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 0.22 гр; жиры 1,57 гр; углеводы 48,6 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>118,8 ккал.</p>', NULL, NULL, NULL, 13, 1, '2021-09-02 09:15:00', '2021-09-07 08:25:22'),
(22, 2, 'Банан', 'icecreams/September2021/pnNrC8FXXLZewjgyZ9lG.jpg', 0, 'banan', '<p>Вкус спелого банана и нежных сливок.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,72 гр; жиры 7,89 гр; углеводы 29,9 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 187,5ккал</p>', NULL, NULL, NULL, 14, 1, '2021-09-02 09:16:00', '2021-09-07 08:55:58'),
(23, 2, 'Дыня', 'icecreams/September2021/36tyzuqlAdp9h6jMv5NE.jpg', 0, 'dynya', '<p>Вкус спелой дыни, напоенный августовским палящим солнцем и нежность взбитых сливок объединились в этом необычном джелато и создали весьма гармоничный дуэт.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,74 гр; жиры 8,89 гр; углеводы 23,04 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 177,5ккал</p>', NULL, NULL, NULL, 15, 1, '2021-09-02 09:17:00', '2021-09-07 08:59:57'),
(24, 2, 'Клубника', 'icecreams/September2021/p1Cw1gXzKeKp9hUFquuI.jpg', 0, 'klubnikaa', '<p>Нежное и воздушное сливочное джелато со вкусом клубники.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,74 гр; жиры 8,89 гр; углеводы 23,04 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 177,5 ккал</p>', NULL, NULL, NULL, 16, 1, '2021-09-02 09:18:00', '2021-09-07 09:05:11'),
(25, 2, 'Малина', 'icecreams/September2021/fFxeIwZrRbqFtbPbCXPo.jpg', 0, 'malinaa', '<p>Сливочное джелато с удивительно нежным малиновым вкусом.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белков 3,74 гр жиров 8,89 гр углеводов 23,04 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 177,5 ккал</p>', NULL, NULL, NULL, 17, 1, '2021-09-02 09:19:00', '2021-09-07 09:10:13'),
(26, 3, 'Амарена', 'icecreams/September2021/KzWjeMTxwZ8V7k1NIcE6.jpg', 0, 'amarena', '<p>Нежное йогуртовое мороженое с прослойкой из вишневого джема.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,6 гр; жиры 4,48 гр; углеводы 26,09 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 156,5 ккал.</p>', NULL, NULL, NULL, 18, 1, '2021-09-02 09:24:00', '2021-09-07 08:48:34'),
(27, 3, 'Вишневый йогурт', 'icecreams/September2021/rCbCXIwYAxex4kE3VeK8.jpg', 0, 'vishnevyj-jogurt', '<p>Легкое мороженое из вишневого йогурта.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,6 гр; жиры 4,48 гр; углеводы 26,09 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 156,5 ккал.</p>', NULL, NULL, NULL, 19, 1, '2021-09-02 09:24:00', '2021-09-07 08:47:26'),
(28, 2, 'SNIKERS', 'icecreams/September2021/zKA9HOMUrLN5B0LU0LFD.jpg', 0, 'snikers', '<p>Шоколадное мороженое с карамельно-ореховой прослойкой, напомнит Вам вкус популярного батончика Snickers.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 4,56 гр., жиры 11,5 гр., углеводы 23,2 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 223 ккал, 993,6 кДж</p>', NULL, NULL, NULL, 20, 1, '2021-09-02 09:25:00', '2021-09-07 08:53:48'),
(29, 2, 'Амарена', 'icecreams/September2021/dsV80AvCstSdNX7EZdws.jpg', 0, 'amarenaa', '<p>Нежное йогуртовое мороженое с прослойкой из вишневого джема.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,6 гр; жиры 4,48 гр; углеводы 26,09 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 156,5 ккал.</p>', NULL, NULL, NULL, 21, 1, '2021-09-02 09:25:00', '2021-09-07 11:20:56'),
(30, 2, 'Бабл гам', 'icecreams/September2021/X8JyGwtALdh7MY0LJqLP.jpg', 0, 'babl-gam', '<p>Яркое, привлекательное, самое детское джелато. Вкус любимой сладкой жевательной резинки.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,16 гр; жиры 8,52 гр; углеводы 29,9 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 728,02 кДж 174 ккал</p>', NULL, NULL, NULL, 22, 1, '2021-09-02 09:26:00', '2021-09-07 08:54:43'),
(31, 2, 'Ваниль', 'icecreams/September2021/sIk31jijbITMHabJI2k2.jpg', 0, 'vanil', '<p>Редкий сорт орхидеи &ndash; Мадагаскарская ваниль подарил этому сорту джелато особый нежный и манящий аромат.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,17 гр; жиры 8,82 гр; углеводы 29,9 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 172,9 ккал.</p>', NULL, NULL, NULL, 23, 1, '2021-09-02 09:26:00', '2021-09-07 08:58:16'),
(32, 2, 'Капучино', 'icecreams/September2021/RVwg301s82qcHOO6r9in.jpg', 0, 'kapuchino', '<p>Аромат свежемолотых зерен кофе, вкус нежный сливочно-кофейный, бодрящий.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,13 гр; жиры 8,4 гр; углеводы 18,5 гр.</p>\r\n<p><strong>Энергетическая ценность: </strong>161,8 ккал</p>', NULL, NULL, NULL, 24, 1, '2021-09-02 09:27:00', '2021-09-07 09:01:09'),
(33, 2, 'Карамель с кедровым орехом', 'icecreams/September2021/144l83L8GL6esjybEg46.jpg', 0, 'karamel-s-kedrovym-orehom', '<p>Бесподобное джелато с насыщенным вкусом карамели и кедровых орешков.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,20 гр; жиры 11,54 гр; углеводы 27,35 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 200,73ккал</p>', NULL, NULL, NULL, 25, 1, '2021-09-02 09:27:00', '2021-09-07 09:02:35'),
(34, 2, 'Карамельный попкорн', 'icecreams/September2021/D4lodlyOMi3ywh8gU1Am.jpg', 0, 'karamelnyj-popkorn', '<p>Сливочное джелато с попкорном в карамели.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 4 гр; жиры 9,02 гр; углеводы 25 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 780,3 кДж.</p>', NULL, NULL, NULL, 26, 1, '2021-09-02 09:28:00', '2021-09-07 09:04:01'),
(35, 2, 'Клубника со сливками', 'icecreams/September2021/JTepCF8USMXC3pkmTzQF.jpg', 0, 'klubnika-so-slivkami', '<p>Сливочное джелато с прослойкой из сладкого клубничного джема.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,74 гр; жиры 8,89 гр; углеводы 23,04 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 187,5 ккал</p>', NULL, NULL, NULL, 27, 1, '2021-09-02 09:28:00', '2021-09-07 09:06:07'),
(36, 2, 'Крем брюле', 'icecreams/September2021/TfIwnTClJ5JBeNUBijD3.jpg', 0, 'krem-bryule', '<p>Джелато с насыщенным карамельным вкусом знаменитого десерта.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,7 гр; жиры 8,7 гр; углеводы 24,5 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 189,6 ккал</p>', NULL, NULL, NULL, 28, 1, '2021-09-02 09:29:00', '2021-09-07 09:07:02'),
(37, 2, 'Лесной орех', 'icecreams/September2021/TnnoTvz3bKPNuSBXsG8s.jpg', 0, 'lesnoj-oreh', '<p>Сливочное джелато с дробленым, слегка обжаренным фундуком.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 4,37 гр; жиры 10,67 гр; углеводы 20,46 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 188,8 ккал</p>', NULL, NULL, NULL, 29, 1, '2021-09-02 09:29:00', '2021-09-07 09:08:52'),
(38, 2, 'Мята с шоколадом', 'icecreams/September2021/NOeo6m95RFHxfr5wBMx6.jpg', 0, 'myata-s-shokoladom', '<p>Джелато с контрастными вкусами мяты и хрустящей шоколадной крошки.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,9 гр; жиры 12,9 гр; углеводы 24,6 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 194 ккал</p>', NULL, NULL, NULL, 30, 1, '2021-09-02 09:30:00', '2021-09-07 09:12:24'),
(39, 2, 'Рафаэлло', 'icecreams/September2021/Wh3Q2dUGk1WGwJoePcSc.jpg', 0, 'rafaello', '<p>Невероятно нежное сливочное джелато с мякотью кокоса. Напоминает конфеты Рафаэлло.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 4,234 гр; жиры 11,3 гр; углеводы 46,01 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 179 ккал</p>', NULL, NULL, NULL, 31, 1, '2021-09-02 09:30:00', '2021-09-07 09:14:25'),
(40, 2, 'Сливочное', 'icecreams/September2021/oiSkgXgMfNHtJNQyZKCe.jpg', 0, 'slivochnoe', '<p>Классическое сливочное джелато, напоминающее пломбир.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,74 гр; жиры 8,89 гр; углеводы 23,04 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 177,5 ккал</p>', NULL, NULL, NULL, 32, 1, '2021-09-02 09:31:00', '2021-09-07 09:15:31'),
(41, 2, 'Соленая карамель', 'icecreams/September2021/X8luIcuiQ6kwlO9k9ajZ.jpg', 0, 'solenaya-karamel', '<p>Необычное сочетание карамели и морской соли делает этот вкус джелато незабываемым и любимым многими.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,2 гр; жиры 11,54 гр; углеводы 27,35 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 194 ккал</p>', NULL, NULL, NULL, 33, 1, '2021-09-02 09:31:00', '2021-09-07 09:17:24'),
(42, 2, 'Страчателла', 'icecreams/September2021/VUzwuRgRY71H5KAAodpu.jpg', 0, 'strachatella', '<p>Сливочное джелато с хрустящей шоколадной крошкой.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,78 гр; жиры 10,37 гр; углеводы 23,04 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 194 ккал</p>', NULL, NULL, NULL, 34, 1, '2021-09-02 09:32:00', '2021-09-07 09:16:23'),
(43, 2, 'Тирамису', 'icecreams/September2021/cM7HriQ9jM6uEj686NK6.jpg', 0, 'tiramisu', '<p>Джелато с бисквитно-кофейным вкусом десерта Тирамису.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,24 гр; жиры 10,25 гр; углеводы 21,99 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 175,2 ккал</p>', NULL, NULL, NULL, 35, 1, '2021-09-02 09:32:00', '2021-09-07 09:18:24'),
(44, 2, 'Фисташки', 'icecreams/September2021/KMZtOZwdjRS8YvSFnucR.jpg', 0, 'fistashki', '<p>Сливочно-ореховое джелато с дроблеными иранскими фисташками.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 4,61 гр; жиры 9,87 гр; углеводы 20,51 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 187,3 ккал</p>', NULL, NULL, NULL, 36, 1, '2021-09-02 09:33:00', '2021-09-07 09:20:33'),
(45, 2, 'Чизкейк', 'icecreams/September2021/zGHatQxb0XWUSenggPYI.jpg', 0, 'chizkejk', '<p>Джелато со вкусом классического чизкейка и прослойкой из черничного джема.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 3,41 гр; жиры 7,54 гр; углеводы 21,2 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 180,6 ккал</p>', NULL, NULL, NULL, 37, 1, '2021-09-02 09:33:00', '2021-09-07 09:19:23'),
(46, 2, 'Шоколад', 'icecreams/September2021/BE5oYpqmMaKUNM6fi0nU.jpg', 0, 'shokolad', '<p>Джелато с насыщенным вкусом темного шоколада.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,67 гр; жиры 9,72 гр; углеводы 25,18 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 195 ккал</p>', NULL, NULL, NULL, 38, 1, '2021-09-02 09:34:00', '2021-09-07 09:22:43'),
(47, 2, 'Шоколадное печенье', 'icecreams/September2021/wPcvqDD6IHrUvY7ePI4g.jpg', 0, 'shokoladnoe-pechene', '<p>Сливочное джелато с бисквитным вкусом и прослойкой из шоколадного печенья.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,17 гр; жиры 10,25 гр; углеводы 29,9 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 179 ккал</p>', NULL, NULL, NULL, 39, 1, '2021-09-02 09:35:00', '2021-09-07 09:23:48'),
(48, 2, 'Яблочный пирог', 'icecreams/September2021/wbXx394snBJ3W9JGqjIE.jpg', 0, 'yablochnyj-pirog', '<p>Сливочное джелато с прослойкой из яблок тушеных с корицей.</p>\r\n<p><strong>Пищевая ценность в 100 грамм:</strong></p>\r\n<p>Белки 2,7 гр; жиры 8,7 гр; углеводы 27,7 гр.</p>\r\n<p><strong>Энергетическая ценность:</strong> 202,6 ккал</p>', NULL, NULL, NULL, 40, 1, '2021-09-02 09:35:00', '2021-09-07 09:24:44');

-- --------------------------------------------------------

--
-- Структура таблицы `ice_portions`
--

CREATE TABLE `ice_portions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icecream_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ice_portions`
--

INSERT INTO `ice_portions` (`id`, `icecream_id`, `title`, `icon`, `excerpt`, `price`, `default`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(7, 9, 'Баночка 400 гр', 'ice-portions/September2021/rOjEgSxickl7LVkRx7cT.svg', '7 порций', 2000, 1, 1, 1, '2021-09-06 15:03:42', '2021-09-06 15:03:42'),
(8, 9, 'Баночка 1500 гр', 'ice-portions/September2021/DIKAXSvxgeVJhLrY4Ziv.svg', '21 порция', 4950, 0, 2, 1, '2021-09-06 15:04:44', '2021-09-06 15:04:44'),
(11, 10, 'Баночка 400 гр', 'ice-portions/September2021/096ZGAlgTlwVk2qAQTw5.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 09:49:46', '2021-09-07 09:49:46'),
(12, 10, 'Баночка 1500 гр', 'ice-portions/September2021/cbmwu4yH10fTUhlKhPh2.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 09:51:03', '2021-09-07 09:51:03'),
(14, 11, 'Баночка 400 гр', 'ice-portions/September2021/7rtLSQMyW3peNVlipaJz.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 09:51:57', '2021-09-07 09:51:57'),
(15, 11, 'Баночка 1500 гр', 'ice-portions/September2021/elz6owkWatycxWooL8z9.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 09:52:28', '2021-09-07 09:52:28'),
(17, 12, 'Баночка 400 гр', 'ice-portions/September2021/Myyt54A88ubBdjRUHAg6.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:20:53', '2021-09-07 10:20:53'),
(18, 12, 'Баночка 1500 гр', 'ice-portions/September2021/mVI2oK9zhX31Hj5ft17f.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:21:20', '2021-09-07 10:21:20'),
(20, 13, 'Баночка 400 гр', 'ice-portions/September2021/sgOBEIfs9uwG4qPgND9V.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:22:21', '2021-09-07 10:22:21'),
(21, 13, 'Баночка 1500 гр', 'ice-portions/September2021/PAAuXZtQ0JAvjpd8Fo18.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:22:46', '2021-09-07 10:22:46'),
(23, 14, 'Баночка 400 гр', 'ice-portions/September2021/pg2m4T09G8HziAQqtFVS.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:30:34', '2021-09-07 10:30:34'),
(24, 14, 'Баночка 1500 гр', 'ice-portions/September2021/3MZOsYqsky9s06fzNZHz.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:32:48', '2021-09-07 10:32:48'),
(27, 15, 'Баночка 400 гр', 'ice-portions/September2021/v4YIUc5Brn1KcMxmPy9j.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:33:00', '2021-09-07 10:34:18'),
(28, 15, 'Баночка 1500 гр', 'ice-portions/September2021/LmhvZnP0vWsQcqI5q5C9.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:33:47', '2021-09-07 10:33:47'),
(30, 16, 'Баночка 400 гр', 'ice-portions/September2021/MDF3aukJdfcaC8XD0p4X.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:36:14', '2021-09-07 10:36:14'),
(31, 16, 'Баночка 1500 гр', 'ice-portions/September2021/KL4kO03x5CyAebxkQdVc.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:36:32', '2021-09-07 10:36:32'),
(33, 17, 'Баночка 400 гр', 'ice-portions/September2021/yW8PwGP75evBweOARLW8.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:37:20', '2021-09-07 10:37:20'),
(34, 17, 'Баночка 1500 гр', 'ice-portions/September2021/Z6nsVxH0hQRb7a5sKknY.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:37:36', '2021-09-07 10:37:36'),
(36, 18, 'Баночка 400 гр', 'ice-portions/September2021/pJCk7Jgr1qpH4dLCEuct.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:38:16', '2021-09-07 10:38:16'),
(37, 18, 'Баночка 1500 гр', 'ice-portions/September2021/uxkxv4sp3o3A9eoq3ygy.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:38:39', '2021-09-07 10:38:39'),
(39, 19, 'Баночка 400 гр', 'ice-portions/September2021/V94RfKzYHoDrWX0NTx7e.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:39:19', '2021-09-07 10:39:19'),
(40, 19, 'Баночка 1500 гр', 'ice-portions/September2021/XH6G5hO8R9cUUfkbL7b6.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:39:38', '2021-09-07 10:39:38'),
(42, 20, 'Баночка 400 гр', 'ice-portions/September2021/vBjl7G3QvPmZTiw95Keu.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:40:14', '2021-09-07 10:40:14'),
(43, 20, 'Баночка 1500 гр', 'ice-portions/September2021/1MKZIdruGypdWITKtOoe.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:40:33', '2021-09-07 10:40:33'),
(45, 21, 'Баночка 400 гр', 'ice-portions/September2021/gP7ovYc952T5F6Th7xK5.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:41:11', '2021-09-07 10:41:11'),
(46, 21, 'Баночка 1500 гр', 'ice-portions/September2021/NezBtLFWZYZyahqJ3Z89.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:41:57', '2021-09-07 10:41:57'),
(48, 22, 'Баночка 400 гр', 'ice-portions/September2021/i6KCaK39GCtceQ0JPjDr.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:42:37', '2021-09-07 10:42:37'),
(49, 22, 'Баночка 1500 гр', 'ice-portions/September2021/5iAjwzLhT33masQEqbbR.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:43:03', '2021-09-07 10:43:03'),
(51, 23, 'Баночка 400 гр', 'ice-portions/September2021/Tc40ixdhR6ljLWnG69hE.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:43:37', '2021-09-07 10:43:37'),
(52, 23, 'Баночка 1500 гр', 'ice-portions/September2021/XEqZvJwMWAAmTnH9FEoq.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:43:55', '2021-09-07 10:43:55'),
(54, 24, 'Баночка 400 гр', 'ice-portions/September2021/SmmSpFS07kH6bpwnMfw6.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:44:38', '2021-09-07 10:44:38'),
(55, 24, 'Баночка 1500 гр', 'ice-portions/September2021/Z36LgOPdQmv8QZh5A4jz.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:44:59', '2021-09-07 10:44:59'),
(57, 25, 'Баночка 400 гр', 'ice-portions/September2021/N09h2Xa1iAe9yzWXhs8t.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:45:39', '2021-09-07 10:45:39'),
(58, 25, 'Баночка 1500 гр', 'ice-portions/September2021/234QhWuMKQtQEH6Smut8.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:45:58', '2021-09-07 10:45:58'),
(60, 26, 'Баночка 400 гр', 'ice-portions/September2021/vmnpD4H9OijPCvUMGVjx.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:47:05', '2021-09-07 10:47:05'),
(61, 26, 'Баночка 1500 гр', 'ice-portions/September2021/qbFMteFoMQ5fkLLFZRNf.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:47:25', '2021-09-07 10:47:25'),
(63, 27, 'Баночка 400 гр', 'ice-portions/September2021/uAfV2o18Yz1fNtE1Ejvl.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:48:04', '2021-09-07 10:48:04'),
(64, 27, 'Баночка 1500 гр', 'ice-portions/September2021/JJbyrHW7DTl4FpZX9jCK.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:48:22', '2021-09-07 10:48:22'),
(66, 28, 'Баночка 400 гр', 'ice-portions/September2021/33VpFrDL9cUwg85o9UVJ.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:49:06', '2021-09-07 10:49:06'),
(67, 28, 'Баночка 1500 гр', 'ice-portions/September2021/9BSMNCr59fQk9tPXOU1P.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:49:23', '2021-09-07 10:49:23'),
(72, 30, 'Баночка 400 гр', 'ice-portions/September2021/ZkrcJwGl87K9MNWVuith.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:51:13', '2021-09-07 10:51:13'),
(73, 30, 'Баночка 1500 гр', 'ice-portions/September2021/NAiSJD5GaQhP9WyBDqf7.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:51:29', '2021-09-07 10:51:29'),
(75, 31, 'Баночка 400 гр', 'ice-portions/September2021/EPy2UJtQnMI6OwFblDRE.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:52:23', '2021-09-07 10:52:23'),
(76, 31, 'Баночка 1500 гр', 'ice-portions/September2021/q7STTLP6qmHYMbdpqM5z.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:52:40', '2021-09-07 10:52:40'),
(78, 32, 'Баночка 400 гр', 'ice-portions/September2021/VTPZ193uMmShT94EHdHB.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:53:18', '2021-09-07 10:53:18'),
(79, 32, 'Баночка 1500 гр', 'ice-portions/September2021/AKnm6RrJvQuTxeDsZRyA.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:53:40', '2021-09-07 10:53:40'),
(81, 33, 'Баночка 400 гр', 'ice-portions/September2021/CKeqY4YCKSIJH6eOERS1.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:54:34', '2021-09-07 10:54:34'),
(82, 33, 'Баночка 1500 гр', 'ice-portions/September2021/M0MTFLyVEauVq1CfhXYM.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:56:06', '2021-09-07 10:56:06'),
(84, 34, 'Баночка 400 гр', 'ice-portions/September2021/yY6Y0VmtomIIVKSZUG8q.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:56:48', '2021-09-07 10:56:48'),
(85, 34, 'Баночка 1500 гр', 'ice-portions/September2021/wWnEFeLK8W46lfTwIpsS.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:57:05', '2021-09-07 10:57:05'),
(87, 35, 'Баночка 400 гр', 'ice-portions/September2021/sqdvvI5J5aGJrR5lOxYL.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:57:40', '2021-09-07 10:57:40'),
(88, 35, 'Баночка 1500 гр', 'ice-portions/September2021/nxAj9rkDDvP1mHm0uYXK.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:57:57', '2021-09-07 10:57:57'),
(90, 36, 'Баночка 400 гр', 'ice-portions/September2021/TeNAMgliZTOwZaGLMOgi.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:58:30', '2021-09-07 10:58:30'),
(91, 36, 'Баночка 1500 гр', 'ice-portions/September2021/yefCw9DY5BmLXs2hmRZO.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 10:58:47', '2021-09-07 10:58:47'),
(93, 37, 'Баночка 400 гр', 'ice-portions/September2021/h77Sa27kywoBgzl62OSc.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 10:59:28', '2021-09-07 10:59:28'),
(94, 37, 'Баночка 1500 гр', 'ice-portions/September2021/Zkwd3yau1C2zjQZqTZsP.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:00:06', '2021-09-07 11:00:06'),
(96, 38, 'Баночка 400 гр', 'ice-portions/September2021/9ncD7Q4Etrq8FaehATdX.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:00:42', '2021-09-07 11:00:42'),
(97, 38, 'Баночка 1500 гр', 'ice-portions/September2021/gDLFqaYlY446HkD6cAyc.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:01:00', '2021-09-07 11:01:00'),
(99, 39, 'Баночка 400 гр', 'ice-portions/September2021/IQtnBdiaghifBe7Xw6bM.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:02:24', '2021-09-07 11:02:24'),
(100, 39, 'Баночка 1500 гр', 'ice-portions/September2021/yYKu5SlHfzYKH6FbufUs.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:02:44', '2021-09-07 11:02:44'),
(102, 40, 'Баночка 400 гр', 'ice-portions/September2021/yJy6LQCS0M9at9i8zwDG.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:03:29', '2021-09-07 11:03:29'),
(103, 40, 'Баночка 1500 гр', 'ice-portions/September2021/DscRekKRhxpzGhXArJZt.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:03:47', '2021-09-07 11:03:47'),
(105, 41, 'Баночка 400 гр', 'ice-portions/September2021/Z4k4nNP0B6Q0FllUtm2r.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:05:18', '2021-09-07 11:05:18'),
(106, 41, 'Баночка 1500 гр', 'ice-portions/September2021/DH23qWYzKe9mpR7iKjpi.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:05:38', '2021-09-07 11:05:38'),
(108, 42, 'Баночка 400 гр', 'ice-portions/September2021/YGZ8Pk3277w6PhKWk2cW.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:06:16', '2021-09-07 11:06:16'),
(109, 42, 'Баночка 1500 гр', 'ice-portions/September2021/8XPSEuD78QF99RIScXfv.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:06:34', '2021-09-07 11:06:34'),
(111, 43, 'Баночка 400 гр', 'ice-portions/September2021/ey3IHnfUU4cRMvb4zcsh.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:07:12', '2021-09-07 11:07:12'),
(112, 43, 'Баночка 1500 гр', 'ice-portions/September2021/q07IWKaePAVPIdqfTseR.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:07:33', '2021-09-07 11:07:33'),
(114, 44, 'Баночка 400 гр', 'ice-portions/September2021/RoG5sShCOODR3AuGPc4y.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:08:22', '2021-09-07 11:08:22'),
(115, 44, 'Баночка 1500 гр', 'ice-portions/September2021/OhFaU72ucvP2t2kWoSMC.svg', '21 порция', 4950, 1, 1, 1, '2021-09-07 11:08:39', '2021-09-07 11:08:39'),
(117, 45, 'Баночка 400 гр', 'ice-portions/September2021/JTEFEdzLq2J5Cl7dFIe3.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:09:19', '2021-09-07 11:09:19'),
(118, 45, 'Баночка 1500 гр', 'ice-portions/September2021/RoZkGmUu9r9FDiBQmkCf.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:09:40', '2021-09-07 11:09:40'),
(120, 46, 'Баночка 400 гр', 'ice-portions/September2021/S4RKaoN0KJOBagrCTuci.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:10:22', '2021-09-07 11:10:22'),
(121, 46, 'Баночка 1500 гр', 'ice-portions/September2021/SIMhhMeXL4Ds4yxtoYE0.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:13:08', '2021-09-07 11:13:08'),
(123, 47, 'Баночка 400 гр', 'ice-portions/September2021/s4xffZwwyJDip9SEedni.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:13:43', '2021-09-07 11:13:43'),
(124, 47, 'Баночка 1500 гр', 'ice-portions/September2021/q6XJm6d0ZOWZZ823Hkr0.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:14:02', '2021-09-07 11:14:02'),
(126, 48, 'Баночка 400 гр', 'ice-portions/September2021/0yhDivrwyjL8Kc6GyP0q.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:14:39', '2021-09-07 11:14:39'),
(127, 48, 'Баночка 1500 гр', 'ice-portions/September2021/7XFaAkzEOPTj4KFikIan.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:14:58', '2021-09-07 11:14:58'),
(129, 29, 'Баночка 400 гр', 'ice-portions/September2021/kUrGY6q1nReiMVPhT66a.svg', '7 порций', 2000, 1, 1, 1, '2021-09-07 11:18:57', '2021-09-07 11:18:57'),
(130, 29, 'Баночка 1500 гр', 'ice-portions/September2021/QLbWh0jexkEMH5akv6i8.svg', '21 порция', 4950, 0, 2, 1, '2021-09-07 11:19:19', '2021-09-07 11:19:19');

-- --------------------------------------------------------

--
-- Структура таблицы `ice_types`
--

CREATE TABLE `ice_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ice_types`
--

INSERT INTO `ice_types` (`id`, `title`, `slug`, `seo_title`, `meta_description`, `meta_keywords`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Сорбеты', 'sorbety', 'Сорбеты', 'Сорбеты', 'Сорбеты', 1, 1, '2021-08-01 07:31:55', '2021-08-01 07:31:55'),
(2, 'Сливочное', 'slivochnoe', 'Сливочное', 'Сливочное', 'Сливочное', 2, 1, '2021-08-01 07:32:06', '2021-08-01 07:32:06'),
(3, 'Йогуртовое', 'jogurtovoe', 'Йогуртовое', 'Йогуртовое', 'Йогуртовое', 3, 1, '2021-08-01 07:32:00', '2021-09-20 12:21:18');

-- --------------------------------------------------------

--
-- Структура таблицы `image_texts`
--

CREATE TABLE `image_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title_two` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_two` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `image_texts`
--

INSERT INTO `image_texts` (`id`, `page_id`, `title`, `image`, `icon`, `body`, `sort_id`, `status`, `created_at`, `updated_at`, `title_two`, `body_two`) VALUES
(1, 12, 'Dolce Rosa', 'image-texts/October2021/XevWeJQxukl1V3CNrqXq.jpg', 'image-texts\\July2021\\uWpEUSmoOcdq2Ck233mO.png', '<p>ТОО &laquo;Gelato TUTTO BENE&raquo; является эксклюзивным поставщиком ингредиентов под торговой маркой &laquo;Dolce Rosa&raquo; для производства джелато на территории Республики Казахстан.</p>', 1, 1, '2021-07-31 10:30:00', '2021-10-15 07:01:02', NULL, NULL),
(2, 12, NULL, NULL, NULL, '<b>Базы для приготовления джелато</b>\r\n                    <p>Сухие смеси Dolce Rosa позволят Вам самостоятельно производить джелато не уступающему по вкусу и качеству мороженому, которое делают мастера джелатерье в Италии.</p>\r\n                    <p>Удобная упаковка — фольгированный пакет, весом 2 кг. Срок годности 1 год.</p>', 1, 1, '2021-07-31 10:58:43', '2021-07-31 10:58:43', NULL, NULL),
(3, 12, NULL, NULL, NULL, '<b>Начинки - вариегато, добавляемые в джелато для создания слоев</b>\r\n                    <p>Начинки - вариегато созданы для изготовления слоеного джелато с карамельной, шоколадной или фруктово-ягодной прослойкой.</p>\r\n                    <p>Удобная упаковка — пластиковое ведерко.</p>', 2, 1, '2021-07-31 10:58:43', '2021-07-31 10:58:43', NULL, NULL),
(4, 12, NULL, NULL, NULL, '<b>Фруктовые пасты для приготовления джелато и сорбетов</b>\r\n                    <p>Пасты для приготовления сорбетов - этоконцентраты сока и мякоти ягод или фруктов.</p>\r\n                    <p>Удобная упаковка — пластиковое ведерко.</p>', 3, 1, '2021-07-31 10:58:43', '2021-07-31 10:58:43', NULL, NULL),
(5, 12, NULL, NULL, NULL, '<b>Пасты для приготовления классического джелато</b>\r\n                    <p>Вкусовые добавки на основе натуральных ингредиентов для придания мороженому определенного вкуса.</p>\r\n                    <p>Удобная упаковка — пластиковое ведерко, весом 2 или 2,5 кг. Срок годности 1 год.</p>', 4, 1, '2021-07-31 10:58:43', '2021-07-31 10:58:43', NULL, NULL),
(6, 12, NULL, NULL, NULL, '<b>Смеси для приготовления мягкого мороженого</b>\r\n                    <p>Полностью готовые базы позволяют легко и быстро приготовить мягкое мороженое или молочный коктейль.</p>\r\n                    <p>Удобная упаковка — фольгированный пакет весом 1,75 или 2,25 кг. Срок годности 1 год.</p>', 5, 1, '2021-07-31 10:58:43', '2021-07-31 10:58:43', NULL, NULL),
(7, 12, NULL, NULL, NULL, '<b>Топинги для украшения мороженого и десертов</b>\r\n                    <p>Топинги Dolce Rosa, приготовленные по итальянской рецептуре и технологии, прекрасно подойдут для украшения любого десерта, мороженого или выпечки, для придания яркости вкуса молочному коктейлю или кофе.</p>', 6, 1, '2021-07-31 10:58:43', '2021-07-31 10:58:43', NULL, NULL),
(8, 12, 'Всегда в наличии основные ингредиенты для производства джелато и сорбетов', NULL, 'image-texts\\July2021\\NMZA1LjFeYMny1xeEGGm.svg', NULL, 1, 1, '2021-07-31 11:11:00', '2021-07-31 11:11:52', NULL, NULL),
(9, 12, 'Бесплатная доставка по г.Алматы при заказе более, чем на 10 000 тенге', NULL, 'image-texts\\July2021\\fLyCNQF0SQFlTFGLHkfT.svg', NULL, 2, 1, '2021-07-31 11:11:41', '2021-07-31 11:11:41', NULL, NULL),
(10, 12, 'Регулярные поставки ингредиентов в РК от производителя, каждые 3-4 недели', NULL, 'image-texts\\July2021\\dvYo2qoACLYvemoaBoQd.svg', NULL, 3, 1, '2021-07-31 11:12:14', '2021-07-31 11:12:14', NULL, NULL),
(11, 7, NULL, 'image-texts\\July2021\\wwj9dFmcFQ12RgSZuCeL.png', NULL, '<p><strong>Gelato Tutto Bene, как все начиналось:</strong></p>\r\n<p>Компания неслучайно носит такое название, ведь взяла свое начало именно в Италии &ndash; стране, кухня которой признана одной из самых вкусных и популярных в мире. Но далеко не все знают, какое невероятное мороженое там создают!</p>\r\n<p><strong>Представьте:</strong></p>\r\n<p>Маленький итальянский городок, повсюду черепичные крыши, кованые заборчики и цветы, обвивающие ставни и свисающие большими яркими пятнами на фасадах домов. Теплое весеннее утро, наполненное солнечным светом, запахом кофе и свежей выпечки.</p>\r\n<p>Здесь, во всем великолепии, в уютной маленькой джелатерии хозяйка приносит вам вазочку джелато, во вкус которого Вы влюбляетесь.</p>\r\n<p>Именно в такой, наполненный удивительным вкусом день возникла идея привезти чудо-десерт в любимый город Алматы. Сейчас итальянское джелато TUTTO BENE известно не только в Алматы, но и далеко за его пределами.</p>', 1, 1, '2021-07-31 11:35:16', '2021-07-31 11:35:16', NULL, NULL),
(12, 7, NULL, 'image-texts\\July2021\\kTmSzk4SL1Fjh4SxTHuF.png', NULL, '<p>Сегодня Gelato Tutto Bene- производитель итальянского мороженого (джелато), уверенно закрепивший позиции производителя натурального высококачественного продукта, полюбившегося ценителями джелато всех возрастов.</p>\r\n<p>Компания активно ведет свою деятельность с 2009 года, открыв сеть мини- джелатерий во всех лидирующих ТРЦ г. Алматы.</p>\r\n<p>В ассортименте мороженого представлено 3 сорта джелато: йогуртовое мороженое, более 27 вкусов сливочного джелато и 13 сорбетов.</p>\r\n<p>У нас Вы так же можете побаловать себя восхитительными тортами- мороженое, молочными коктейлями и десертами, приготовленными при Вас на холодном столе.</p>\r\n<p>Все мороженое производим на основе натуральных продуктов: сливок, молока, ягод и фруктов с добавлением орехов, печенья, карамели, джемов и сиропов.</p>\r\n<p><strong>Окунитесь в мир ярких и невероятных вкусов Tutto Bene!</strong></p>', 2, 1, '2021-07-31 11:35:45', '2021-07-31 11:35:45', NULL, NULL),
(13, 10, 'Франшиза Tutto Bene — это возможность войти в успешный, красивый бизнес, пользуясь опытом и поддержкой партнера', 'image-texts/October2021/CbB0hzoEYY0pHVSi7yxs.jpg', NULL, NULL, 1, 1, '2021-07-31 11:50:00', '2021-10-15 06:31:06', NULL, NULL),
(14, 10, 'Торговая франшиза для Алматы', NULL, NULL, '<p>От 15 000$ киоск для продажи мороженого и молочных коктейлей площадью 6 кв/м на территории ТРЦ</p>\r\n<p>От 30 000$ джелатерия на территории ТРЦ, площадью 45-50 кв/м</p>', 2, 1, '2021-07-31 11:51:00', '2021-10-15 06:38:01', 'Первоначальные инвестиции', NULL),
(15, 10, 'ПРОИЗВОДСТВЕННО-ТОРГОВАЯ ФРАНШИЗА', NULL, NULL, '<p>От 15 000$ киоск для продажи мороженого и молочных коктейлей площадью 6 кв/м на территории ТРЦ</p>\r\n<p>От 30 000$ джелатерия на территории ТРЦ, площадью 45-50 кв/м</p>\r\n<p>От 15 000$ киоск для продажи мороженого и молочных коктейлей площадью 6 кв/м на территории ТРЦ</p>\r\n<p>От 30 000$ джелатерия на территории ТРЦ, площадью 45-50 кв/м</p>\r\n<p>От 15 000$ киоск для продажи мороженого и молочных коктейлей площадью 6 кв/м на территории ТРЦ</p>\r\n<p>От 30 000$ джелатерия на территории ТРЦ, площадью 45-50 кв/м</p>', 2, 1, '2021-07-31 11:51:00', '2021-10-15 06:39:54', 'ПРОИЗВОДСТВЕННАЯ ФРАНШИЗА ДЛЯ ДРУГИХ ГОРОДОВ', NULL),
(16, 8, 'Что такое Джелато', 'image-texts/October2021/H8CsBIjpAggrSSEoUUdE.jpg', NULL, '<div class=\"OutlineElement Ltr SCXW165524468 BCX0\" style=\"margin: 0px; padding: 0px; user-select: text; -webkit-user-drag: none; -webkit-tap-highlight-color: transparent; overflow: visible; cursor: text; clear: both; position: relative; direction: ltr; color: #000000; font-family: \'Segoe UI\', \'Segoe UI Web\', Arial, Verdana, sans-serif; font-size: 12px;\">\r\n<p class=\"Paragraph SCXW165524468 BCX0\" style=\"margin: 0px; padding: 0px; user-select: text; -webkit-user-drag: none; -webkit-tap-highlight-color: transparent; overflow-wrap: break-word; vertical-align: baseline; font-kerning: none; background-color: transparent; color: windowtext; text-align: justify;\"><span style=\"color: #ffffff;\"><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">Родина джелато - Италия. Оно </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">не похоже ни на одно мороженое </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">в мире.&nbsp;</span></span></p>\r\n</div>\r\n<div class=\"OutlineElement Ltr SCXW165524468 BCX0\" style=\"margin: 0px; padding: 0px; user-select: text; -webkit-user-drag: none; -webkit-tap-highlight-color: transparent; overflow: visible; cursor: text; clear: both; position: relative; direction: ltr; color: #000000; font-family: \'Segoe UI\', \'Segoe UI Web\', Arial, Verdana, sans-serif; font-size: 12px;\">\r\n<p class=\"Paragraph SCXW165524468 BCX0\" style=\"margin: 0px; padding: 0px; user-select: text; -webkit-user-drag: none; -webkit-tap-highlight-color: transparent; overflow-wrap: break-word; vertical-align: baseline; font-kerning: none; background-color: transparent; color: windowtext; text-align: justify;\"><br style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\" /><span style=\"color: #ffffff;\"><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">Нежное, плотное, передающее всю </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">яркость вкуса. </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">Уникальность джелато </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">в том, что оно сделано прямо </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">сейчас, сделано вручную, </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">и мастер-джелатерье влодил </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">в него искреннюю любовь </span><span style=\"font-family: Arial, sans-serif; font-size: 15px; text-align: start;\">и заботу.</span></span></p>\r\n</div>', 4, 1, '2021-07-31 11:59:00', '2021-10-15 07:14:51', NULL, NULL),
(17, 8, 'Что такое Сорбеты', 'image-texts/October2021/QfEdRTPqUegMiuwvMBMz.jpg', NULL, '<p>Сорбеты подобны фруктам, из которых они созданы: искрящиеся мандарины, сочные лимоны, яркий тропический манго, ароматная клубника, напоенные солнцем лесные ягоды&hellip;</p>', 5, 1, '2021-07-31 12:00:00', '2021-10-15 07:08:03', NULL, NULL),
(18, 8, 'Натуральные фрукты и ягоды', 'image-texts/October2021/dxLllaxdJKSWRFMiKCw0.jpg', 'image-texts/October2021/i7i5RzWEi92VnJVZGPHh.png', '<p>Сорбеты подобны фруктам, из которых они созданы: искрящиеся мандарины, сочные лимоны, яркий тропический манго, ароматная клубника, напоенные солнцем лесные ягоды&hellip;</p>', 1, 1, '2021-07-31 12:40:00', '2021-10-15 08:09:38', 'СОРБЕТЫ', NULL),
(19, 8, 'Без молочных продуктов', NULL, 'image-texts/October2021/VBIUl8p3RUSIF4EKpWnY.png', NULL, 1, 1, '2021-07-31 12:40:00', '2021-10-15 08:11:51', NULL, NULL),
(20, 8, 'Пониженная калорийность', NULL, 'image-texts/October2021/ADFSdLmsanRd4zPQXxCd.png', NULL, 1, 1, '2021-07-31 12:41:00', '2021-10-15 08:13:58', NULL, NULL),
(21, 8, 'Содержание жира 0%', NULL, 'image-texts/October2021/P9VzV5xgSqS25OpPZFdl.png', NULL, 1, 1, '2021-07-31 12:41:00', '2021-10-15 08:23:24', NULL, NULL),
(22, 8, 'Всегда свежее', NULL, 'image-texts/October2021/qpCG1pbVlxSr7J018AXt.png', NULL, 2, 1, '2021-07-31 12:42:00', '2021-10-15 08:40:01', NULL, NULL),
(23, 8, 'Без молочных продуктов', NULL, 'image-texts/September2021/1AsGAVxIT6Ia2XdpTn8w.svg', NULL, 2, 1, '2021-07-31 12:42:00', '2021-10-14 13:27:37', NULL, NULL),
(24, 8, 'Всего 35% воздуха', NULL, 'image-texts/October2021/TZDvRhq3Tm7pC9paTSp8.png', NULL, 2, 1, '2021-07-31 12:42:00', '2021-10-15 08:49:43', NULL, NULL),
(25, 8, 'Содержание жира 0-11%', NULL, 'image-texts/October2021/Z2jzK1B8mc5JdPG355gM.png', NULL, 2, 1, '2021-07-31 12:43:00', '2021-10-15 08:51:11', NULL, NULL),
(26, 11, NULL, 'image-texts/October2021/jGxgWBfwEixXOEnXPmMw.jpg', NULL, '<p>Джелато несомненно станет изюминкой Вашего десертного меню привлечет к Вам новых гостей.</p>\r\n<p>Доставка свежеприготовленного мороженого в течение одного дня добавит Вам финансовой свободы и избавит от необходимости хранения значительных товарных запасов.</p>\r\n<p>Разнообразие вкусов джелато откроет неограниченные возможности для создания новых, изысканных блюд.</p>', 1, 1, '2021-07-31 12:54:00', '2021-10-15 06:41:53', NULL, NULL),
(27, 11, 'Заказ выполняется в течении 24 часов', NULL, 'image-texts\\July2021\\b5g0pkyG8LxohyxL3Npe.svg', NULL, 1, 1, '2021-07-31 12:54:59', '2021-07-31 12:54:59', NULL, NULL),
(28, 11, 'Бесплатная доставка по г. Алматы при заказе более 3 кг мороженого', NULL, 'image-texts\\July2021\\vT6Mw30T9yVcPeGWhaSE.svg', NULL, 2, 1, '2021-07-31 12:57:29', '2021-07-31 12:57:29', NULL, NULL),
(29, 11, 'Оплата наличными при доставке, либо безналичный расчет при условии заключения договора', NULL, 'image-texts\\July2021\\LryCUerpsjSaBznDlEvU.svg', NULL, 3, 1, '2021-07-31 12:57:56', '2021-07-31 12:57:56', NULL, NULL),
(30, 1, 'Что входит в состав нашего мороженого', 'image-texts/September2021/EnacKV61cHmdBZHgBA0x.png', NULL, NULL, 1, 1, '2021-07-31 13:26:00', '2021-09-22 12:53:27', NULL, NULL),
(31, 1, 'Натуральное молоко', NULL, 'image-texts/September2021/ftYN4F0s2DirD4Nl4AmH.svg', NULL, 1, 1, '2021-07-31 13:26:00', '2021-09-16 14:28:33', NULL, NULL),
(32, 1, 'Сливки', NULL, 'image-texts/September2021/uR42SzzgiHrXGv2yMZbb.svg', NULL, 1, 1, '2021-07-31 13:27:00', '2021-09-16 14:28:46', NULL, NULL),
(33, 1, 'Сахар', NULL, 'image-texts/September2021/T7OQFH9FifKIMx5bA65A.svg', NULL, 1, 1, '2021-07-31 13:27:00', '2021-09-16 14:48:51', NULL, NULL),
(34, 1, 'Карамель', NULL, 'image-texts/September2021/tsePbBy8RvipSseJL5fe.svg', NULL, 1, 1, '2021-07-31 13:27:00', '2021-09-16 14:50:15', NULL, NULL),
(35, 1, 'Шоколад', NULL, 'image-texts/September2021/xKYqr89IxanamqVJ7gyd.svg', NULL, 20, 1, '2021-07-31 13:28:00', '2021-10-14 11:39:39', 'Пониженная калорийность', NULL),
(36, 1, 'Орехи', NULL, 'image-texts/September2021/4TuPOPeFF9gmNCdX9Jx6.svg', NULL, 2, 1, '2021-07-31 13:28:00', '2021-09-16 14:51:41', NULL, NULL),
(37, 1, 'Ягоды и фрукты', NULL, 'image-texts/September2021/U8QoLOElFbndKJJvnEkW.svg', NULL, 2, 1, '2021-07-31 13:28:00', '2021-09-22 12:55:02', NULL, NULL),
(38, 1, 'Печенье', NULL, 'image-texts/September2021/mEt1DqczKWBUk4BVHGqV.svg', NULL, 2, 1, '2021-07-31 13:29:00', '2021-09-16 14:53:37', NULL, NULL),
(39, 1, NULL, 'image-texts/October2021/JsCldjDblS4VCyX6ldvD.jpg', NULL, '<h3>О компании</h3>\r\n<p style=\"color: #000000; font-family: Arial, sans-serif; font-size: 15px; text-align: justify;\"><span style=\"font-size: 11pt;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"color: #212529; font-family: \'blogger sans\'; font-size: 10pt; line-height: 20.25pt;\">Tutto Bene &ndash; в переводе с итальянского &laquo;великолепно!&raquo;, &laquo;очень хорошо!&raquo;. Название стало девизом компании и критерием оценки всего, что мы делаем.</span></span></span></p>\r\n<p style=\"color: #000000; font-family: Arial, sans-serif; font-size: 15px; text-align: justify;\"><span style=\"font-size: 12pt;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"color: #212529; font-family: \'blogger sans\'; font-size: 10pt; line-height: 20.25pt;\">Tutto Bene - производитель итальянского мороженого (джелато), уверенно закрепивший позиции производителя натурального высококачественного продукта, полюбившегося ценителям этого изысканного десерта всех возрастов.</span></span></span></p>\r\n<p style=\"color: #000000; font-family: Arial, sans-serif; font-size: 15px; text-align: justify;\"><span style=\"font-size: 12pt;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"color: #212529; font-family: \'blogger sans\'; font-size: 10pt; line-height: 20.25pt;\">Компания активно ведет свою деятельность с 2009 года, открыв собственную сеть мини-джелатерий &nbsp;в крупных ТРЦ г. Алматы. Запущено производство тортов из джелато. Отлажено сотрудничество с кафе и ресторанами города. Пять лет назад стартовал проект доставки фасованного мороженого частным лицам, который активно развивается сейчас.</span></span></span></p>\r\n<p style=\"color: #000000; font-family: Arial, sans-serif; font-size: 15px; text-align: justify;\"><span style=\"font-size: 12pt;\"><span style=\"background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"color: #212529; font-family: \'blogger sans\'; font-size: 10pt; line-height: 20.25pt;\">В ассортименте компании представлено йогуртовое, сливочное джелато и сорбеты.</span></span></span></p>', 3, 1, '2021-07-31 13:29:00', '2021-10-06 14:30:54', NULL, NULL),
(40, 1, '12', NULL, NULL, '<p>лет<br />мы делаем джелато</p>', 1, 1, '2021-07-31 13:30:00', '2021-09-16 15:03:08', NULL, NULL),
(41, 1, '50', NULL, NULL, '<p>сортов<br />на любой вкус</p>', 2, 1, '2021-07-31 13:30:00', '2021-09-16 15:06:25', NULL, NULL),
(42, 1, '3', NULL, NULL, '<p>крупных ТРЦ<br />с нашими джелатериями<br />в Алматы</p>', 3, 1, '2021-07-31 13:31:00', '2021-09-22 12:59:39', NULL, NULL),
(43, 1, '2000', NULL, NULL, '<p>шариков джелато<br />TUTTO BENE съедают каждый<br />день</p>', 4, 1, '2021-07-31 13:31:00', '2021-09-16 15:11:23', NULL, NULL),
(44, 1, '25', NULL, NULL, '<p>квалифицированных<br />специалистов<br />в нашей команде</p>', 5, 1, '2021-07-31 13:32:00', '2021-09-16 15:13:28', NULL, NULL),
(45, 7, 'Хронология событий', NULL, 'image-texts\\August2021\\gC9iX0fa1cTFhovgetM5.svg', '<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2009</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем производство мороженого и первую джелатерию в ТРЦ &laquo;Atrium&raquo;, г. Алматы</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2010</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем мини-джелатерии в ТРЦ &laquo;Прайм Плаза&raquo; (&laquo;Asia Park&raquo;), ТРЦ &laquo;MAXIMA&raquo;, ТРЦ &laquo;Globus&raquo;, ТРЦ &laquo;MEGA Alma-Ata&raquo;, г. Алматы</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2012</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем джелатерию на территории магазина &laquo;Marwin&raquo; (ТРЦ &laquo;MEGA Alma-Ata&raquo;), мини-джелатерии в ТРК &laquo;ADK&raquo;, ТРЦ &laquo;SARUARQA&raquo; (франшиза, г. Астана)</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2014</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем мини-джелатерии в ТРЦ &laquo;MEGA Alma-Ata&raquo; (вторая очередь), ТРЦ &laquo;MEGA Park&raquo; (франшиза) г. Алматы</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2015</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем мини-джелатерию в ТРЦ &laquo;MART&raquo; (франшиза), г. Алматы</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2016</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем мини-джелатерию в ТРЦ &laquo;MOSKVA Metropolitan&raquo; (франшиза), г. Алматы</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2017</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем джелатерию в ТРЦ &laquo;DOSTYK PLAZA&raquo; (франшиза, г. Алматы) и мини-джелатерию в ТРЦ &laquo;MEGA Silk Way&raquo; (франшиза, г. Астана)</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2018</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем джелатерии в ТРЦ &laquo;Atakent Mall&raquo; (франшиза, г. Алматы), ТРЦ &laquo;KeruenCity&raquo; (г. Астана)</p>\r\n</div>\r\n</div>', 1, 1, '2021-08-19 02:39:49', '2021-08-19 02:39:49', NULL, NULL),
(46, 7, 'Эволюция технологий', NULL, 'image-texts\\August2021\\XAj0vdCeNeebyQXFAA7f.svg', '<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2013</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Открываем новый специализированный цех по производству джелато. Приобретаем новое производственное оборудование, автомобиль-рефрижератор для доставки джелато в собственные торговые точки г. Алматы (мини-джелатерии). Увеличиваем объем производства мороженого в два раза.</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2016</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Расширяем ассортимент: вводим фасованное мороженое и торты из мороженого. Приобретаем второй автомобиль-рефрижератор для доставки мороженого и тортов из мороженого покупателям. Фасованное мороженое (400 гр.) продается в собственных торговых точках в ТРЦ &laquo;MEGA Park&raquo; и ТРЦ &laquo;MEGA Alma-Ata&raquo;.</p>\r\n<p>Приобретаем оборудование для выездной уличной торговли. Начинаем активно участвовать в фестивалях и других массовых мероприятиях в г. Алматы.</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2017</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Приобретаем новое производственное оборудование. Объем производства мороженого увеличивается до 120 кг в день. Открываем новую джелатерию в ТРЦ &laquo;DOSTYK PLAZA&raquo;. В новой джелатерии самый большой ассортимент продукции: 18 вкусов джелато, торты из мороженого, десерты из джелато, приготовленные на холодном столе, чайные и кофейные напитки. Устанавливаем вертикальную витрину для тортов из мороженого в джелатерии в ТРЦ &laquo;DOSTYK PLAZA&raquo;.</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2019</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Модернизируем мини-джелатерии в ТРЦ &laquo;MEGA Alma-Ata&raquo;. Устанавливаем новые витрины. Теперь на витрине одновременно находятся 18 вкусов джелато.</p>\r\n</div>\r\n</div>', 2, 1, '2021-08-19 02:40:37', '2021-08-19 02:40:37', NULL, NULL),
(47, 7, 'Фестивальное мороженое', NULL, 'image-texts\\August2021\\QBqVlOqZtNWE1zA1MMcW.svg', '<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2011</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Участвуем в семейном фестивале &laquo;Золотое яблоко&raquo;</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2016</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Участвуем в семейном фестивале &laquo;Mamma Fest&raquo;</p>\r\n<p>Участвуем в городском фестивале &laquo;Apple Fest&raquo;</p>\r\n<p>Участвуем в гастрономических фестивалях &laquo;Let&rsquo;s Eat&raquo; и &laquo;Вкусная Алма-ата&raquo;</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2019</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Участвуем в музыкальном фестивале &laquo;Spirit of Tengry&raquo;</p>\r\n<p>Участвуем в гастрономических фестивалях &laquo;Let&rsquo;s Eat&raquo; и &laquo;Вкусная Алма-ата&raquo;</p>\r\n</div>\r\n</div>', 3, 1, '2021-08-19 02:41:14', '2021-08-19 02:41:14', NULL, NULL),
(48, 7, 'Джелато и Алматы', NULL, 'image-texts\\August2021\\vJxEvS7Y3r9pCNb1hFHv.svg', '<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2010</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Встречаем с джелато: устанавливаем витрину с мороженым &laquo;Tutto Bene&raquo; в аэропорту г. Алматы</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2011</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Аттракционы вкуса: радуем детей в детском парке &laquo;Fanky Town&raquo; в ТРЦ &laquo;Aport Mall&raquo;</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2012</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>На сладкой волне: сотрудничаем с аквапарком &laquo;Hawaii&raquo;</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2013</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Вместо попкорна: сотрудничаем с кинотеатрами &laquo;Star Сinema&raquo; в ТРЦ &laquo;MEGA Alma-Ata&raquo; и &laquo;Aport Mall&raquo; (2015)</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2014</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Ближе к природе: в летние дни выездная тележка с мороженым &laquo;Tutto Bene&raquo; появляется на тенистых аллеях Алматинского Зоопарка.</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2018</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Мороженое со вкусом кино: выпускаем особенные вкусы для кинотеатра &laquo;Cinemax&raquo; в ТРЦ &laquo;DOSTYK PLAZA&raquo;: &laquo;Халк&raquo;, &laquo;Мстители&raquo;, &laquo;Кавказская пленница&raquo;</p>\r\n</div>\r\n</div>\r\n<div class=\"row about_dates align-items-center\">\r\n<div class=\"col-lg-2 text-lg-end text-center\"><strong>2019</strong></div>\r\n<div class=\"col-lg-9 text-lg-start text-center\">\r\n<p>Между играми: витрина с мороженым &laquo;Tutto Bene&raquo; появляется в детском парке развлечений &laquo;Happylon&raquo; в ТРЦ &laquo;MEGA Park&raquo;</p>\r\n</div>\r\n</div>', 4, 1, '2021-08-19 02:41:50', '2021-08-19 02:41:50', NULL, NULL),
(49, 10, 'Торговая франшиза для Алматы', NULL, NULL, '<ul>\r\n<li>Дизайн-проект торговой точки</li>\r\n<li>Консультационная помощь в изготовлении бара</li>\r\n<li>Организация поставки профессионального оборудования (витрина для джелато)</li>\r\n<li>Обучение стандартам работы с продукцией, технологиям продаж, полный пакет обучающих материалов</li>\r\n<li>Комплексная поддержка запуска</li>\r\n<li>Бесперебойное обеспечение продукцией и брендированной упаковкой для реализации в торговой точке</li>\r\n<li>Продвижение в соцсетях и на сайте франчайзера, пакет рекламных материалов</li>\r\n<li>Возможность получения торгового места в лучших ТРЦ города</li>\r\n</ul>', 20, 1, '2021-09-07 09:01:00', '2021-10-15 06:38:46', 'Первоначальные инвестиции', '<p>От 15 000$ киоск для продажи мороженого и молочных коктейлей площадью 6 кв/м на территории ТРЦ</p>\r\n<p>От 30 000$ джелатерия на территории ТРЦ, площадью 45-50 кв/м</p>'),
(50, 10, 'Производственная франшиза для других городов', NULL, NULL, '<ul>\r\n<li>Проект лаборатории для приготовления джелато</li>\r\n<li>Технология и рецептура приготовления джелато</li>\r\n<li>Выезд технолога для обучения производственного персонала франчайзи</li>\r\n<li>Бесперебойное обеспечение специализированными ингредиентами для производства джелато</li>\r\n<li>Пакет документации по управлению рисками на пищевом производстве.</li>\r\n<li>Дизайн-проект торговой точки</li>\r\n<li>Консультационная помощь в изготовлении бара</li>\r\n<li>Организация поставки профессионального оборудования (витрина для джелато)</li>\r\n<li>Обучение стандартам работы с продукцией, технологиям продаж, полный пакет обучающих материалов</li>\r\n<li>Обеспечение брендированной упаковкой</li>\r\n<li>Комплексная поддержка запуска</li>\r\n<li>Продвижение в соцсетях и на сайте франчайзера, пакет рекламных материалов</li>\r\n</ul>', 20, 1, '2021-09-07 09:01:00', '2021-10-14 11:55:04', 'Первоначальные инвестиции', '<p>От 15 000$ киоск для продажи мороженого и молочных коктейлей площадью 6 кв/м на территории ТРЦ</p>\r\n<p>От 30 000$ джелатерия на территории ТРЦ, площадью 45-50 кв/м</p>'),
(51, 8, 'Йогуртовая смесь', 'image-texts/October2021/PJcJjeJ333I4rhrebRyz.jpg', 'image-texts/October2021/jh8sQY0v4mgwUa2ItSLm.png', '<p>Ощущение невероятной легкости, невесомости и в то же время яркости вкуса - вот что отличает йогуртовое джелато. Йогурт прекрасно сочетается с вишней, поэтому самый популярный сорт в этой группе - Амарена.</p>', 3, 1, '2021-10-14 11:37:00', '2021-10-15 07:54:11', 'Йогуртовые сорта джелато', NULL),
(52, 8, 'Изысканный вкус', NULL, 'image-texts/October2021/8LkIZYHvnpW97vM6qc0S.png', NULL, 3, 1, '2021-10-14 11:38:00', '2021-10-15 07:56:15', NULL, NULL),
(53, 8, 'Пониженная калорийность', NULL, 'image-texts/October2021/6RhQYptNVLJYVQ3SONy2.svg', NULL, 3, 1, '2021-10-14 11:40:00', '2021-10-14 13:51:14', NULL, NULL),
(54, 8, 'Содержание жира всего 3-4%', NULL, 'image-texts/October2021/WeJD4oSFbqIzWjfAznca.png', NULL, 3, 1, '2021-10-14 11:42:00', '2021-10-15 08:05:37', NULL, NULL),
(55, 8, 'Натуральное молоко и сливки', 'image-texts/October2021/r91Di9zFY833L6LpR1Ka.jpg', 'image-texts/October2021/tuthhZbSZgv7cqtrVwUL.png', '<p>Готовятся из натурального молока, сливок и сахара. Обладают насыщенным сливочным вкусом, нежной бархатистой текстурой. Для тех, кто ценит вкус классического мороженого &ndash; это лучший выбор.</p>\r\n<p>Необыкновенно нежное, бархатистое, насыщенное. Сливки и молоко дополняют яркие вкусы карамели, ванили, шоколада, кокоса, фисташек. Создано для тех, кто ценит в мороженом классику.</p>', 6, 1, '2021-10-14 13:32:00', '2021-10-15 07:39:54', 'Сливочные сорта джелато', NULL),
(56, 8, 'Натуральные наполнители', NULL, 'image-texts/October2021/s7SX97FBIhzgLSsx8p2p.png', NULL, 6, 1, '2021-10-14 13:36:00', '2021-10-15 07:39:29', NULL, NULL),
(57, 8, 'Классические вкусы', NULL, 'image-texts/October2021/HE7kBamaJQH8xYhCOoaX.png', NULL, 6, 1, '2021-10-14 13:36:00', '2021-10-15 07:45:40', NULL, NULL),
(58, 8, 'Содержание жира 9-11%', NULL, 'image-texts/October2021/A1wqhcVRZpUeIdgvz3b9.png', NULL, 6, 1, '2021-10-14 13:37:00', '2021-10-15 07:53:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `spec` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `members`
--

INSERT INTO `members` (`id`, `spec`, `name`, `image`, `excerpt`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(39, 'Руководство', 'Юлия Рахилькина – Учредитель', 'members/October2021/DK9VsygUdn2M2pmfLDXL.jpg', 'Мне выпало счастье заниматься тем, что я очень люблю – производить невероятно вкусное мороженое и дарить людям хорошее настроение.  \r\n\r\nПо натуре я – созидатель. Год за годом я активно участвую в процессе роста и качественного изменения моей компании. Радостно видеть, что, несмотря на все вызовы, наш бизнес устойчив, а продукция востребована. Благодаря Tutto bene у меня появилось новое увлекательное хобби - фуд-фотография. Фотографировать мороженое это и удовольствие, и экстрим – нужно успеть сделать красивое фото буквально за считанные минуты.', 1, 1, '2021-10-05 13:43:28', '2021-10-05 13:43:28'),
(40, 'Руководство', 'Дилара Скакова – Директор', 'members/October2021/Jnv9LSdkiRlMWIcaV9Lo.jpg', 'Эта работа - идеальное продолжение моей карьеры, где я могу сочетать разные области моих профессиональных навыков. Мне интересно и комфортно работать в Tutto Bene. Я знаю, что это то место, где я могу сделать много полезного. Компания находится в процессе роста, и я хочу быть частью Команды именно в этот момент.', 1, 1, '2021-10-05 13:44:07', '2021-10-05 13:44:07'),
(41, 'Руководство', 'Анна Вязигина – Помощник директора', 'members/October2021/5sEcwPmdy5p4yVYyPNbo.jpg', 'Я активный человек: хожу в бассейн и тренажерный зал, выбираюсь в горы. В свободное время ухаживаю за фиалками.', 1, 1, '2021-10-05 13:44:55', '2021-10-05 13:44:55'),
(42, 'Руководство', 'Анар Искакова – Бухгалтер', 'members/October2021/l8eUSCipFndfJGfUV2xW.jpg', 'Большую часть своей жизни я посвящаю любимой работе. А в свободное время я люблю удивлять свою семью новыми вкусными блюдами. \r\n\r\nЯ с детства очень люблю мороженое, а сейчас у меня есть возможность пробовать разные вкусы Tutto Bene каждый день.', 1, 1, '2021-10-05 13:45:33', '2021-10-05 13:45:33'),
(43, 'Администраторы торговой сети и Кондитеры', 'Аида Дауткулова – Администратор', 'members/October2021/dNdvqLN2bBTwQhfIcc1F.jpg', 'Люблю готовить, находить новые рецепты. Моя любимая музыка – джаз, а мороженое – Страчателла.', 1, 1, '2021-10-05 13:50:41', '2021-10-05 13:50:41'),
(44, 'Администраторы торговой сети и Кондитеры', 'Айгуль Сейфулаева – Администратор', 'members/October2021/FChozVNoFBqlBtEUfkdL.jpg', 'Мне нравится работа! Свободное время провожу с друзьями, или с семьей. Обожаю рок-н-рол. Спортом не занимаюсь.Из фильмов предпочитаю комедии и фантастику. Любимый вкус мороженого – Страчателла.', 1, 1, '2021-10-05 13:53:00', '2021-10-05 13:53:00'),
(45, 'Администраторы торговой сети и Кондитеры', 'Марина Рассказова – Кондитер', 'members/October2021/C1KRWTYucepF4k3MCNrS.jpg', 'Я работаю в TUTTO BENE,  потому что это интересная и увлекательная работа. Свободное время преимущественно провожу с семьёй. Летом занимаюсь плаванием. Зимой катаюсь на коньках.   \r\nОбожаю все виды сливочного мороженого.', 1, 1, '2021-10-05 13:53:42', '2021-10-05 13:53:42'),
(46, 'Администраторы торговой сети и Кондитеры', 'Аида Абдиманапова – Кондитер', 'members/October2021/wcyFohxnSQ2PQTIA2Mg5.jpg', 'Мне нравится готовить, часто пеку вкусные пироги. Я очень люблю детей, они – настоящее чудо в моей жизни.', 1, 1, '2021-10-05 13:54:23', '2021-10-05 13:54:23'),
(47, 'Бармены', 'Айдынкызы Акерке - Бармен', 'members/October2021/MibX9Hr5sIJbXwuqKR2z.jpg', 'Мне нравится мое красивое рабочее место — Джелатерия в Dostyk plaza. У меня есть серьезное увлечение — психология. Спортом я не занимаюсь, иногда хожу на фитнес. Я меломан. Люблю разную музыку, но больше всего мне по душе — лирика.', 1, 1, '2021-10-05 13:56:15', '2021-10-05 13:56:15'),
(48, 'Бармены', 'Серікқызы Асель - Бармен', 'members/October2021/VI8Acx2cBQ6NfZjhht1i.jpg', 'Работаю, потому что мне нравится видеть счастливые лица детей.В свободное время смотрю корейские дорамы и гуляю с друзьями. Спортом не занимаюсь.Обожаю фэнтези, фантастические боевики, фанатка Marvel. Любимый сорт мороженого – Фисташки.', 1, 1, '2021-10-05 13:57:00', '2021-10-05 13:57:40'),
(49, 'Бармены', 'Турниязова Асем - Бармен', 'members/October2021/EoLWFbEwndUvPb66UPig.jpg', 'Мне нравится продавать мороженое. От этого я получаю удовольствие. В свободное время люблю побыть дома. Иногда выезжаю в горы. Любимый сорт мороженого – Манго-маракуйя и Соленая карамель.', 1, 1, '2021-10-05 13:58:39', '2021-10-05 13:58:39'),
(50, 'Бармены', 'Ғазизжан Жұматай – Бармен', 'members/October2021/2WAyoeg0Jz0LUHCjh5pu.jpg', 'Я считаю, что мороженое TUTTO BENE – отличный продукт. Мне приятно и комфортно работать в компании и в команде.  \r\n\r\nЯ увлекаюсь футболом, настольным теннисом, люблю смотреть кино, причем в любом жанре, лишь бы меня фильм заинтересовал.  Самый любимый вкус мороженого для меня – это Чизкейк и Фисташки.', 1, 1, '2021-10-05 14:00:56', '2021-10-05 14:00:56'),
(51, 'Бармены', 'Мансурова Гульбахрам – Бармен', 'members/October2021/ijbhF7ALHSocjgUn3F09.jpg', 'Мне нравится работать в дружной команде TUTTO BENE. Свободное время я посвящаю родным. Обожаю классическую музыку со смыслом. Определенным видом спорта не увлекаюсь, но люблю прогулки на свежем воздухе. Очень люблю комедии. Самое любимое – йогуртовое мороженое.', 1, 1, '2021-10-06 06:32:48', '2021-10-06 06:32:48'),
(52, 'Бармены', 'Хожабергенова Ирина – Бармен', 'members/October2021/1afii6bV4HMljf2vqAt8.jpg', 'В Tutto bene у барменов-кассиров хорошая зарплата, для меня это важно. В свободное время я читаю книги, уделяю много времени детям. Мы вместе читаем, рисуем, играем в прятки. Я очень люблю казахские песни. Спортом не занимаюсь. Мое любимое мороженое – Фисташка.', 1, 1, '2021-10-06 06:34:08', '2021-10-06 06:34:08'),
(53, 'Бармены', 'Никулин Никита – Бармен', 'members/October2021/8f02JUGCyYHCFFdg1lhd.jpg', 'Работаю ради денег. Люблю походы в горы, занимаюсь фитнесом. Предпочитаю в музыке рок и хип-хоп. Мой любимый спорт – армрестлинг.  Из фильмов предпочитаю ужасы и драмы. Любимый сорт мороженого – Соленая карамель.', 1, 1, '2021-10-06 06:35:30', '2021-10-06 06:35:30'),
(54, 'Экспедиторы', 'Павел Шавлов – Экспедитор', 'members/October2021/xiFH5WUQgJFjoVLtE1ZR.jpg', 'Я люблю плавать, возиться с машинами. Часто хожу с женой на новые комедии, гуляю с семьей. Мое любимое джелато – Сливочная клубника.', 1, 1, '2021-10-06 06:39:02', '2021-10-06 06:39:02'),
(55, 'Экспедиторы', 'Евгений Синицкий – Экспедитор', 'members/October2021/XLguz1yj2IYZoaYXtfJt.jpg', 'Катаюсь на сноуборде, люблю играть в шахматы. Мой любимый фильм – «Джентльмены удачи».', 1, 1, '2021-10-06 06:42:55', '2021-10-06 06:42:55');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(2, 'menu', '2021-07-31 05:44:48', '2021-07-31 05:44:48'),
(3, 'secondary', '2021-07-31 06:35:09', '2021-07-31 06:35:09'),
(4, 'mobile_menu', '2021-07-31 10:05:33', '2021-07-31 10:05:33');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Панель управления', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2021-07-29 15:02:27', '2021-07-30 03:40:24', 'voyager.dashboard', 'null'),
(2, 1, 'Медиа', '', '_self', 'voyager-images', '#000000', 5, 4, '2021-07-29 15:02:27', '2021-07-30 03:41:49', 'voyager.media.index', 'null'),
(3, 1, 'Пользователи', '', '_self', 'voyager-person', '#000000', 5, 2, '2021-07-29 15:02:27', '2021-07-30 03:41:43', 'voyager.users.index', 'null'),
(4, 1, 'Роли', '', '_self', 'voyager-lock', '#000000', 5, 3, '2021-07-29 15:02:27', '2021-07-30 03:41:43', 'voyager.roles.index', 'null'),
(5, 1, 'Инструменты', '', '_self', 'voyager-tools', '#000000', NULL, 11, '2021-07-29 15:02:27', '2021-08-06 02:24:04', NULL, ''),
(6, 1, 'Конструктор меню', '', '_self', 'voyager-list', '#000000', 5, 1, '2021-07-29 15:02:27', '2021-07-30 03:41:33', 'voyager.menus.index', 'null'),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 5, '2021-07-29 15:02:27', '2021-07-30 03:41:49', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 6, '2021-07-29 15:02:27', '2021-07-30 03:41:49', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 7, '2021-07-29 15:02:27', '2021-07-30 03:41:49', 'voyager.bread.index', NULL),
(10, 1, 'Настройки', '', '_self', 'voyager-settings', '#000000', NULL, 12, '2021-07-29 15:02:27', '2021-08-06 02:24:04', 'voyager.settings.index', 'null'),
(12, 1, 'Статьи', '', '_self', 'voyager-news', '#000000', NULL, 6, '2021-07-29 15:02:28', '2021-08-06 02:24:04', 'voyager.posts.index', 'null'),
(13, 1, 'Страницы', '', '_self', 'voyager-file-text', '#000000', NULL, 5, '2021-07-29 15:02:28', '2021-08-06 02:24:04', 'voyager.pages.index', 'null'),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 8, '2021-07-29 15:02:28', '2021-07-30 03:41:49', 'voyager.hooks', NULL),
(15, 1, 'Точки', '', '_self', 'voyager-buy', NULL, 20, 1, '2021-07-30 03:40:10', '2021-07-30 05:03:55', 'voyager.branches.index', NULL),
(16, 1, 'Контакты', '', '_self', 'voyager-location', NULL, 20, 2, '2021-07-30 03:45:08', '2021-07-30 05:04:01', 'voyager.contacts.index', NULL),
(17, 1, 'Партнеры', '', '_self', 'voyager-world', NULL, 20, 3, '2021-07-30 03:46:54', '2021-07-30 05:04:04', 'voyager.partners.index', NULL),
(18, 1, 'Сертификаты', '', '_self', 'voyager-certificate', NULL, 20, 5, '2021-07-30 03:50:33', '2021-07-30 05:04:13', 'voyager.certificates.index', NULL),
(19, 1, 'Команды', '', '_self', 'voyager-people', NULL, 20, 4, '2021-07-30 03:56:12', '2021-07-30 05:04:13', 'voyager.members.index', NULL),
(20, 1, 'О компании', '', '_self', 'voyager-company', '#000000', NULL, 10, '2021-07-30 05:03:44', '2021-08-06 02:24:04', NULL, ''),
(21, 2, 'Сотрудничество', '#', '_self', NULL, '#000000', NULL, 1, '2021-07-31 05:45:17', '2021-10-11 08:39:44', NULL, ''),
(22, 2, 'О джелато', '/o-dzhelato', '_self', NULL, '#000000', NULL, 2, '2021-07-31 05:45:38', '2021-07-31 05:47:55', NULL, ''),
(23, 2, 'О нас', '#', '_self', NULL, '#000000', NULL, 3, '2021-07-31 05:45:49', '2021-10-11 08:39:33', NULL, ''),
(24, 2, 'Франшиза', '/franshiza', '_self', NULL, '#000000', 21, 1, '2021-07-31 05:47:53', '2021-07-31 06:04:33', NULL, ''),
(25, 2, 'Для HoReCa', '/horeca', '_self', NULL, '#000000', 21, 2, '2021-07-31 05:48:12', '2021-07-31 05:48:15', NULL, ''),
(26, 2, 'Сырье для производства', '/syre', '_self', NULL, '#000000', 21, 3, '2021-07-31 05:48:30', '2021-07-31 05:48:34', NULL, ''),
(27, 2, 'Наша команда', '/nasha-komanda', '_self', NULL, '#000000', 23, 1, '2021-07-31 05:48:57', '2021-07-31 05:48:59', NULL, ''),
(28, 2, 'Наши партнеры', '/partnery', '_self', NULL, '#000000', 23, 2, '2021-07-31 05:49:11', '2021-07-31 05:49:14', NULL, ''),
(29, 2, 'Сертификаты', '/sertifikaty', '_self', NULL, '#000000', 23, 3, '2021-07-31 05:49:29', '2021-07-31 05:49:31', NULL, ''),
(30, 2, 'Контакты', '/kontakty', '_self', NULL, '#000000', 23, 4, '2021-07-31 05:49:42', '2021-07-31 05:49:46', NULL, ''),
(31, 3, 'Заказать', '#', '_self', NULL, '#000000', NULL, 1, '2021-07-31 06:35:24', '2021-07-31 06:37:35', NULL, ''),
(32, 3, 'Где нас найти', '/kontakty', '_self', NULL, '#000000', NULL, 2, '2021-07-31 06:35:48', '2021-07-31 06:36:24', NULL, ''),
(33, 3, 'Мороженое в баночках', '/morozhenoe', '_self', NULL, '#000000', 31, 1, '2021-07-31 06:36:20', '2021-08-01 07:49:30', NULL, ''),
(34, 3, 'Торты из мороженого', '/torty', '_self', NULL, '#000000', 31, 2, '2021-07-31 06:36:36', '2021-08-01 07:49:40', NULL, ''),
(35, 3, 'Создай свой торт', '/konstruktor', '_self', NULL, '#000000', 31, 3, '2021-07-31 06:36:46', '2021-07-31 14:51:29', NULL, ''),
(36, 3, 'Выездное обслуживание', '/vyezdnoe-obsluzhivanie', '_self', NULL, '#000000', 31, 4, '2021-07-31 06:36:57', '2021-07-31 13:02:12', NULL, ''),
(37, 4, 'Сотрудничество', '/sotrudnichestvo', '_self', NULL, '#000000', NULL, 1, '2021-07-31 10:05:47', '2021-07-31 10:06:03', NULL, ''),
(38, 4, 'Франшиза', '/franshiza', '_self', NULL, '#000000', 37, 1, '2021-07-31 10:06:01', '2021-07-31 10:06:03', NULL, ''),
(39, 4, 'Для HoReCa', '/horeca', '_self', NULL, '#000000', 37, 2, '2021-07-31 10:06:14', '2021-07-31 10:06:16', NULL, ''),
(40, 4, 'Сырье для производства', '/syre', '_self', NULL, '#000000', 37, 3, '2021-07-31 10:06:27', '2021-07-31 10:06:30', NULL, ''),
(41, 4, 'О джелато', '/o-dzhelato', '_self', NULL, '#000000', NULL, 2, '2021-07-31 10:06:41', '2021-07-31 10:07:06', NULL, ''),
(42, 4, 'О нас', '/o-nas', '_self', NULL, '#000000', NULL, 3, '2021-07-31 10:06:53', '2021-07-31 10:07:06', NULL, ''),
(43, 4, 'Наша команда', '/nasha-komanda', '_self', NULL, '#000000', 42, 1, '2021-07-31 10:07:04', '2021-07-31 10:07:06', NULL, ''),
(44, 4, 'Наши партнеры', '/partnery', '_self', NULL, '#000000', 42, 2, '2021-07-31 10:07:18', '2021-07-31 10:07:24', NULL, ''),
(45, 4, 'Сертификаты', '/sertifikaty', '_self', NULL, '#000000', 42, 3, '2021-07-31 10:07:38', '2021-07-31 10:07:41', NULL, ''),
(46, 4, 'Контакты', '/kontakty', '_self', NULL, '#000000', 42, 4, '2021-07-31 10:07:53', '2021-07-31 10:08:32', NULL, ''),
(47, 4, 'Заказать', '#', '_self', NULL, '#000000', NULL, 4, '2021-07-31 10:08:39', '2021-07-31 10:09:10', NULL, ''),
(48, 4, 'Выездное обслуживание', '/vyezdnoe-obsluzhivanie', '_self', NULL, '#000000', 47, 4, '2021-07-31 10:09:07', '2021-08-01 07:50:47', NULL, ''),
(49, 4, 'Где нас найти', '/kontakty', '_self', NULL, '#000000', NULL, 5, '2021-07-31 10:09:22', '2021-07-31 14:51:19', NULL, ''),
(50, 1, 'ИнфоБлоки', '', '_self', 'voyager-window-list', NULL, NULL, 9, '2021-07-31 10:28:17', '2021-08-06 02:24:04', 'voyager.image-texts.index', NULL),
(51, 1, 'Слайдеры на главной', '', '_self', 'voyager-images', NULL, NULL, 7, '2021-07-31 14:26:12', '2021-08-06 02:24:04', 'voyager.sliders.index', NULL),
(52, 4, 'Создай свой торт', '/konstruktor', '_self', NULL, '#000000', 47, 3, '2021-07-31 14:51:15', '2021-08-01 07:50:47', NULL, ''),
(53, 1, 'Обслуживания', '', '_self', 'voyager-paint-bucket', NULL, NULL, 8, '2021-07-31 15:08:23', '2021-08-06 02:24:04', 'voyager.services.index', NULL),
(54, 1, 'Мороженные', '', '_self', 'voyager-diamond', '#000000', 56, 3, '2021-08-01 03:27:19', '2021-08-05 08:37:51', 'voyager.icecreams.index', 'null'),
(55, 1, 'Категории Мороженных', '', '_self', 'voyager-shop', NULL, 56, 2, '2021-08-01 03:29:31', '2021-08-05 08:37:51', 'voyager.ice-types.index', NULL),
(56, 1, 'Продукты', '', '_self', 'voyager-basket', '#000000', NULL, 3, '2021-08-01 03:30:09', '2021-08-05 08:25:22', NULL, ''),
(57, 1, 'Порции мороженных', '', '_self', 'voyager-bag', NULL, 56, 4, '2021-08-01 06:02:44', '2021-08-05 08:37:51', 'voyager.ice-portions.index', NULL),
(58, 4, 'Мороженое в баночках', '/morozhenoe', '_self', NULL, '#000000', 47, 1, '2021-08-01 07:50:13', '2021-08-01 07:50:18', NULL, ''),
(59, 4, 'Торты из мороженого', '/torty', '_self', NULL, '#000000', 47, 2, '2021-08-01 07:50:43', '2021-08-01 07:50:47', NULL, ''),
(60, 1, 'Заказы', '', '_self', 'voyager-bag', NULL, NULL, 2, '2021-08-05 07:53:06', '2021-08-05 08:25:22', 'voyager.orders.index', NULL),
(61, 1, 'Торты', '', '_self', 'voyager-pie-chart', NULL, 56, 1, '2021-08-05 08:37:40', '2021-08-05 08:37:51', 'voyager.cakes.index', NULL),
(62, 1, 'Районы доставки', '', '_self', 'voyager-truck', NULL, NULL, 4, '2021-08-06 02:23:50', '2021-08-06 02:24:04', 'voyager.districts.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2016_01_01_000000_create_pages_table', 2),
(29, '2016_01_01_000000_create_posts_table', 2),
(30, '2016_02_15_204651_create_categories_table', 2),
(31, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(32, '2020_01_31_180028_create_partners_table', 3),
(33, '2020_06_02_071229_create_contacts_table', 3),
(34, '2021_07_30_063444_create_branches_table', 4),
(35, '2021_07_30_064806_create_certificates_table', 5),
(36, '2021_07_30_065234_create_members_table', 6),
(37, '2021_07_30_080629_add_type_to_pages_table', 7),
(39, '2021_07_30_082124_add_additional_columns_to_branches_table', 8),
(40, '2021_07_31_132411_create_image_texts_table', 9),
(41, '2021_07_31_172053_create_sliders_table', 10),
(42, '2021_07_31_175509_create_services_table', 11),
(43, '2021_08_01_061337_create_icecreams_table', 12),
(51, '2021_08_01_061917_create_ice_types_table', 13),
(52, '2021_08_01_084344_create_ice_portions_table', 13),
(53, '2021_08_01_102603_add_slug_to_ice_types_table', 13),
(54, '2021_08_01_102942_add_meta_data_to_ice_types', 14),
(55, '2021_08_01_153100_add_featured_to_icecreams', 15),
(56, '2021_08_01_155457_add_default_column_to_ice_portions_table', 16),
(57, '2021_08_04_094306_create_orders_table', 17),
(58, '2021_08_04_100337_create_order_products_table', 18),
(59, '2021_08_04_112810_create_order_entities_table', 19),
(61, '2021_08_05_112950_create_cakes_table', 20),
(62, '2021_08_05_130333_add_min_weight_to_cakes', 21),
(63, '2021_08_06_051940_create_districts_table', 22),
(64, '2021_08_06_054815_add_delivery_price_to_orders_table', 23),
(65, '2021_08_06_064159_drop_step_column_in_cakes_table', 24),
(66, '2021_08_14_160612_create_cake_products_table', 25),
(67, '2021_08_16_045131_add_amount_to_districts_table', 26);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery` enum('self','delivery') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment` enum('cash','card','charge') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8mb4_unicode_ci,
  `branch_id` mediumtext COLLATE utf8mb4_unicode_ci,
  `delivery_price` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `name`, `phone`, `delivery`, `payment`, `date`, `address`, `branch_id`, `delivery_price`, `amount`, `status`, `confirmed`, `created_at`, `updated_at`) VALUES
(1, 'Kerim', '+7 (111) 111-11-11', 'self', 'cash', NULL, NULL, '4', NULL, 4200, 1, 1, '2021-08-05 05:49:04', '2021-08-05 05:49:04'),
(2, 'TEST', '+7 (123) 123-23-23', 'self', 'cash', NULL, NULL, '4', NULL, 4200, 1, 1, '2021-08-05 05:49:52', '2021-08-05 05:49:52'),
(3, 'TEST', '+7 (123) 123-23-23', 'self', 'cash', NULL, NULL, '5', NULL, 4200, 1, 1, '2021-08-05 05:50:53', '2021-08-05 05:50:53'),
(4, 'Kerim', '+7 (123) 123-23-23', 'delivery', 'cash', '2021-08-13 15:00 — 16:00', 'Шалкар 12', NULL, NULL, 2200, 1, 1, '2021-08-05 06:24:21', '2021-08-05 06:24:21'),
(5, 'TEST', '+7(123)123-23-23', 'self', 'cash', NULL, NULL, '4', NULL, 2000, 1, 1, '2021-08-05 06:27:19', '2021-08-05 06:27:19'),
(6, 'Менеджер по продажам', '+7 (111) 111-11-11', 'delivery', 'cash', '2021-08-20 14:00 — 15:00', 'TEst address 2', NULL, NULL, 2000, 1, 1, '2021-08-05 06:31:03', '2021-08-05 06:31:03'),
(7, 'TEST', '+7(123)123-23-23', 'delivery', 'cash', '2021-08-13 13:00 — 14:00', 'TEst address 2', NULL, NULL, 2200, 1, 1, '2021-08-05 06:33:54', '2021-08-05 06:33:54'),
(8, 'TEST', '+7 (111) 111-11-11', 'delivery', 'card', '2021-08-10 14:00 — 15:00', 'TEst address 2', NULL, NULL, 4400, 1, 0, '2021-08-05 06:34:27', '2021-08-05 06:34:27'),
(9, 'TEST', '+7 (123) 123-23-23', 'delivery', 'card', '2021-08-09 15:00 — 16:00', 'TEst address 2', NULL, NULL, 4400, 1, 0, '2021-08-05 06:35:29', '2021-08-05 06:35:29'),
(10, 'TEST', '+7 (123) 123-23-23', 'delivery', 'card', '2021-08-09 15:00 — 16:00', 'TEst address 2', NULL, NULL, 4400, 1, 0, '2021-08-05 06:37:09', '2021-08-05 06:37:09'),
(11, 'TEST', '+7 (707) 500-22-78', 'self', 'cash', NULL, NULL, '6', NULL, 4400, 1, 1, '2021-08-05 07:15:55', '2021-08-05 07:15:55'),
(12, 'Менеджер по продажам', '+7 (777) 777-77-77', 'self', 'charge', NULL, NULL, '7', NULL, 16300, 1, 1, '2021-08-05 07:19:50', '2021-08-05 07:19:50'),
(13, 'Менеджер по продажам', '+7 (777) 777-77-77', 'self', 'charge', NULL, NULL, '7', NULL, 16300, 1, 1, '2021-08-05 07:20:24', '2021-08-05 07:20:24'),
(14, 'Sulpak', '+7 (707) 500-22-78', 'self', 'cash', NULL, NULL, '5', NULL, 9600, 1, 1, '2021-08-05 07:21:53', '2021-08-05 07:21:53'),
(15, 'TEST', '+7(123)123-23-23', 'self', 'cash', NULL, NULL, '6', NULL, 3200, 3, 1, '2021-08-05 07:22:50', '2021-08-05 08:20:50'),
(16, 'Kerim', '+7 (707) 500-22-78', 'delivery', 'cash', '2021-08-11 13:00 — 14:00', 'Ауэзовский район TEst address 2', NULL, NULL, 29950, 1, 1, '2021-08-06 02:41:47', '2021-08-06 02:41:47'),
(17, 'Kerim', '+7 (707) 500-22-78', 'delivery', 'cash', '2021-08-11 13:00 — 14:00', 'Ауэзовский район TEst address 2', NULL, NULL, 29950, 1, 1, '2021-08-06 02:46:15', '2021-08-06 02:46:15'),
(18, 'Kerim', '+7 (111) 111-11-11', 'delivery', 'cash', '2021-08-12 14:00 — 15:00', 'Наурызбайский район TEst address 2', NULL, 1500, 342900, 1, 1, '2021-08-06 02:50:54', '2021-08-06 02:50:54'),
(19, 'Kerim', '+7 (111) 111-11-11', 'self', 'charge', NULL, NULL, '5', 0, 49400, 1, 1, '2021-08-14 13:38:41', '2021-08-14 13:38:41'),
(20, 'TEST', '+7 (123) 123-23-23', 'delivery', 'card', '2021-08-28 15:00 — 16:00', 'Жетысуский район Шалкар 12', NULL, 1000, 15000, 1, 0, '2021-08-14 13:59:27', '2021-08-14 13:59:27'),
(21, 'TEST', '+7 (123) 123-23-23', 'delivery', 'card', '2021-08-28 15:00 — 16:00', 'Жетысуский район Шалкар 12', NULL, 1000, 15000, 1, 0, '2021-08-14 13:59:30', '2021-08-14 13:59:30'),
(22, 'TEST', '+7 (123) 123-23-23', 'delivery', 'card', '2021-08-28 15:00 — 16:00', 'Жетысуский район Шалкар 12', NULL, 1000, 15000, 1, 0, '2021-08-14 13:59:42', '2021-08-14 13:59:42'),
(23, 'TEST', '+7 (123) 123-23-23', 'delivery', 'card', '2021-08-28 15:00 — 16:00', 'Жетысуский район Шалкар 12', NULL, 1000, 15000, 1, 0, '2021-08-14 13:59:43', '2021-08-14 13:59:43'),
(24, 'TEST', '+7 (123) 123-23-23', 'delivery', 'card', '2021-08-28 15:00 — 16:00', 'Жетысуский район Шалкар 12', NULL, 1000, 15000, 1, 0, '2021-08-14 13:59:44', '2021-08-14 13:59:44'),
(25, 'TEST', '+7 (123) 123-23-23', 'delivery', 'charge', '2021-08-28 15:00 — 16:00', 'Жетысуский район Шалкар 12', NULL, 1000, 15000, 1, 1, '2021-08-14 13:59:54', '2021-08-14 13:59:54'),
(26, 'Sulpak', '+7(123)123-23-23', 'delivery', 'card', '2021-08-28 14:00 — 15:00', 'Жетысуский район Шалкар 12', NULL, 1000, 15000, 1, 0, '2021-08-14 14:01:10', '2021-08-14 14:01:10'),
(27, 'Sulpak', '+7(123)123-23-23', 'delivery', 'charge', '2021-08-28 14:00 — 15:00', 'Жетысуский район Шалкар 12', NULL, 1000, 15000, 1, 1, '2021-08-14 14:01:18', '2021-08-14 14:01:18'),
(28, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 16000, 1, 1, '2021-08-14 14:03:42', '2021-08-14 14:03:42'),
(29, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 16000, 1, 1, '2021-08-14 14:03:49', '2021-08-14 14:03:49'),
(30, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 16000, 1, 1, '2021-08-14 14:03:50', '2021-08-14 14:03:50'),
(31, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 16000, 1, 1, '2021-08-14 14:03:52', '2021-08-14 14:03:52'),
(32, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 14500, 1, 1, '2021-08-14 14:05:58', '2021-08-14 14:05:58'),
(33, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 14500, 1, 1, '2021-08-14 14:07:55', '2021-08-14 14:07:55'),
(34, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 14500, 1, 1, '2021-08-14 14:08:12', '2021-08-14 14:08:12'),
(35, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 14500, 2, 1, '2021-08-14 14:08:22', '2021-08-16 02:14:30'),
(36, 'Менеджер по продажам', '+7 (123) 123 - 23 - 23', 'delivery', 'charge', '2021-08-20 16:00 — 17:00', 'Ауэзовский район TEST ADDRESS 213', NULL, 1500, 14500, 1, 1, '2021-08-14 14:10:19', '2021-08-14 14:10:19'),
(37, 'TEST', '+7 (123) 123-23-23', 'delivery', 'charge', '2021-08-27 14:00 — 15:00', 'Алатауский район Шалкар 12', NULL, 0, 37100, 1, 1, '2021-08-16 02:07:27', '2021-08-16 02:07:27'),
(38, 'TEST', '+7 (123) 123-23-23', 'delivery', 'cash', '2021-08-19 13:00 — 14:00', 'Внутри квадрата Аль Фараби-Момышулы-Рыскулова-ВОАД Шалкар 12', NULL, 1000, 8400, 1, 1, '2021-08-19 04:12:28', '2021-08-19 04:12:28'),
(39, 'Kerim', '+7 (123) 123-23-23', 'delivery', 'cash', '2021-08-27 13:00 — 14:00', 'Внутри квадрата Аль Фараби-Момышулы-Рыскулова-ВОАД Шалкар 12', NULL, 1000, 4200, 1, 1, '2021-08-19 04:14:08', '2021-08-19 04:14:08'),
(40, 'Kerim', '+7 (123) 123-23-23', 'self', 'charge', NULL, NULL, '2', 0, 18200, 1, 1, '2021-08-19 04:17:08', '2021-08-19 04:17:08'),
(41, 'Kerim', '+7 (123) 123-23-23', 'self', 'charge', NULL, NULL, '2', 0, 6500, 1, 1, '2021-08-19 04:18:08', '2021-08-19 04:18:08'),
(42, 'wetwet', '+7 (111) 111-11-11', 'self', 'charge', NULL, NULL, '2', 0, 33800, 1, 1, '2021-08-19 04:49:37', '2021-08-19 04:49:37'),
(43, 'TEST', '+7 (111) 111-11-11', 'self', 'card', NULL, NULL, '2', 0, 2000, 1, 0, '2021-08-22 13:01:45', '2021-08-22 13:01:45'),
(44, 'TEST', '+7 (123) 123-23-23', 'self', 'card', NULL, NULL, '4', 0, 2000, 1, 0, '2021-08-22 13:11:58', '2021-08-22 13:11:58'),
(45, 'Рахилькина Юлия', '+77017653902', 'delivery', 'card', '2021-08-31 15:00 — 16:00', 'Внутри границы города (Развилка на Бутаковское ущелье - Алмарасанская плотина - Алтын-Орда - Аэропорт Тау Булагы, 1', NULL, 2000, 14150, 1, 0, '2021-08-30 17:22:44', '2021-08-30 17:22:44'),
(46, 'TEST', '+7 (123) 123-23-23', 'self', 'cash', NULL, NULL, '4', 0, 6400, 1, 1, '2021-09-19 21:20:10', '2021-09-19 21:20:10'),
(47, 'TEST', '+7 (123) 123-23-23', 'self', 'cash', NULL, NULL, '4', 0, 6400, 1, 1, '2021-09-19 21:20:28', '2021-09-19 21:20:28'),
(48, 'TEST', '+7 (123) 123-23-23', 'self', 'cash', NULL, NULL, '4', 0, 6400, 1, 1, '2021-09-19 21:22:58', '2021-09-19 21:22:58'),
(49, 'a.isaeva@bem.kz', '8-747-846-7237', 'self', 'card', NULL, NULL, '2', 0, 104000, 1, 0, '2021-09-20 09:32:18', '2021-09-20 09:32:18'),
(50, 'Аркадий', '+7 701 711 44 27', 'self', 'card', NULL, NULL, '2', 0, 2000, 1, 0, '2021-09-26 15:35:43', '2021-09-26 15:35:43'),
(51, 'Firuza', '+7 (701) 675-12-29', 'self', 'card', NULL, NULL, '2', 0, 2000, 1, 0, '2021-10-07 14:26:08', '2021-10-07 14:26:08'),
(52, 'Firuza', '+7 (701) 675-12-29', 'self', 'cash', NULL, NULL, '2', 0, 2000, 1, 1, '2021-10-07 14:26:36', '2021-10-07 14:26:36');

-- --------------------------------------------------------

--
-- Структура таблицы `order_entities`
--

CREATE TABLE `order_entities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bik` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iik` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_entities`
--

INSERT INTO `order_entities` (`id`, `order_id`, `name`, `person`, `bin`, `bik`, `iik`, `address`, `created_at`, `updated_at`) VALUES
(1, 13, 'TEst', 'TEst345345', '324234', '23423562356', '2343435632', 'ADressq test', '2021-08-05 07:20:24', '2021-08-05 07:20:24'),
(2, 19, 'TEST', '23y23y23y', '32r2t', '23ty', '32t23t', '23y23y32y23y', '2021-08-14 13:38:41', '2021-08-14 13:38:41'),
(3, 25, 'TEST', '2424', '2424', '2424', '2424', '2424', '2021-08-14 13:59:54', '2021-08-14 13:59:54'),
(4, 27, 'erge', 'erherh', 'rehre', 'hrehe', 'heh', 'erh', '2021-08-14 14:01:18', '2021-08-14 14:01:18'),
(5, 28, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:03:42', '2021-08-14 14:03:42'),
(6, 29, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:03:49', '2021-08-14 14:03:49'),
(7, 30, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:03:50', '2021-08-14 14:03:50'),
(8, 31, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:03:52', '2021-08-14 14:03:52'),
(9, 32, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:05:58', '2021-08-14 14:05:58'),
(10, 33, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:07:55', '2021-08-14 14:07:55'),
(11, 34, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:08:12', '2021-08-14 14:08:12'),
(12, 35, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:08:22', '2021-08-14 14:08:22'),
(13, 36, 'egwg', 'gwgweg', 'wegwe', 'gwegwe', 'gwegwe', 'wegeg', '2021-08-14 14:10:19', '2021-08-14 14:10:19'),
(14, 37, 'afsdf', 'sdgsdg', 'dsgsdg', 'sdgsd', 'sdgsdg', 'sdg', '2021-08-16 02:07:27', '2021-08-16 02:07:27'),
(15, 40, 'qewg', 'wegweg', 'wegweg', 'wegweg', 'wegweg', 'weg', '2021-08-19 04:17:08', '2021-08-19 04:17:08'),
(16, 41, 'ewg', 'weg', 'weg', 'weg', 'weg', 'weg', '2021-08-19 04:18:08', '2021-08-19 04:18:08'),
(17, 42, 'wet', 'wet', 'wet', 'wet', 'wet', 'wet', '2021-08-19 04:49:37', '2021-08-19 04:49:37');

-- --------------------------------------------------------

--
-- Структура таблицы `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_data` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` enum('icecream','cake','waffle') COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_products`
--

INSERT INTO `order_products` (`id`, `order_id`, `product_id`, `product_data`, `product_type`, `count`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-05 05:49:04', '2021-08-05 05:49:04'),
(2, 1, 2, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2200, '2021-08-05 05:49:04', '2021-08-05 05:49:04'),
(3, 2, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-05 05:49:52', '2021-08-05 05:49:52'),
(4, 2, 2, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2200, '2021-08-05 05:49:52', '2021-08-05 05:49:52'),
(5, 3, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-05 05:50:53', '2021-08-05 05:50:53'),
(6, 3, 2, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2200, '2021-08-05 05:50:53', '2021-08-05 05:50:53'),
(7, 4, 2, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2200, '2021-08-05 06:24:21', '2021-08-05 06:24:21'),
(8, 5, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-05 06:27:19', '2021-08-05 06:27:19'),
(9, 6, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-05 06:31:03', '2021-08-05 06:31:03'),
(10, 7, 2, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2200, '2021-08-05 06:33:54', '2021-08-05 06:33:54'),
(11, 8, 2, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2200, '2021-08-05 06:34:27', '2021-08-05 06:34:27'),
(12, 9, 2, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2200, '2021-08-05 06:35:29', '2021-08-05 06:35:29'),
(13, 10, 2, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2200, '2021-08-05 06:37:09', '2021-08-05 06:37:09'),
(14, 11, 2, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2200, '2021-08-05 07:15:55', '2021-08-05 07:15:55'),
(15, 12, 1, 'Баночка 1500 гр - 21 порция', 'icecream', 2, 4950, '2021-08-05 07:19:50', '2021-08-05 07:19:50'),
(16, 12, 1, 'Вафельные рожки - ', 'icecream', 2, 3200, '2021-08-05 07:19:50', '2021-08-05 07:19:50'),
(17, 13, 1, 'Баночка 1500 гр - 21 порция', 'icecream', 2, 4950, '2021-08-05 07:20:24', '2021-08-05 07:20:24'),
(18, 13, 1, 'Вафельные рожки - ', 'icecream', 2, 3200, '2021-08-05 07:20:24', '2021-08-05 07:20:24'),
(19, 14, 1, NULL, 'icecream', 3, 3200, '2021-08-05 07:21:53', '2021-08-05 07:21:53'),
(20, 15, 1, 'Вафельные рожки', 'icecream', 1, 3200, '2021-08-05 07:22:50', '2021-08-05 07:22:50'),
(21, 16, 2, 'Баночка 1500 гр - 21 порция', 'icecream', 1, 5200, '2021-08-06 02:41:47', '2021-08-06 02:41:47'),
(22, 16, 2, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2200, '2021-08-06 02:41:47', '2021-08-06 02:41:47'),
(23, 16, 2, 'Вафельные рожки', 'icecream', 1, 3350, '2021-08-06 02:41:47', '2021-08-06 02:41:47'),
(24, 17, 2, 'Баночка 1500 гр - 21 порция', 'icecream', 1, 5200, '2021-08-06 02:46:15', '2021-08-06 02:46:15'),
(25, 17, 2, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2200, '2021-08-06 02:46:15', '2021-08-06 02:46:15'),
(26, 17, 2, 'Вафельные рожки', 'icecream', 1, 3350, '2021-08-06 02:46:15', '2021-08-06 02:46:15'),
(27, 17, 2, 'Вес - 3.1 кг. <br>Надпись - С днем Рождения Камилла!', 'cake', 1, 5000, '2021-08-06 02:46:15', '2021-08-06 02:46:15'),
(28, 18, 2, 'Вес - 7.4 кг. <br>Надпись - TEST', 'cake', 3, 111000, '2021-08-06 02:50:54', '2021-08-06 02:50:54'),
(29, 18, 1, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2000, '2021-08-06 02:50:54', '2021-08-06 02:50:54'),
(30, 18, 2, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2200, '2021-08-06 02:50:54', '2021-08-06 02:50:54'),
(31, 37, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-16 02:07:27', '2021-08-16 02:07:27'),
(32, 37, 1, 'Вес - 2.7 кг.', 'cake', 2, 17550, '2021-08-16 02:07:27', '2021-08-16 02:07:27'),
(33, 38, 1, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2000, '2021-08-19 04:12:28', '2021-08-19 04:12:28'),
(34, 38, 2, 'Баночка 400 гр - 7 порций', 'icecream', 2, 2200, '2021-08-19 04:12:28', '2021-08-19 04:12:28'),
(35, 39, 2, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2200, '2021-08-19 04:14:08', '2021-08-19 04:14:08'),
(36, 39, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-19 04:14:08', '2021-08-19 04:14:08'),
(37, 40, 1, 'Вес - 2.8 кг.', 'cake', 1, 18200, '2021-08-19 04:17:08', '2021-08-19 04:17:08'),
(38, 41, 2, 'Вес - 1.3 кг.', 'cake', 1, 6500, '2021-08-19 04:18:08', '2021-08-19 04:18:08'),
(39, 43, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-22 13:01:45', '2021-08-22 13:01:45'),
(40, 44, 1, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-08-22 13:11:58', '2021-08-22 13:11:58'),
(41, 45, 1, 'Баночка 400 гр - 7 порций', 'icecream', 3, 2000, '2021-08-30 17:22:44', '2021-08-30 17:22:44'),
(42, 45, 1, 'Баночка 1500 гр - 21 порция', 'icecream', 1, 4950, '2021-08-30 17:22:44', '2021-08-30 17:22:44'),
(43, 45, 1, 'Вафельные рожки', 'icecream', 1, 3200, '2021-08-30 17:22:44', '2021-08-30 17:22:44'),
(44, 46, 0, 'Вафельные рожки', 'waffle', 2, 3200, '2021-09-19 21:20:10', '2021-09-19 21:20:10'),
(45, 47, 0, 'Вафельные рожки', 'waffle', 2, 3200, '2021-09-19 21:20:28', '2021-09-19 21:20:28'),
(46, 48, 0, 'Вафельные рожки', 'waffle', 2, 3200, '2021-09-19 21:22:58', '2021-09-19 21:22:58'),
(47, 50, 9, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-09-26 15:35:43', '2021-09-26 15:35:43'),
(48, 51, 10, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-10-07 14:26:08', '2021-10-07 14:26:08'),
(49, 52, 10, 'Баночка 400 гр - 7 порций', 'icecream', 1, 2000, '2021-10-07 14:26:36', '2021-10-07 14:26:36');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'simple',
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `type`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `seo_title`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 'home', 1, 'Попробуй вкус настоящего мороженого', 'Качество - наш главный ингридиент', NULL, 'pages\\July2021\\OMmKU2zGsEGiTZfOAECH.png', 'poprobuj-vkus-nastoyashego-morozhenogo', 'Tutto Bene', 'Tutto Bene', 'Tutto Bene', 'ACTIVE', '2021-07-30 08:28:57', '2021-07-30 08:28:57'),
(2, 'posts', 1, 'Новости', NULL, NULL, 'pages\\July2021\\q8R4DsbZkINCwQ85aWYj.png', 'novosti', 'Новости', 'Новости', 'Новости', 'ACTIVE', '2021-07-30 08:40:39', '2021-07-30 08:40:39'),
(3, 'certs', 1, 'Сертификаты', NULL, NULL, 'pages\\July2021\\i5TdmvyFmtaumLAMqUET.png', 'sertifikaty', 'Сертификаты', 'Сертификаты', 'Сертификаты', 'ACTIVE', '2021-07-30 08:41:09', '2021-07-30 08:41:09'),
(4, 'partners', 1, 'Партнеры', 'Партнеры', NULL, 'pages\\July2021\\ykcVKg7pXlKKqryOpYje.png', 'partnery', 'Партнеры', 'Партнеры', 'Партнеры', 'ACTIVE', '2021-07-30 08:41:40', '2021-07-30 08:41:40'),
(5, 'team', 1, 'Наша команда', 'Наша команда', NULL, 'pages\\July2021\\pcqpjD22FFdmRPUQM4md.png', 'nasha-komanda', 'Наша команда', 'Наша команда', 'Наша команда', 'ACTIVE', '2021-07-30 08:42:12', '2021-07-30 08:42:12'),
(6, 'contacts', 1, 'Контакты', NULL, NULL, 'pages\\July2021\\g9SLQoFxBZqW6MXNcbdD.png', 'kontakty', 'Контакты', 'Контакты', 'Контакты', 'ACTIVE', '2021-07-30 08:42:45', '2021-07-30 08:42:45'),
(7, 'about', 1, 'О нас', 'О нас', NULL, 'pages\\July2021\\UaxIPdOSHIiGFq6okL38.png', 'o-nas', 'О нас', 'О нас', 'О нас', 'ACTIVE', '2021-07-30 08:43:45', '2021-07-30 08:43:56'),
(8, 'gelato', 1, 'О джелато', 'О джелато', NULL, 'pages\\July2021\\qv9cgIAp2N8GFcfBHpXV.png', 'o-dzhelato', 'О джелато', 'О джелато', 'О джелато', 'ACTIVE', '2021-07-30 08:44:23', '2021-07-30 08:44:23'),
(9, 'cooperation', 1, 'Сотрудничество', 'Сотрудничество', NULL, 'pages\\July2021\\YUa00Vt1ZF6oU48wHKgd.png', 'sotrudnichestvo', 'Сотрудничество', 'Сотрудничество', 'Сотрудничество', 'ACTIVE', '2021-07-30 08:45:07', '2021-07-30 08:45:15'),
(10, 'franchise', 1, 'Франшиза', 'Повседневная практика показывает, что начало повседневной работы по формированию позиции способствует подготовки и реализации существенных финансовых и административных условий. Товарищи! реализация намеченных плановых заданий позволяет выполнять важные задания по разработке направлений прогрессивного развития.', NULL, 'pages\\July2021\\6PsB54FgZ5YuryjjQBZ6.png', 'franshiza', 'Франшиза', 'Франшиза', 'Франшиза', 'ACTIVE', '2021-07-30 08:45:42', '2021-07-31 05:58:56'),
(11, 'horeca', 1, 'HoReCa', 'Повседневная практика показывает, что начало повседневной работы по формированию позиции способствует подготовки и реализации существенных финансовых и административных условий. Товарищи! реализация намеченных плановых заданий позволяет выполнять важные задания по разработке направлений прогрессивного развития.', NULL, 'pages\\July2021\\3BuHrjMIbgow4gKh8TjC.png', 'horeca', 'HoReCa', 'HoReCa', 'HoReCa', 'ACTIVE', '2021-07-30 08:46:20', '2021-07-31 05:59:21'),
(12, 'material', 1, 'Сырье', 'Повседневная практика показывает, что начало повседневной работы по формированию позиции способствует подготовки и реализации существенных финансовых и административных условий. Товарищи! реализация намеченных плановых заданий позволяет выполнять важные задания по разработке направлений прогрессивного развития.', NULL, 'pages\\July2021\\VtzQenOMXMu6AebKAVvu.png', 'syre', 'Dolce Rosa', 'Dolce Rosa', 'Dolce Rosa', 'ACTIVE', '2021-07-30 08:47:39', '2021-07-31 05:59:46'),
(13, 'services', 1, 'Выездное обслуживание', 'Выездное обслуживание', NULL, 'pages\\July2021\\TeVmMXFh0PdX2FXqgZYF.png', 'vyezdnoe-obsluzhivanie', 'Выездное обслуживание', 'Выездное обслуживание', 'Выездное обслуживание', 'ACTIVE', '2021-07-30 08:48:11', '2021-07-30 08:48:11'),
(14, 'constructor', 1, 'Создай свой торт', 'Создай свой торт', NULL, 'pages\\July2021\\LdwnlSyfhZZVbhEHJBvy.png', 'konstruktor', 'Создай свой торт', 'Создай свой торт', 'Создай свой торт', 'ACTIVE', '2021-07-30 08:48:44', '2021-07-31 14:50:49');

-- --------------------------------------------------------

--
-- Структура таблицы `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `partners`
--

INSERT INTO `partners` (`id`, `name`, `image`, `link`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ООО \"Джелато\"', 'partners/September2021/JW0o019jG9zVhV5ZdohI.jpeg', 'http://www.gelato.ru/', 1, 1, '2021-07-30 06:51:00', '2021-10-06 06:43:52'),
(3, 'Homak LTD', 'partners/September2021/RUn02GFmAympY3HBa0RE.jpg', 'https://www.sevel.com.tr/', 3, 1, '2021-07-30 06:52:00', '2021-10-06 06:44:01'),
(4, 'Valmar Global', 'partners\\July2021\\Yv1Eq3G7HE9fAkw9abru.png', 'https://valmar.eu/', 2, 1, '2021-07-30 06:51:00', '2021-10-06 06:44:12'),
(5, 'ТОО \"АЯ консалтинг\"', 'partners/September2021/AfmMSSjvWi2M1onubCMo.jpeg', '#', 4, 1, '2021-07-30 06:52:00', '2021-09-24 09:54:52'),
(6, 'ТОО \"Айс фуд\"', 'partners/September2021/JO2lrdz0hK8r8sqPDOMt.jpeg', '#', 5, 1, '2021-07-30 06:52:00', '2021-09-24 09:55:58'),
(7, 'ТОО \"Подсолнух advertising\"', 'partners/September2021/KYZKdlad4X4pBu8hrQTZ.webp', 'https://podsolnuh.kz/', 6, 1, '2021-07-30 06:51:00', '2021-10-06 06:44:20'),
(8, 'President', 'partners\\July2021\\kceGmJFHMvIykiQIxr3x.png', '#', 7, 1, '2021-07-30 06:52:00', '2021-09-24 09:57:53'),
(9, 'АО RG Brands, Молоко «Моё»', 'partners/September2021/oF5pVzEev0WA0sOGcSDb.png', 'https://rgbrands.com/', 8, 1, '2021-09-24 09:58:00', '2021-10-06 06:43:41'),
(10, 'ТОО \"Berry Сompany\"', 'partners/September2021/TEb7X1Y1H75I20HiWZJZ.jpeg', 'https://berrycompany.pulscen.kz/', 9, 1, '2021-09-24 10:00:00', '2021-10-06 06:43:34');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('cash','card','charge') COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `type`, `payment_id`, `confirmed`, `created_at`, `updated_at`) VALUES
(44, 1, 4200, 'cash', NULL, 1, '2021-08-05 05:49:04', '2021-08-05 05:49:04'),
(45, 2, 4200, 'cash', NULL, 1, '2021-08-05 05:49:52', '2021-08-05 05:49:52'),
(46, 3, 4200, 'cash', NULL, 1, '2021-08-05 05:50:53', '2021-08-05 05:50:53'),
(47, 4, 2200, 'cash', NULL, 1, '2021-08-05 06:24:21', '2021-08-05 06:24:21'),
(48, 5, 2000, 'cash', NULL, 1, '2021-08-05 06:27:19', '2021-08-05 06:27:19'),
(49, 6, 2000, 'cash', NULL, 1, '2021-08-05 06:31:03', '2021-08-05 06:31:03'),
(50, 7, 2200, 'cash', NULL, 1, '2021-08-05 06:33:54', '2021-08-05 06:33:54'),
(51, 8, 4400, 'card', NULL, 0, '2021-08-05 06:34:27', '2021-08-05 06:34:27'),
(52, 9, 4400, 'card', NULL, 0, '2021-08-05 06:35:29', '2021-08-05 06:35:29'),
(53, 10, 4400, 'card', NULL, 0, '2021-08-05 06:37:09', '2021-08-05 06:37:09'),
(54, 11, 4400, 'cash', NULL, 1, '2021-08-05 07:15:55', '2021-08-05 07:15:55'),
(55, 12, 16300, 'charge', NULL, 1, '2021-08-05 07:19:50', '2021-08-05 07:19:50'),
(56, 13, 16300, 'charge', NULL, 1, '2021-08-05 07:20:24', '2021-08-05 07:20:24'),
(57, 14, 9600, 'cash', NULL, 1, '2021-08-05 07:21:53', '2021-08-05 07:21:53'),
(58, 15, 3200, 'cash', NULL, 1, '2021-08-05 07:22:50', '2021-08-05 07:22:50'),
(59, 17, 29950, 'cash', NULL, 1, '2021-08-06 02:46:15', '2021-08-06 02:46:15'),
(60, 18, 342900, 'cash', NULL, 1, '2021-08-06 02:50:54', '2021-08-06 02:50:54'),
(61, 19, 49400, 'charge', NULL, 1, '2021-08-14 13:38:41', '2021-08-14 13:38:41'),
(62, 20, 15000, 'card', NULL, 0, '2021-08-14 13:59:28', '2021-08-14 13:59:28'),
(63, 21, 15000, 'card', NULL, 0, '2021-08-14 13:59:30', '2021-08-14 13:59:30'),
(64, 22, 15000, 'card', NULL, 0, '2021-08-14 13:59:42', '2021-08-14 13:59:42'),
(65, 23, 15000, 'card', NULL, 0, '2021-08-14 13:59:43', '2021-08-14 13:59:43'),
(66, 24, 15000, 'card', NULL, 0, '2021-08-14 13:59:44', '2021-08-14 13:59:44'),
(67, 25, 15000, 'charge', NULL, 1, '2021-08-14 13:59:54', '2021-08-14 13:59:54'),
(68, 26, 15000, 'card', NULL, 0, '2021-08-14 14:01:10', '2021-08-14 14:01:10'),
(69, 27, 15000, 'charge', NULL, 1, '2021-08-14 14:01:18', '2021-08-14 14:01:18'),
(70, 28, 16000, 'charge', NULL, 1, '2021-08-14 14:03:42', '2021-08-14 14:03:42'),
(71, 29, 16000, 'charge', NULL, 1, '2021-08-14 14:03:49', '2021-08-14 14:03:49'),
(72, 30, 16000, 'charge', NULL, 1, '2021-08-14 14:03:50', '2021-08-14 14:03:50'),
(73, 31, 16000, 'charge', NULL, 1, '2021-08-14 14:03:52', '2021-08-14 14:03:52'),
(74, 32, 14500, 'charge', NULL, 1, '2021-08-14 14:05:58', '2021-08-14 14:05:58'),
(75, 33, 14500, 'charge', NULL, 1, '2021-08-14 14:07:55', '2021-08-14 14:07:55'),
(76, 34, 14500, 'charge', NULL, 1, '2021-08-14 14:08:12', '2021-08-14 14:08:12'),
(77, 35, 14500, 'charge', NULL, 1, '2021-08-14 14:08:22', '2021-08-14 14:08:22'),
(78, 36, 14500, 'charge', NULL, 1, '2021-08-14 14:10:19', '2021-08-14 14:10:19'),
(79, 37, 37100, 'charge', NULL, 1, '2021-08-16 02:07:27', '2021-08-16 02:07:27'),
(80, 38, 8400, 'cash', NULL, 1, '2021-08-19 04:12:28', '2021-08-19 04:12:28'),
(81, 39, 4200, 'cash', NULL, 1, '2021-08-19 04:14:08', '2021-08-19 04:14:08'),
(82, 40, 18200, 'charge', NULL, 1, '2021-08-19 04:17:08', '2021-08-19 04:17:08'),
(83, 41, 6500, 'charge', NULL, 1, '2021-08-19 04:18:08', '2021-08-19 04:18:08'),
(84, 42, 33800, 'charge', NULL, 1, '2021-08-19 04:49:37', '2021-08-19 04:49:37'),
(85, 43, 2000, 'card', NULL, 0, '2021-08-22 13:01:45', '2021-08-22 13:01:45'),
(86, 44, 2000, 'card', NULL, 0, '2021-08-22 13:11:58', '2021-08-22 13:11:58'),
(87, 45, 14150, 'card', NULL, 0, '2021-08-30 17:22:44', '2021-08-30 17:22:44'),
(88, 46, 6400, 'cash', NULL, 1, '2021-09-19 21:20:10', '2021-09-19 21:20:10'),
(89, 47, 6400, 'cash', NULL, 1, '2021-09-19 21:20:28', '2021-09-19 21:20:28'),
(90, 48, 6400, 'cash', NULL, 1, '2021-09-19 21:22:58', '2021-09-19 21:22:58'),
(91, 49, 104000, 'card', NULL, 0, '2021-09-20 09:32:18', '2021-09-20 09:32:18'),
(92, 50, 2000, 'card', NULL, 0, '2021-09-26 15:35:43', '2021-09-26 15:35:43'),
(93, 51, 2000, 'card', NULL, 0, '2021-10-07 14:26:08', '2021-10-07 14:26:08'),
(94, 52, 2000, 'cash', NULL, 1, '2021-10-07 14:26:36', '2021-10-07 14:26:36');

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(2, 'browse_bread', NULL, '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(3, 'browse_database', NULL, '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(4, 'browse_media', NULL, '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(5, 'browse_compass', NULL, '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(6, 'browse_menus', 'menus', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(7, 'read_menus', 'menus', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(8, 'edit_menus', 'menus', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(9, 'add_menus', 'menus', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(10, 'delete_menus', 'menus', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(11, 'browse_roles', 'roles', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(12, 'read_roles', 'roles', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(13, 'edit_roles', 'roles', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(14, 'add_roles', 'roles', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(15, 'delete_roles', 'roles', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(16, 'browse_users', 'users', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(17, 'read_users', 'users', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(18, 'edit_users', 'users', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(19, 'add_users', 'users', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(20, 'delete_users', 'users', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(21, 'browse_settings', 'settings', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(22, 'read_settings', 'settings', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(23, 'edit_settings', 'settings', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(24, 'add_settings', 'settings', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(25, 'delete_settings', 'settings', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(26, 'browse_categories', 'categories', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(27, 'read_categories', 'categories', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(28, 'edit_categories', 'categories', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(29, 'add_categories', 'categories', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(30, 'delete_categories', 'categories', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(31, 'browse_posts', 'posts', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(32, 'read_posts', 'posts', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(33, 'edit_posts', 'posts', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(34, 'add_posts', 'posts', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(35, 'delete_posts', 'posts', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(36, 'browse_pages', 'pages', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(37, 'read_pages', 'pages', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(38, 'edit_pages', 'pages', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(39, 'add_pages', 'pages', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(40, 'delete_pages', 'pages', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(41, 'browse_hooks', NULL, '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(42, 'browse_branches', 'branches', '2021-07-30 03:40:10', '2021-07-30 03:40:10'),
(43, 'read_branches', 'branches', '2021-07-30 03:40:10', '2021-07-30 03:40:10'),
(44, 'edit_branches', 'branches', '2021-07-30 03:40:10', '2021-07-30 03:40:10'),
(45, 'add_branches', 'branches', '2021-07-30 03:40:10', '2021-07-30 03:40:10'),
(46, 'delete_branches', 'branches', '2021-07-30 03:40:10', '2021-07-30 03:40:10'),
(47, 'browse_contacts', 'contacts', '2021-07-30 03:45:08', '2021-07-30 03:45:08'),
(48, 'read_contacts', 'contacts', '2021-07-30 03:45:08', '2021-07-30 03:45:08'),
(49, 'edit_contacts', 'contacts', '2021-07-30 03:45:08', '2021-07-30 03:45:08'),
(50, 'add_contacts', 'contacts', '2021-07-30 03:45:08', '2021-07-30 03:45:08'),
(51, 'delete_contacts', 'contacts', '2021-07-30 03:45:08', '2021-07-30 03:45:08'),
(52, 'browse_partners', 'partners', '2021-07-30 03:46:54', '2021-07-30 03:46:54'),
(53, 'read_partners', 'partners', '2021-07-30 03:46:54', '2021-07-30 03:46:54'),
(54, 'edit_partners', 'partners', '2021-07-30 03:46:54', '2021-07-30 03:46:54'),
(55, 'add_partners', 'partners', '2021-07-30 03:46:54', '2021-07-30 03:46:54'),
(56, 'delete_partners', 'partners', '2021-07-30 03:46:54', '2021-07-30 03:46:54'),
(57, 'browse_certificates', 'certificates', '2021-07-30 03:50:33', '2021-07-30 03:50:33'),
(58, 'read_certificates', 'certificates', '2021-07-30 03:50:33', '2021-07-30 03:50:33'),
(59, 'edit_certificates', 'certificates', '2021-07-30 03:50:33', '2021-07-30 03:50:33'),
(60, 'add_certificates', 'certificates', '2021-07-30 03:50:33', '2021-07-30 03:50:33'),
(61, 'delete_certificates', 'certificates', '2021-07-30 03:50:33', '2021-07-30 03:50:33'),
(62, 'browse_members', 'members', '2021-07-30 03:56:12', '2021-07-30 03:56:12'),
(63, 'read_members', 'members', '2021-07-30 03:56:12', '2021-07-30 03:56:12'),
(64, 'edit_members', 'members', '2021-07-30 03:56:12', '2021-07-30 03:56:12'),
(65, 'add_members', 'members', '2021-07-30 03:56:12', '2021-07-30 03:56:12'),
(66, 'delete_members', 'members', '2021-07-30 03:56:12', '2021-07-30 03:56:12'),
(67, 'browse_image_texts', 'image_texts', '2021-07-31 10:28:17', '2021-07-31 10:28:17'),
(68, 'read_image_texts', 'image_texts', '2021-07-31 10:28:17', '2021-07-31 10:28:17'),
(69, 'edit_image_texts', 'image_texts', '2021-07-31 10:28:17', '2021-07-31 10:28:17'),
(70, 'add_image_texts', 'image_texts', '2021-07-31 10:28:17', '2021-07-31 10:28:17'),
(71, 'delete_image_texts', 'image_texts', '2021-07-31 10:28:17', '2021-07-31 10:28:17'),
(72, 'browse_sliders', 'sliders', '2021-07-31 14:26:12', '2021-07-31 14:26:12'),
(73, 'read_sliders', 'sliders', '2021-07-31 14:26:12', '2021-07-31 14:26:12'),
(74, 'edit_sliders', 'sliders', '2021-07-31 14:26:12', '2021-07-31 14:26:12'),
(75, 'add_sliders', 'sliders', '2021-07-31 14:26:12', '2021-07-31 14:26:12'),
(76, 'delete_sliders', 'sliders', '2021-07-31 14:26:12', '2021-07-31 14:26:12'),
(77, 'browse_services', 'services', '2021-07-31 15:08:23', '2021-07-31 15:08:23'),
(78, 'read_services', 'services', '2021-07-31 15:08:23', '2021-07-31 15:08:23'),
(79, 'edit_services', 'services', '2021-07-31 15:08:23', '2021-07-31 15:08:23'),
(80, 'add_services', 'services', '2021-07-31 15:08:23', '2021-07-31 15:08:23'),
(81, 'delete_services', 'services', '2021-07-31 15:08:23', '2021-07-31 15:08:23'),
(82, 'browse_icecreams', 'icecreams', '2021-08-01 03:27:19', '2021-08-01 03:27:19'),
(83, 'read_icecreams', 'icecreams', '2021-08-01 03:27:19', '2021-08-01 03:27:19'),
(84, 'edit_icecreams', 'icecreams', '2021-08-01 03:27:19', '2021-08-01 03:27:19'),
(85, 'add_icecreams', 'icecreams', '2021-08-01 03:27:19', '2021-08-01 03:27:19'),
(86, 'delete_icecreams', 'icecreams', '2021-08-01 03:27:19', '2021-08-01 03:27:19'),
(87, 'browse_ice_types', 'ice_types', '2021-08-01 03:29:31', '2021-08-01 03:29:31'),
(88, 'read_ice_types', 'ice_types', '2021-08-01 03:29:31', '2021-08-01 03:29:31'),
(89, 'edit_ice_types', 'ice_types', '2021-08-01 03:29:31', '2021-08-01 03:29:31'),
(90, 'add_ice_types', 'ice_types', '2021-08-01 03:29:31', '2021-08-01 03:29:31'),
(91, 'delete_ice_types', 'ice_types', '2021-08-01 03:29:31', '2021-08-01 03:29:31'),
(92, 'browse_ice_portions', 'ice_portions', '2021-08-01 06:02:44', '2021-08-01 06:02:44'),
(93, 'read_ice_portions', 'ice_portions', '2021-08-01 06:02:44', '2021-08-01 06:02:44'),
(94, 'edit_ice_portions', 'ice_portions', '2021-08-01 06:02:44', '2021-08-01 06:02:44'),
(95, 'add_ice_portions', 'ice_portions', '2021-08-01 06:02:44', '2021-08-01 06:02:44'),
(96, 'delete_ice_portions', 'ice_portions', '2021-08-01 06:02:44', '2021-08-01 06:02:44'),
(97, 'browse_orders', 'orders', '2021-08-05 07:53:06', '2021-08-05 07:53:06'),
(98, 'read_orders', 'orders', '2021-08-05 07:53:06', '2021-08-05 07:53:06'),
(99, 'edit_orders', 'orders', '2021-08-05 07:53:06', '2021-08-05 07:53:06'),
(100, 'add_orders', 'orders', '2021-08-05 07:53:06', '2021-08-05 07:53:06'),
(101, 'delete_orders', 'orders', '2021-08-05 07:53:06', '2021-08-05 07:53:06'),
(102, 'browse_cakes', 'cakes', '2021-08-05 08:37:40', '2021-08-05 08:37:40'),
(103, 'read_cakes', 'cakes', '2021-08-05 08:37:40', '2021-08-05 08:37:40'),
(104, 'edit_cakes', 'cakes', '2021-08-05 08:37:40', '2021-08-05 08:37:40'),
(105, 'add_cakes', 'cakes', '2021-08-05 08:37:40', '2021-08-05 08:37:40'),
(106, 'delete_cakes', 'cakes', '2021-08-05 08:37:40', '2021-08-05 08:37:40'),
(107, 'browse_districts', 'districts', '2021-08-06 02:23:50', '2021-08-06 02:23:50'),
(108, 'read_districts', 'districts', '2021-08-06 02:23:50', '2021-08-06 02:23:50'),
(109, 'edit_districts', 'districts', '2021-08-06 02:23:50', '2021-08-06 02:23:50'),
(110, 'add_districts', 'districts', '2021-08-06 02:23:50', '2021-08-06 02:23:50'),
(111, 'delete_districts', 'districts', '2021-08-06 02:23:50', '2021-08-06 02:23:50');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(99, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'ДЕНЬ РОЖДЕНИЯ В СЕНТЯБРЕ?', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'Новая акция!', '<p><strong style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\">ИМЕНИННИКИ сентября!</strong><br style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\" /><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Специально для вас Tutto Bene дарит скидку 20% на любой торт-мороженое (или 2 баночки фасованного мороженого на выбор).</span><br style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\" /><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Порадуйте себя и гостей вкусным лакомством! Приходите за тортом в Джелатерию Tutto Bene, расположенную на 3 этаже ТРЦ Достык Плаза @dostykplaza, не забудьте с собой удостоверение личности. Сделайте фото с барменом и выбранным тортом, разместите его у себя с хэштегом @tuttobene, отметив троих друзей. Данная Акция действует весь сентябрь за 3 дня до именин, в день рождения&nbsp;и 3 дня после.</span><br style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\" /><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Празднуйте день рождения вкусно с Tutto Bene.&nbsp;</span></p>', 'posts\\July2021\\QgYZ2dsxcrGH0XDAsJqK.png', 'den-rozhdeniya-v-sentyabre', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'PUBLISHED', 1, '2021-07-31 13:54:27', '2021-09-17 12:02:07'),
(2, 1, NULL, 'COMBO 2+1', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'Акция на доставку WOLT', '<p><span style=\"color: #000000; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Отличная новость! При заказе двух любых сливочных сортов джелато в баночке 400 гр и одного сорбета через приложение WOLT сумма заказа будет вместо 7500 тг, всего 6500 тг. TUTTO BENE- то быстро, вкусно и весело! А еще с экономией.</span></p>', 'posts\\July2021\\QgYZ2dsxcrGH0XDAsJqK.png', 'combo-2-1', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'PUBLISHED', 0, '2021-07-31 13:54:27', '2021-09-17 12:04:50'),
(3, 1, NULL, 'МЫ СТАНОВИМСЯ БЛИЖЕ', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'Наш партнер - WOLT', '<p><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Для счастливчиков, живущих в радиусе 5 км от ТРЦ Dostyk Plaza и от Ауэзова, 3 (Угол Толе би), у нас отличная новость! Баночки с мороженым TUTTO BENE доставит вам на дом WOLT!</span><br style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\" /><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Просто вбейте в поле поиска \"Tutto Bene\", выберите вкус любимого холодного лакомства и подождите около 30 мин!</span><br style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\" /><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Заказать Тутто Бене домой все проще, а значит мы становимся ближе.</span></p>', 'posts\\July2021\\QgYZ2dsxcrGH0XDAsJqK.png', 'my-stanovimsya-blizhe', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'PUBLISHED', 0, '2021-07-31 13:54:27', '2021-09-17 12:04:17'),
(5, 1, NULL, 'КОКТЕЙЛЬНЫЕ ДНИ', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'в Джелатерии TUTTO BENE', '<p><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Уже сегодня!</span><br style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\" /><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">АКЦИЯ в GELATERIA TUTTO BENE \"Коктейльные дни\"</span><br style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\" /><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Весь август, каждый вторник и пятницу только в&nbsp;</span><a style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #e63436; font-size: 16px;\" href=\"https://tuttobene.kz/contacts/?lang=ru\" target=\"_blank\" rel=\"noopener\">Джелатерии в Достык Плаза&nbsp;</a><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">скидка на молочные коктейли 25%.</span><br style=\"font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; color: #4f2b24; font-size: 16px;\" /><span style=\"color: #4f2b24; font-family: \'Myriad Pro\', MyriadProRegular, Tahoma, Geneva, sans-serif; font-size: 16px;\">Самое время попробовать новые оригинальные вкусы коктейлей - черника, банан, чизкейк, бабл гам, яблочный пирог...погрузитесь в мир ярких вкусов вместе с Tutto Bene!</span></p>', 'posts\\July2021\\QgYZ2dsxcrGH0XDAsJqK.png', 'koktejlnye-dni', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'Весна - время прекрасного настроения, улыбок, счастья и мороженого.', 'PUBLISHED', 1, '2021-07-31 13:54:27', '2021-09-17 12:02:59');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-07-29 15:02:27', '2021-07-29 15:02:27'),
(2, 'user', 'Normal User', '2021-07-29 15:02:27', '2021-07-29 15:02:27');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `title`, `excerpt`, `description`, `image`, `content`, `price`, `body`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Уютный праздник', 'Для небольшой компании', '30-100 гостей', 'services/October2021/DLTxbCIhlba69om5IT9w.png', '<ul>\r\n<li>Ведёрки с мороженым</li>\r\n<li>Раздача барменом 1-3 часа</li>\r\n<li>8 вкусов мороженого</li>\r\n<li>12 кг мороженого</li>\r\n</ul>', 10000, '<p>Задача организации, в особенности же начало повседневной работы по формированию позиции влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Значимость этих проблем настолько очевидна, что консультация с широким активом требуют определения и уточнения форм развития. Задача организации, в особенности же реализация намеченных плановых заданий представляет собой интересный эксперимент проверки направлений прогрессивного развития. Не следует, однако забывать, что начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют от нас анализа дальнейших направлений развития.</p>\r\n<p>Не следует, однако забывать, что начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют от нас анализа дальнейших направлений развития.</p>', 1, 1, '2021-07-31 15:10:00', '2021-10-15 06:50:16'),
(2, 'Супер праздник', 'Оптимальный вариант', '100-250 гостей', 'services/October2021/8XCeLb7I0mE5L1egbeM6.png', '<ul>\r\n<li>Ведёрки с мороженым</li>\r\n<li>Раздача барменом 3-4 часа</li>\r\n<li>6 вкусов мороженого</li>\r\n<li>18 кг мороженого</li>\r\n</ul>', 20000, '<p>Задача организации, в особенности же начало повседневной работы по формированию позиции влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Значимость этих проблем настолько очевидна, что консультация с широким активом требуют определения и уточнения форм развития. Задача организации, в особенности же реализация намеченных плановых заданий представляет собой интересный эксперимент проверки направлений прогрессивного развития. Не следует, однако забывать, что начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют от нас анализа дальнейших направлений развития.</p>\r\n<p>Не следует, однако забывать, что начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют от нас анализа дальнейших направлений развития.</p>', 2, 1, '2021-07-31 15:10:00', '2021-10-15 06:50:00'),
(3, 'Крупный праздник', 'Для масштабных мероприятий', '250-400 гостей', 'services/October2021/MGzdUSdMtNUkLTQIIEa8.png', '<ul>\r\n<li>Выезд витрины с мороженым</li>\r\n<li>Раздача барменом 3-4 часа</li>\r\n<li>8 вкусов мороженого</li>\r\n<li>12 кг мороженого</li>\r\n</ul>', 30000, '<p>Задача организации, в особенности же начало повседневной работы по формированию позиции влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Значимость этих проблем настолько очевидна, что консультация с широким активом требуют определения и уточнения форм развития. Задача организации, в особенности же реализация намеченных плановых заданий представляет собой интересный эксперимент проверки направлений прогрессивного развития. Не следует, однако забывать, что начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют от нас анализа дальнейших направлений развития.</p>\r\n<p>Не следует, однако забывать, что начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют от нас анализа дальнейших направлений развития.</p>', 3, 1, '2021-07-31 15:10:00', '2021-10-15 06:48:26');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Gelato Tutto Bene', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\July2021\\fzS30ZjnlDWh6zOJRve8.svg', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.copyrights', 'Copyright text', '© 2021 TOO Gelato Tutto Bene<br>Все права защищены', NULL, 'text', 6, 'Site'),
(12, 'site.partners_website', 'Сайт партнеров с описанием продукции', 'http://www.gelato.ru/', NULL, 'text', 7, 'Site'),
(13, 'site.whatsapp', 'Whatsapp Номер', '+7 777 77 77 777', NULL, 'text', 8, 'Site'),
(14, 'site.presentation', 'Презентация Франшизы', '[{\"download_link\":\"settings\\/September2021\\/j16UUtNbfgY7TsGS6LPw.pdf\",\"original_name\":\"\\u041f\\u0440\\u0435\\u0437\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044f Tuttobene.pdf\"}]', NULL, 'file', 9, 'Site'),
(18, 'site.c_price', 'Конструктор цена за 1кг', '6500', NULL, 'text', 10, 'Site'),
(21, 'site.c_maxWeight', 'Конструктор максимальный вес (кг.)', '6.5', NULL, 'text', 12, 'Site'),
(22, 'site.c_minWeight_1', 'Конструктор минимальный вес - 1 ярус (кг.)', '1', NULL, 'text', 13, 'Site'),
(23, 'site.c_minWeight_2', 'Конструктор минимальный вес - 2 яруса (кг.)', '1.6', NULL, 'text', 14, 'Site'),
(24, 'site.c_minWeight_3', 'Конструктор минимальный вес - 3 яруса (кг.)', '1.8', NULL, 'text', 15, 'Site'),
(25, 'site.delivery_terms', 'Условия доставки', '<p>Задача организации, в особенности же начало повседневной работы по формированию позиции влечет за собой процесс внедрения и модернизации дальнейших направлений развития. Значимость этих проблем настолько очевидна, что консультация с широким активом требуют определения и уточнения форм развития. Задача организации, в особенности же реализация намеченных плановых заданий представляет собой интересный эксперимент проверки направлений прогрессивного развития. Не следует, однако забывать, что начало повседневной работы по формированию позиции представляет собой интересный эксперимент проверки систем массового участия. Значимость этих проблем настолько очевидна, что рамки и место обучения кадров требуют от нас анализа дальнейших направлений развития.</p>', NULL, 'rich_text_box', 17, 'Site'),
(26, 'site.franchize_form', 'Franchize Form', '[{\"download_link\":\"settings\\/September2021\\/icsbdT1bpxGDYVulsudh.pdf\",\"original_name\":\"\\u0410\\u043d\\u043a\\u0435\\u0442\\u0430 \\u043f\\u043e\\u0442\\u0435\\u043d\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0444\\u0440\\u0430\\u043d\\u0447\\u0430\\u0439\\u0437\\u0438 \\u043d\\u043e\\u0432\\u0430\\u044f.pdf\"}]', NULL, 'file', 18, 'Site'),
(27, 'site.waffle_price', 'Цена Рожка', '3200', NULL, 'text', 16, 'Site');

-- --------------------------------------------------------

--
-- Структура таблицы `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image`, `sort_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Слайдер', 'sliders\\July2021\\YCC4FNHyuscXUEFolipW.png', 1, 1, '2021-07-31 14:27:37', '2021-07-31 14:27:37'),
(2, 'Слайдер 2', 'sliders/September2021/dfPL70o7ZGvds8RiJ43x.jpg', 2, 1, '2021-07-31 14:27:00', '2021-09-24 08:09:11'),
(3, 'Слайдер 3', 'sliders/September2021/KYFYyJ0SMxgq94GxdgE8.jpg', 3, 1, '2021-07-31 14:28:00', '2021-09-22 07:07:05'),
(4, 'Слайдер 4', 'sliders/September2021/a1mwcWbtvGPqgZVIBSkQ.jpg', 4, 1, '2021-09-22 07:07:42', '2021-09-22 07:07:42'),
(5, 'Слайдер 5', 'sliders/October2021/aIfsG2ngDI0kwhsEwh56.jpg', 5, 1, '2021-09-22 07:08:00', '2021-10-06 14:31:37'),
(6, 'Слайдер 6', 'sliders/October2021/w4HiP0xXsfAtF23A8jWG.jpg', 6, 1, '2021-10-06 14:33:00', '2021-10-06 14:33:25');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-07-29 15:02:28', '2021-07-29 15:02:28'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-07-29 15:02:28', '2021-07-29 15:02:28');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$z0j4D7dzSuyFI/R4x4bjxeqLsKqEvfiAWS9ne1sNJoeKelb5MgD3e', 'RtcZ5U6VI6K2OzlCwu8IX8m12WaBX8g7ANLhNmYfGhpzqSTCBc4SO25ocr7b', '{\"locale\":\"ru\"}', '2021-07-29 15:02:28', '2021-07-30 03:42:15');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cakes`
--
ALTER TABLE `cakes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cakes_slug_unique` (`slug`);

--
-- Индексы таблицы `cake_products`
--
ALTER TABLE `cake_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `icecreams`
--
ALTER TABLE `icecreams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `icecreams_slug_unique` (`slug`);

--
-- Индексы таблицы `ice_portions`
--
ALTER TABLE `ice_portions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ice_portions_icecream_id_index` (`icecream_id`);

--
-- Индексы таблицы `ice_types`
--
ALTER TABLE `ice_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ice_types_slug_unique` (`slug`);

--
-- Индексы таблицы `image_texts`
--
ALTER TABLE `image_texts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_entities`
--
ALTER TABLE `order_entities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `cakes`
--
ALTER TABLE `cakes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `cake_products`
--
ALTER TABLE `cake_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `icecreams`
--
ALTER TABLE `icecreams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `ice_portions`
--
ALTER TABLE `ice_portions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT для таблицы `ice_types`
--
ALTER TABLE `ice_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `image_texts`
--
ALTER TABLE `image_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `order_entities`
--
ALTER TABLE `order_entities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ice_portions`
--
ALTER TABLE `ice_portions`
  ADD CONSTRAINT `ice_portions_icecream_id_foreign` FOREIGN KEY (`icecream_id`) REFERENCES `icecreams` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

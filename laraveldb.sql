-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Maio-2022 às 15:54
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `laraveldb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'Geral', '2022-05-18 20:38:00', '2022-05-18 20:38:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` int(10) UNSIGNED NOT NULL,
  `logradouro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `enderecos`
--

INSERT INTO `enderecos` (`id`, `logradouro`, `numero`, `cidade`, `estado`, `cep`, `complemento`, `usuario_id`, `created_at`, `updated_at`) VALUES
(1, 'rua XXX', '1', 'São Paulo', 'SP', '03386-010', 'D', 1, '2022-05-23 07:14:35', '2022-05-23 07:14:35'),
(2, 'rua ZZZ', '5', 'São Paulo', 'SP', '00000-000', 'G', 3, '2022-05-23 07:19:27', '2022-05-23 07:19:27'),
(3, 'rua XXX', '5', 'São Paulo', 'MG', '00000-000', 'H', 6, '2022-05-23 19:37:59', '2022-05-23 19:37:59'),
(4, 'rua XXX', '1', 'São Paulo', 'SP', '03386-010', 'D', 7, '2022-05-23 23:34:07', '2022-05-23 23:34:07'),
(5, 'Rua Teste', '45', 'Rio', 'RJ', '45487-878', 'Casa', 8, '2022-05-23 23:58:14', '2022-05-23 23:58:14'),
(6, 'Rua Teste', '45', 'Rio', 'RJ', '45487-87', 'Casa', 9, '2022-05-24 00:00:23', '2022-05-24 00:00:23'),
(7, 'Rua Teste 2', '69', 'Curitiba', 'PR', '13484-015', 'Cas', 10, '2022-05-24 03:04:38', '2022-05-24 03:04:38'),
(8, 'Rua Teste 26', '88', 'São Paulo', 'SP', '00000-000', 'Y', 11, '2022-05-24 03:07:12', '2022-05-24 03:07:12'),
(9, 'Rua B', '28', 'Rio de Janeiro', 'RJ', '25645-645', 'Sala', 12, '2022-05-24 20:00:57', '2022-05-24 20:00:57'),
(10, 'Rua C', '69', 'São Paulo', 'SP', '01248786', 'G', 13, '2022-05-24 20:16:51', '2022-05-24 20:16:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_pedidos`
--

CREATE TABLE `itens_pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `dt_item` datetime NOT NULL,
  `produto_id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_05_17_033048_create_categorias_table', 1),
(3, '2022_05_17_033132_create_produtos_table', 1),
(4, '2022_05_17_033152_create_usuarios_table', 1),
(5, '2022_05_17_033218_create_enderecos_table', 1),
(6, '2022_05_17_033243_create_pedidos_table', 1),
(7, '2022_05_17_033310_create_itens_pedidos_table', 1),
(8, '2022_05_17_172800_insert_products', 1),
(9, '2022_05_23_032931_alter_table_usuarios_add_column_email', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `datapedido` datetime NOT NULL,
  `status` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `foto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `valor`, `foto`, `descricao`, `categoria_id`, `created_at`, `updated_at`) VALUES
(1, 'Produto 8', '10.00', 'images/produto1.jpg', '', 1, '2022-05-18 20:38:00', '2022-05-18 20:38:00'),
(2, 'Produto 9', '10.00', 'images/produto7.jpg', '', 1, '2022-05-18 20:38:00', '2022-05-18 20:38:00'),
(3, 'Produto 10', '10.00', 'images/produto8.jpg', '', 1, '2022-05-18 20:38:00', '2022-05-18 20:38:00'),
(4, 'Produto 11', '10.00', 'images/produto9.jpg', '', 1, '2022-05-18 20:38:00', '2022-05-18 20:38:00'),
(5, 'Produto 12', '10.00', 'images/produto10.jpg', '', 1, '2022-05-18 20:38:00', '2022-05-18 20:38:00'),
(6, 'Produto 13', '10.00', 'images/produto6.jpg', '', 1, '2022-05-18 20:38:00', '2022-05-18 20:38:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `login`, `password`, `nome`, `created_at`, `updated_at`, `email`) VALUES
(1, '460.804.048', '123', 'Santa', '2022-05-23 07:14:35', '2022-05-23 07:14:35', 'santa@gmail.com'),
(3, '460.804.079', '1234', 'Thulles', '2022-05-23 07:19:27', '2022-05-23 07:19:27', 'carequi@gmail.com'),
(6, '015.454.545-45', '$2y$10$P8l0K7NM.ArKto56Xp8lF.WebL13.iblGrGAlkpo92wsn9VP3.i.6', 'Santa', '2022-05-23 19:37:59', '2022-05-23 19:37:59', 'demonia@gmail.com'),
(7, '460.804.048-11', '$2y$10$PcbWLVcuTJhUy2GMMoq7au63kvjIZmlUCnWhkCe3JGHcjR52I1N8m', 'd', '2022-05-23 23:34:07', '2022-05-23 23:34:07', 'rafa.casarini@gmail.com'),
(8, '123.456.789-49', '$2y$10$v.P/GOo8AWJqQtAwH/skJeOD5M4GAVAlslMhdA9n0BKIvuju./RXi', 'Mario', '2022-05-23 23:58:14', '2022-05-23 23:58:14', 'mario@ig.com'),
(9, '460.804.079-49', '$2y$10$LtbRbhZD2HopRzFhSK0Svu/pK7lNNYBkLEfGwWXZKo/DtsIopQPLO', 'Mario', '2022-05-24 00:00:23', '2022-05-24 00:00:23', 'mario@ig.com'),
(10, '014.489.798-47', '$2y$10$j22y/wSdbh91Gjs0Lzbrv.Azy3Ez4UD4eXP4t6AYNcNK5nGjPq7hq', 'Jumento', '2022-05-24 03:04:38', '2022-05-24 03:04:38', 'ju@gmail.com'),
(11, '000.000.000-00', '$2y$10$gjGs501Spdsit6ZsjWXileUOIMhybXi9elz9Eh4IKZJE2LsP0OpG.', 'Homer', '2022-05-24 03:07:12', '2022-05-24 03:07:12', 'homer@gmail.com'),
(12, '14785236900', '$2y$10$hUCrBUwFtLUa6p/LXxVoMuzDYOBodaRIQHq9m0882cWgL3PhTkTg2', 'Jose', '2022-05-24 20:00:57', '2022-05-24 20:00:57', 'jose@gmail.com'),
(13, '01457895214', '$2y$10$E7cytFKs1O.M5DUb4KB72eav5dSNCh0q5eLWxQFSrCVf89jETD0Ii', 'Tholias', '2022-05-24 20:16:51', '2022-05-24 20:16:51', 'th@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enderecos_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itens_pedidos_produto_id_foreign` (`produto_id`),
  ADD KEY `itens_pedidos_pedido_id_foreign` (`pedido_id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedidos_usuario_id_foreign` (`usuario_id`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produtos_categoria_id_foreign` (`categoria_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_login_unique` (`login`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD CONSTRAINT `itens_pedidos_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `itens_pedidos_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

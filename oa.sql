-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.12 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 oa 的数据库结构
CREATE DATABASE IF NOT EXISTS `oa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `oa`;

-- 导出  表 oa.smt_departments 结构
CREATE TABLE IF NOT EXISTS `smt_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父部门ID',
  `leader_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门负责人ID',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门唯一标识',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '部门描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1-启用，0-禁用',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `idx_parent` (`parent_id`),
  KEY `idx_leader` (`leader_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='部门表';

-- 正在导出表  oa.smt_departments 的数据：~6 rows (大约)
DELETE FROM `smt_departments`;
INSERT INTO `smt_departments` (`id`, `name`, `parent_id`, `leader_id`, `code`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, '开发部', 0, 0, 'KFB', '', 1, '2025-06-28 08:11:07', '2025-06-28 08:11:07'),
	(2, ' 产品部', 0, 0, 'CPB', '', 1, '2025-06-28 08:12:33', '2025-06-28 08:12:37'),
	(3, '财务部', 0, 0, 'CWB', '', 1, '2025-06-28 08:22:16', '2025-06-28 08:34:13'),
	(6, '财务部22222', 3, 0, 'CWB-1', '', 1, '2025-06-28 08:34:18', '2025-06-28 08:36:46'),
	(7, '财务部21', 3, 1, 'CWB-2', '', 1, '2025-06-28 08:36:37', '2025-06-28 08:37:09'),
	(8, 'cs11', 1, 0, '22C', '', 1, '2025-06-30 06:20:54', '2025-06-30 06:20:54'),
	(10, '3333', 2, 0, '33D22', '', 1, '2025-06-30 08:34:21', '2025-06-30 08:34:21'),
	(11, '2323', 2, 0, '1231245345', '', 1, '2025-06-30 08:44:47', '2025-06-30 08:44:47'),
	(12, '124234', 1, 0, '34543543', '', 1, '2025-06-30 09:48:02', '2025-06-30 09:48:02'),
	(13, '234324', 0, 0, '3234', '', 1, '2025-06-30 09:49:21', '2025-06-30 09:49:21');

-- 导出  表 oa.smt_menus 结构
CREATE TABLE IF NOT EXISTS `smt_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单标识符',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型：0=目录,1=菜单,2=按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `route` varchar(200) DEFAULT NULL COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `permission` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示状态：0=隐藏,1=显示',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0=禁用,1=启用',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`),
  KEY `idx_parent` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';

-- 正在导出表  oa.smt_menus 的数据：~33 rows (大约)
DELETE FROM `smt_menus`;
INSERT INTO `smt_menus` (`id`, `parent_id`, `name`, `code`, `type`, `icon`, `route`, `component`, `permission`, `sort`, `visible`, `status`, `created_at`, `updated_at`) VALUES
	(1, 0, '工作台', 'dashboard', 1, 'HomeFilled', '/dashboard', '@/views/Dashboard.vue', 'dashboard:view', 1, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(2, 0, '系统管理', 'system', 0, 'Setting', '/system', '', 'system:view', 10, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(3, 2, '菜单管理', 'system:menu', 1, 'Menu', '/system/menu', '@/views/system/Menu.vue', 'system:menu:view', 1, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(4, 3, '新增菜单', 'system:menu:add', 2, '', '', '', 'system:menu:add', 1, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(5, 3, '编辑菜单', 'system:menu:edit', 2, '', '', '', 'system:menu:edit', 2, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(6, 3, '删除菜单', 'system:menu:delete', 2, '', '', '', 'system:menu:delete', 3, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(7, 3, '菜单详情', 'system:menu:detail', 2, '', '', '', 'system:menu:detail', 4, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(10, 0, '组织管理', 'organization', 0, 'OfficeBuilding', '/organization', '', 'organization:view', 20, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(11, 10, '部门管理', 'organization:department', 1, 'OfficeBuilding', '/organization/department', '@/views/organization/Department.vue', 'organization:department:view', 1, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(12, 11, '新增部门', 'organization:department:add', 2, '', '', '', 'organization:department:add', 1, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(13, 11, '编辑部门', 'organization:department:edit', 2, '', '', '', 'organization:department:edit', 2, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(14, 11, '删除部门', 'organization:department:delete', 2, '', '', '', 'organization:department:delete', 3, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(15, 11, '部门详情', 'organization:department:detail', 2, '', '', '', 'organization:department:detail', 4, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(16, 11, '部门树形结构', 'organization:department:tree', 2, '', '', '', 'organization:department:tree', 5, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(20, 10, '用户管理', 'organization:user', 1, 'User', '/organization/user', '@/views/organization/UserSimple.vue', 'organization:user:view', 2, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(21, 20, '新增用户', 'organization:user:add', 2, '', '', '', 'organization:user:add', 1, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(22, 20, '编辑用户', 'organization:user:edit', 2, '', '', '', 'organization:user:edit', 2, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(23, 20, '删除用户', 'organization:user:delete', 2, '', '', '', 'organization:user:delete', 3, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(24, 20, '用户详情', 'organization:user:detail', 2, '', '', '', 'organization:user:detail', 4, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(25, 20, '重置密码', 'organization:user:reset-password', 2, '', '', '', 'organization:user:reset-password', 5, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(26, 20, '启用用户', 'organization:user:enable', 2, '', '', '', 'organization:user:enable', 6, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(27, 20, '禁用用户', 'organization:user:disable', 2, '', '', '', 'organization:user:disable', 7, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(28, 20, '分配角色', 'organization:user:assign-roles', 2, '', '', '', 'organization:user:assign-roles', 8, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(29, 20, '批量操作', 'organization:user:batch', 2, '', '', '', 'organization:user:batch', 9, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(30, 10, '角色管理', 'organization:role', 1, 'UserFilled', '/organization/role', '@/views/organization/Role.vue', 'organization:role:view', 3, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(31, 30, '新增角色', 'organization:role:add', 2, '', '', '', 'organization:role:add', 1, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(32, 30, '编辑角色', 'organization:role:edit', 2, '', '', '', 'organization:role:edit', 2, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(33, 30, '删除角色', 'organization:role:delete', 2, '', '', '', 'organization:role:delete', 3, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(34, 30, '角色详情', 'organization:role:detail', 2, '', '', '', 'organization:role:detail', 4, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(35, 30, '分配菜单权限', 'organization:role:assign-menus', 2, '', '', '', 'organization:role:assign-menus', 5, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(36, 30, '绑定用户', 'organization:role:assign-users', 2, '', '', '', 'organization:role:assign-users', 6, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(37, 30, '移除用户', 'organization:role:remove-users', 2, '', '', '', 'organization:role:remove-users', 7, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35'),
	(38, 30, '获取角色选项', 'organization:role:options', 2, '', '', '', 'organization:role:options', 8, 1, 1, '2025-07-01 10:35:35', '2025-07-01 10:35:35');

-- 导出  表 oa.smt_roles 结构
CREATE TABLE IF NOT EXISTS `smt_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1-启用，0-禁用',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='角色表';

-- 正在导出表  oa.smt_roles 的数据：~3 rows (大约)
DELETE FROM `smt_roles`;
INSERT INTO `smt_roles` (`id`, `name`, `code`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, '超级管理员', 'super_admin', '系统超级管理员，拥有全部权限', 1, '2025-06-30 07:27:37', '2025-07-01 02:52:51'),
	(2, '系统管理员', 'admin', '系统管理员，拥有大部分权限', 1, '2025-06-30 08:27:10', '2025-07-01 02:52:52'),
	(3, '普通用户', 'user', '普通用户，有基础访问权限', 1, '2025-07-01 02:51:33', '2025-07-01 02:52:52');

-- 导出  表 oa.smt_role_menus_rel 结构
CREATE TABLE IF NOT EXISTS `smt_role_menus_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `menu_id` int(11) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`) USING BTREE,
  KEY `idx_menu` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色-菜单关联表';

-- 正在导出表  oa.smt_role_menus_rel 的数据：~0 rows (大约)
DELETE FROM `smt_role_menus_rel`;
INSERT INTO `smt_role_menus_rel` (`id`, `role_id`, `menu_id`, `created_at`) VALUES
	(14, 2, 1, '2025-07-01 14:13:30'),
	(15, 2, 2, '2025-07-01 14:13:30'),
	(16, 2, 3, '2025-07-01 14:13:30'),
	(17, 2, 4, '2025-07-01 14:13:30'),
	(18, 2, 5, '2025-07-01 14:13:30'),
	(19, 2, 6, '2025-07-01 14:13:30'),
	(20, 2, 7, '2025-07-01 14:13:30'),
	(21, 2, 10, '2025-07-01 14:13:30'),
	(22, 2, 11, '2025-07-01 14:13:30'),
	(23, 2, 12, '2025-07-01 14:13:30'),
	(24, 2, 13, '2025-07-01 14:13:30'),
	(25, 2, 14, '2025-07-01 14:13:30'),
	(26, 2, 15, '2025-07-01 14:13:30'),
	(27, 2, 16, '2025-07-01 14:13:30'),
	(28, 2, 20, '2025-07-01 14:13:30'),
	(29, 2, 21, '2025-07-01 14:13:30'),
	(30, 2, 22, '2025-07-01 14:13:30'),
	(31, 2, 23, '2025-07-01 14:13:30'),
	(32, 2, 24, '2025-07-01 14:13:30'),
	(33, 2, 25, '2025-07-01 14:13:30'),
	(34, 2, 26, '2025-07-01 14:13:30'),
	(35, 2, 27, '2025-07-01 14:13:30'),
	(36, 2, 28, '2025-07-01 14:13:30'),
	(37, 2, 29, '2025-07-01 14:13:30'),
	(38, 2, 30, '2025-07-01 14:13:30'),
	(39, 2, 31, '2025-07-01 14:13:30'),
	(40, 2, 32, '2025-07-01 14:13:30'),
	(41, 2, 33, '2025-07-01 14:13:30'),
	(42, 2, 34, '2025-07-01 14:13:30'),
	(43, 2, 35, '2025-07-01 14:13:30'),
	(44, 2, 36, '2025-07-01 14:13:30'),
	(45, 2, 37, '2025-07-01 14:13:30'),
	(46, 2, 38, '2025-07-01 14:13:30'),
	(47, 1, 1, '2025-07-01 14:13:35'),
	(48, 1, 2, '2025-07-01 14:13:35'),
	(49, 1, 3, '2025-07-01 14:13:35'),
	(50, 1, 4, '2025-07-01 14:13:35'),
	(51, 1, 5, '2025-07-01 14:13:35'),
	(52, 1, 6, '2025-07-01 14:13:35'),
	(53, 1, 7, '2025-07-01 14:13:35'),
	(54, 1, 10, '2025-07-01 14:13:35'),
	(55, 1, 11, '2025-07-01 14:13:35'),
	(56, 1, 12, '2025-07-01 14:13:35'),
	(57, 1, 13, '2025-07-01 14:13:35'),
	(58, 1, 14, '2025-07-01 14:13:35'),
	(59, 1, 15, '2025-07-01 14:13:35'),
	(60, 1, 16, '2025-07-01 14:13:35'),
	(61, 1, 20, '2025-07-01 14:13:35'),
	(62, 1, 21, '2025-07-01 14:13:35'),
	(63, 1, 22, '2025-07-01 14:13:35'),
	(64, 1, 23, '2025-07-01 14:13:35'),
	(65, 1, 24, '2025-07-01 14:13:35'),
	(66, 1, 25, '2025-07-01 14:13:35'),
	(67, 1, 26, '2025-07-01 14:13:35'),
	(68, 1, 27, '2025-07-01 14:13:35'),
	(69, 1, 28, '2025-07-01 14:13:35'),
	(70, 1, 29, '2025-07-01 14:13:35'),
	(71, 1, 30, '2025-07-01 14:13:35'),
	(72, 1, 31, '2025-07-01 14:13:35'),
	(73, 1, 32, '2025-07-01 14:13:35'),
	(74, 1, 33, '2025-07-01 14:13:35'),
	(75, 1, 34, '2025-07-01 14:13:35'),
	(76, 1, 35, '2025-07-01 14:13:35'),
	(77, 1, 36, '2025-07-01 14:13:35'),
	(78, 1, 37, '2025-07-01 14:13:35'),
	(79, 1, 38, '2025-07-01 14:13:35'),
	(92, 3, 1, '2025-07-01 14:14:58'),
	(93, 3, 2, '2025-07-01 14:14:58'),
	(94, 3, 3, '2025-07-01 14:14:58'),
	(95, 3, 10, '2025-07-01 14:14:58'),
	(96, 3, 11, '2025-07-01 14:14:58'),
	(97, 3, 12, '2025-07-01 14:14:58'),
	(98, 3, 13, '2025-07-01 14:14:58'),
	(99, 3, 14, '2025-07-01 14:14:58'),
	(100, 3, 15, '2025-07-01 14:14:58'),
	(101, 3, 16, '2025-07-01 14:14:58'),
	(102, 3, 20, '2025-07-01 14:14:58');

-- 导出  表 oa.smt_users 结构
CREATE TABLE IF NOT EXISTS `smt_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `english_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '英文名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `department_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门ID',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '头像',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0=禁用,1=正常',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(45) DEFAULT NULL COMMENT '最后登录IP',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- 正在导出表  oa.smt_users 的数据：~9 rows (大约)
DELETE FROM `smt_users`;
INSERT INTO `smt_users` (`id`, `username`, `english_name`, `mobile`, `department_id`, `email`, `password`, `nickname`, `avatar`, `status`, `last_login_time`, `last_login_ip`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'superadmin', 'Super Admin', '13800000001', 0, 'admin@system.com', '$2y$10$uabJTNT74iVukiFXQ6hJh.8B9jYA85SM52L4OWR4GV1lqvIjx10qW', '132', '123', 1, '2025-07-01 14:20:43', '127.0.0.1', '2025-06-27 16:19:25', '2025-07-01 14:20:43', NULL),
	(2, 'testuser', 'Test User', '13800000002', 0, 'test@system.com', '$2y$10$UeES22T6JiZ5kFDD.s/0TOXiuG11QR8WCEsDC8Q69uVfy4eJyl.uK', '', '', 1, '2025-07-01 14:19:38', '127.0.0.1', '2025-07-01 10:52:52', '2025-07-01 14:19:39', NULL),
	(3, 'cs 3', 'css', '18236999999', 1, '164@qq.com', '', '4234', '', 1, NULL, NULL, '2025-06-30 15:05:26', '2025-07-01 14:03:08', NULL),
	(4, 'dd1', 'yami', '13800138000', 6, '', '', 'dd', '', 1, '2025-07-01 08:52:19', '127.0.0.1', '2025-06-30 16:16:02', '2025-07-01 14:02:55', NULL),
	(5, '222', 'pack', '18233333333', 0, '', '', '333', '', 1, NULL, NULL, '2025-06-30 16:34:31', '2025-07-01 09:20:50', NULL),
	(6, '3123', 'miko', '18236666666', 2, '12312@qq.com', '', '12321', '', 1, NULL, NULL, '2025-06-30 17:21:53', '2025-07-01 09:20:24', NULL),
	(7, '3123', 'nana', '18236666666', 0, '12312@qq.com', '', '12321', '', 1, NULL, NULL, '2025-06-30 17:21:53', '2025-07-01 09:20:30', NULL),
	(8, '34456', 'CCC', '18222222222', 8, '', '', '5667657', '', 1, NULL, NULL, '2025-06-30 18:26:49', '2025-07-01 09:20:12', NULL),
	(9, '344562', 'xixi', '18222222221', 8, '', '123456', '', '', 1, NULL, NULL, '2025-07-01 09:21:52', '2025-07-01 10:14:04', NULL);

-- 导出  表 oa.smt_user_roles_rel 结构
CREATE TABLE IF NOT EXISTS `smt_user_roles_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_role` (`role_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户-角色关联表';

-- 正在导出表  oa.smt_user_roles_rel 的数据：~18 rows (大约)
DELETE FROM `smt_user_roles_rel`;
INSERT INTO `smt_user_roles_rel` (`id`, `user_id`, `role_id`, `created_at`) VALUES
	(6, 1, 9, '2025-07-01 01:21:52'),
	(26, 1, 2, '2025-07-01 02:25:00'),
	(29, 5, 2, '2025-07-01 02:25:00'),
	(30, 6, 2, '2025-07-01 02:25:00'),
	(31, 7, 2, '2025-07-01 02:25:00'),
	(32, 8, 2, '2025-07-01 02:25:00'),
	(33, 9, 2, '2025-07-01 02:25:00'),
	(37, 5, 1, '2025-07-01 02:25:27'),
	(38, 6, 1, '2025-07-01 02:25:27'),
	(39, 7, 1, '2025-07-01 02:25:27'),
	(40, 8, 1, '2025-07-01 02:25:27'),
	(41, 9, 1, '2025-07-01 02:25:27'),
	(42, 1, 1, '2025-07-01 02:52:52'),
	(43, 2, 3, '2025-07-01 02:52:52'),
	(46, 4, 1, '2025-07-01 06:02:55'),
	(47, 4, 2, '2025-07-01 06:02:55'),
	(50, 3, 1, '2025-07-01 06:03:08'),
	(51, 3, 2, '2025-07-01 06:03:08');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

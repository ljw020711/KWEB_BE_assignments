CREATE TABLE `users` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` VARCHAR(50) NOT NULL,
	`user_password` VARCHAR(255) NOT NULL,
	`user_nickname` VARCHAR(50) NOT NULL,
	`profile_pic_link` VARCHAR(255) DEFAULT NULL,
	`profile_status_message` VARCHAR(255) DEFAULT NULL,
	`is_deleted` TINYINT(1) DEFAULT 0,
	`register_date` INT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`user_created_channel` INT NOT NULL,
	`channel_link` VARCHAR(255) NOT NULL,
	`max_users` INT(9) DEFAULT NULL,
	`is_deleted` TINYINT(1) DEFAULT 0,
	`channel_creation_date` INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_created_channel`)
	REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`chat_data` VARCHAR(255) NOT NULL,
	`chat_writer` INT NOT NULL,
	`chat_channel` INT NOT NULL,
	`chat_creation_date` INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`chat_writer`)
	REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`chat_channel`)
	REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`follower` INT NOT NULL,
	`followee` INT NOT NULL,
	`follow_date` INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`follower`)
	REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`followee`)
	REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_blocking` INT NOT NULL,
	`user_blocked` INT NOT NULL,
	`blocking_date` INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_blocking`)
	REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`user_blocked`)
	REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbrunet <guill@umebrunet.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/24 17:40:01 by gbrunet           #+#    #+#              #
#    Updated: 2024/03/24 18:02:30 by gbrunet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

_BLACK = \033[0;30m
_RED = \033[0;31m
_GREEN = \033[0;32m
_BLUE = \033[0;34m
_YELLOW = \033[0;33m
_PURPLE = \033[0;35m
_CYAN = \033[0;36m
_WHITE = \033[0;37m

_BOLD = \e[1m
_THIN = \e[2m

_END = \033[0m

.PHONY : all stop re clean

all:
	@echo "$(_GREEN)Building and running Inception...$(_END)"
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/mysql
	docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	@echo "$(_YELLOW)Stoping Inception...$(_END)"
	docker compose -f ./srcs/docker-compose.yml down

clean:
	@make stop --no-print-directory
	@echo "$(_YELLOW)Removing all unused containers, networks and volumes...$(_END)"
	docker system prune -f

re:
	@make clean --no-print-directory
	@make all --no-print-directory

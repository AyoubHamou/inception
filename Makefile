.PHONY: all down clean fclean re

all:
	mkdir -p ~/data/wordpress ~/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	docker system prune -a -f
	docker volume rm -f mariadb wordpress

fclean: clean
	sudo rm -rf ~/data/*

re: fclean all

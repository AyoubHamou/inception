.PHONY: all clean fclean re

all:
	mkdir -p ~/data/wordpress ~/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf ~/data/*

fclean:clean
	docker system prune -af

re: clean all

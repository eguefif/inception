NAME = inception

all: create_folder $(NAME)

$(NAME): create_folder
	cp ../inception-backup/srcs/.env ./srcs
	@cd srcs; \
	docker compose up -d

create_folder:
	@if [ ! -d "../data" ]; then\
		mkdir ../data;\
		mkdir ../data/mariadb;\
		mkdir ../data/wordpress;\
	fi

clean:
	@cd srcs; \
	docker compose down -v
	@cd srcs; \
	docker image prune
	@cd srcs; \
	docker volume prune --all --force

fclean:
	@cd srcs; \
	docker compose down -v
	docker system prune -a
	make re

re: clean
	@cd srcs; \
		docker compose up --build -d

.phony: all inception clean fclean re create_folder

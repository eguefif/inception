NAME = inception

all: create_folder $(NAME)

$(NAME):
	@cd srcs; \
	docker compose up -d

create_folder:
	@if [ ! -d "../data" ]; then\
		mkdir ../data;\
		mkdir ../data/mariadb;\
		mkdir ../data/wordpress;\
	fi

logs:
	docker ps -aqf "name=mariadb" | xargs docker logs

clean:
	@cd srcs; \
	docker image prune
	@cd srcs; \
	docker volume prune --all --force
	@cd srcs; \
	docker compose down -v
fclean:
	docker system prune -a

re: 
	@cd srcs; \
		docker compose down; \
		docker compose up --build -d

.phony: all inception clean fclean re create_folder

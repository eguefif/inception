NAME = inception

all: $(NAME)

$(NAME):
	@cd srcs; \
	docker compose up -d

clean:
	@cd srcs; \
	docker compose down

re:
	@cd srcs; \
		docker compose down; \
		docker compose up --build -d

.phony: all inception clean fclean re

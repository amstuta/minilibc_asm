/*
** tests.h for tests in /home/amstuta/rendu/MinilibC_ASM
**
** Made by arthur
** Login   <amstuta@epitech.net>
**
** Started on  Wed Mar 18 12:42:35 2015 arthur
** Last update Wed Mar 18 12:59:42 2015 arthur
*/

#ifndef TESTS_H_
# define TESTS_H_

# include <stdio.h>

# define GREEN		"\x1B[32m"
# define END		"\x1B[37m"
# define BOOL(a)	a == 0 ? "true" : "false"

size_t	strlen(const char *);
void	*memcpy(void *, const void *, size_t);
int	strcasecmp(const char *, const char *);
int	strncmp(const char *, const char *, size_t);
int	strcmp(const char *, const char *);
char	*strchr(const char *, int);
char	*strpbrk(const char *, const char *);
char	*strstr(const char *, const char *);
char	*rindex(const char *, int);
void	*memset(void *, int, size_t);
size_t	strcspn(const char *, const char *);

#endif

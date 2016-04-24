/*
** tests.c for tests in /home/amstuta/rendu/MinilibC_ASM
**
** Made by arthur
** Login   <amstuta@epitech.net>
**
** Started on  Wed Feb 25 19:54:34 2015 arthur
** Last update Wed Mar 18 12:55:13 2015 arthur
*/

#include "tests.h"

void	test_strlen()
{
  printf("%sTest strlen:%s\n", GREEN, END);
  printf("Len \"salut\": %d\n", strlen("salut"));
  printf("Len \"minilibc\": %d\n", strlen("minilibc"));
}

void	test_memcpy()
{
  char	str[6];
  
  printf("%sTest memcpy:%s\n", GREEN, END);
  memcpy(str, "salut", 5);
  printf("New chain: %s\n", str);
}

void	test_strcasecmp()
{
  printf("%sTest strcasecmp:%s\n", GREEN, END);
  printf("Compare \"salut\" - \"SaLUt\": %s\n", BOOL(strcasecmp("salut", "SaLUt")));
  printf("Compare \"salu\" - \"SaLUt\": %s\n", BOOL(strcasecmp("salu", "SaLUt")));
  printf("Compare \"salut\" - \"salut\": %s\n", BOOL(strcasecmp("salut", "salut")));
}

void	test_strchr()
{
  printf("%sTest strchr:%s\n", GREEN, END);
  printf("Search 'a' in \"salut\": %s\n", strchr("salut", 'a'));
  printf("Search 'z' in \"razor\": %s\n", strchr("razor", 'z'));
}

void	test_strcmp()
{
  printf("%sTest strcmp:%s\n", GREEN, END);
  printf("Compare \"salut\" - \"salut\": %s\n", BOOL(strcmp("salut", "salut")));
  printf("Compare \"salut\" - \"sAlut\": %s\n", BOOL(strcmp("salut", "sAlut")));
}

void	test_strncmp()
{
  printf("%sTest strncmp:%s\n", GREEN, END);
  printf("Compare \"salut\" - \"salut\" (5 chars): %s\n", BOOL(strncmp("salut", "salut", 5)));
  printf("Compare \"salut\" - \"salUt\" (3 chars): %s\n", BOOL(strncmp("salut", "salUt", 3)));
  printf("Compare \"salut\" - \"sAlut\" (5 chars): %s\n", BOOL(strncmp("salut", "sAlut", 5)));
}

void	test_strpbrk()
{
  printf("%sTest strpbrk:%s\n", GREEN, END);
  printf("Search \"lu\" in \"salut\": %s\n", strpbrk("salut", "lu"));
  printf("Search \"yag\" in \"voyage\": %s\n", strpbrk("voyage", "yag"));
}

void	test_strstr()
{
  printf("%sTest strstr:%s\n", GREEN, END);
  printf("Search \"lu\" in \"salut\": %s\n", strstr("salut", "lu"));
  printf("Search \"yag\" in \"voyage\": %s\n", strstr("voyage", "yag"));
}

void	test_rindex()
{
  printf("%sTest rindex:%s\n", GREEN, END);
  printf("Search 'l' in \"slalut\": %s\n", rindex("slalut", 'l'));
  printf("Search 'y' in \"voyagey\": %s\n", rindex("voyagey", 'y'));
}

void	test_memset()
{
  char	mem[128];
  char	*cpy;

  printf("%sTest memset:%s\n", GREEN, END);
  cpy = memset(mem, 'a', 128);
  mem[127] = 0;
  printf("Mem: %s\n", mem);
  printf("Cpy: %s\n", mem);
}

void	test_strcspn()
{
  char str[] = "fcba73";
  char keys[] = "1234567890";

  printf("%sTest strcspn:%s\n", GREEN, END);
  printf ("First number in \"%s\" is at position %d\n", str, strcspn(str,keys));
}

int	main()
{
  test_strlen();
  test_memcpy();
  test_strcasecmp();
  test_strchr();
  test_strcmp();
  test_strncmp();
  test_strpbrk();
  test_strstr();
  test_rindex();
  test_memset();
  test_strcspn();

  return (0);
}

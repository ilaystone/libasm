/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/23 13:38:31 by ikhadem           #+#    #+#             */
/*   Updated: 2021/03/24 11:39:00 by ikhadem          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

# define BUFF_SIZE 500

void    print_strlen_result(char *a)
{
    printf("string: \"%s\"\nft_strlen: %lu\tstrlen: %lu\n", a, ft_strlen(a), strlen(a));
}
void    test_strlen()
{
    print_strlen_result("");
    print_strlen_result("BON");
    print_strlen_result("bonjour");
    print_strlen_result("the\0hidden");
    print_strlen_result("Lorem ipsum dolor sit amet, consectetur adipiscing\
elit. Sed in malesuada purus. Etiam a scelerisque massa. Ut non euismod elit. Aliquam\
bibendum dolor mi, id fringilla tellus pulvinar eu. Fusce vel fermentum sem. Cras\
volutpat, eros eget rhoncus rhoncus, diam augue egestas dolor, vitae rutrum nisi\
felis sed purus. Mauris magna ex, mollis non suscipit eu, lacinia ac turpis. Phasellus\
ac tortor et lectus fermentum lobortis eu at mauris. Vestibulum sit amet posuere\
tortor, sit amet consequat amet.");
}

void    print_strcpy(char *str, char *buff)
{
    printf("\"%s\": %s\n", str, strcmp(str, buff) == 0 ? "True" : "false");
}

void    test_strcpy()
{
    char    s[BUFF_SIZE];
    print_strcpy("", ft_strcpy(s, ""));
    print_strcpy("BON", ft_strcpy(s, "BON"));
    print_strcpy("bonjour", ft_strcpy(s, "bonjour"));
    print_strcpy("the\0hidden", ft_strcpy(s, "the\0hidden"));
    print_strcpy("Lorem ipsum dolor sit amet, consectetur adipiscing\
elit. Sed in malesuada purus. Etiam a scelerisque massa. Ut non euismod elit. Aliquam\
bibendum dolor mi, id fringilla tellus pulvinar eu. Fusce vel fermentum sem. Cras\
volutpat, eros eget rhoncus rhoncus, diam augue egestas dolor, vitae rutrum nisi\
felis sed purus. Mauris magna ex, mollis non suscipit eu, lacinia ac turpis. Phasellus\
ac tortor et lectus fermentum lobortis eu at mauris. Vestibulum sit amet posuere\
tortor, sit amet consequat amet.", ft_strcpy(s, "Lorem ipsum dolor sit amet, consectetur adipiscing\
elit. Sed in malesuada purus. Etiam a scelerisque massa. Ut non euismod elit. Aliquam\
bibendum dolor mi, id fringilla tellus pulvinar eu. Fusce vel fermentum sem. Cras\
volutpat, eros eget rhoncus rhoncus, diam augue egestas dolor, vitae rutrum nisi\
felis sed purus. Mauris magna ex, mollis non suscipit eu, lacinia ac turpis. Phasellus\
ac tortor et lectus fermentum lobortis eu at mauris. Vestibulum sit amet posuere\
tortor, sit amet consequat amet."));
}

void    print_strcmp(char *s1, char *s2)
{
    printf("Expect: %d\tActual: %d\n", strcmp(s1, s2), ft_strcmp(s1, s2));
}

void    test_strcmp()
{
    print_strcmp("", "");
    print_strcmp("BON", "");
    print_strcmp("the\0hidden", "the\0hidden");
    print_strcmp("the\0hidden", "");
    print_strcmp("", "Bonjour");
    print_strcmp("111", "110");
}

void    test_write()
{
    ssize_t     a;
    a = ft_write(-1, "test", 5);
    printf("fd = -1, %zd, error: %s\n", a, strerror(errno));
    a = ft_write(STDOUT_FILENO, "test", 0);
    printf("fd = 1, %zd\n", a);
    a = ft_write(STDOUT_FILENO, "test", 5);
    printf("fd = 1, %zd\n", a);
}

void    test_read()
{
    ssize_t     a;
    int         fd;
    char        buf[BUFF_SIZE];

    fd = -1;
    a = ft_read(fd, buf, BUFF_SIZE);
    printf("fd = %d, %zd, error: %s\n", fd, a, strerror(errno));
    fd = open("test_case", O_RDONLY);
    a = ft_read(fd, buf, BUFF_SIZE);
    printf("fd = %d, %zd, str: %s\n", fd, a, buf);
}

void    print_strdup(char *str, char *buf)
{
    printf("%s ==> strcmp: %d\n", str, strcmp(str, buf));
}

void    test_strdup()
{
    char    *str;

    str = ft_strdup("");
    print_strdup("", str);
    free(str);
    str = ft_strdup("BON");
    print_strdup("BON", str);
    free(str);
    str = ft_strdup("bonjour");
    print_strdup("bonjour", str);
    free(str);
    str = ft_strdup("the\0hidden");
    print_strdup("the\0hidden", str);
    free(str);
    str = ft_strdup("Lorem ipsum dolor sit amet, consectetur adipiscing\
elit. Sed in malesuada purus. Etiam a scelerisque massa. Ut non euismod elit. Aliquam\
bibendum dolor mi, id fringilla tellus pulvinar eu. Fusce vel fermentum sem. Cras\
volutpat, eros eget rhoncus rhoncus, diam augue egestas dolor, vitae rutrum nisi\
felis sed purus. Mauris magna ex, mollis non suscipit eu, lacinia ac turpis. Phasellus\
ac tortor et lectus fermentum lobortis eu at mauris. Vestibulum sit amet posuere\
tortor, sit amet consequat amet.");
    print_strdup("Lorem ipsum dolor sit amet, consectetur adipiscing\
elit. Sed in malesuada purus. Etiam a scelerisque massa. Ut non euismod elit. Aliquam\
bibendum dolor mi, id fringilla tellus pulvinar eu. Fusce vel fermentum sem. Cras\
volutpat, eros eget rhoncus rhoncus, diam augue egestas dolor, vitae rutrum nisi\
felis sed purus. Mauris magna ex, mollis non suscipit eu, lacinia ac turpis. Phasellus\
ac tortor et lectus fermentum lobortis eu at mauris. Vestibulum sit amet posuere\
tortor, sit amet consequat amet.", str);
    free(str);
}

int     main(int argc, char **argv)
{
    if (argc == 2)
    {
        if (strcmp(argv[1], "strlen") == 0)
            test_strlen();
        if (strcmp(argv[1], "strcpy") == 0)
            test_strcpy();
        if (strcmp(argv[1], "strcmp") == 0)
            test_strcmp();
        if (strcmp(argv[1], "write") == 0)
            test_write();
        if (strcmp(argv[1], "read") == 0)
            test_read();
        if (strcmp(argv[1], "strdup") == 0)
            test_strdup();
    }
    else
        printf("ERROR: options are:\n\tstrlen\n\tstrcpy\n\tstrcmp\n\twrite\n\tread\n\tstrdup\n");
    return 0;
}
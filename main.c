/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/10 10:36:48 by ikhadem           #+#    #+#             */
/*   Updated: 2020/01/11 08:18:07 by ikhadem          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <fcntl.h>

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dst, char *src);
int		ft_strcmp(char *s1, char *s2);
char	*ft_strdup(char *str);
ssize_t	ft_write(int fd, const void *str, size_t nbyte);
ssize_t	ft_read(int fd, void *buf, size_t nbyte);
int		ft_atoi_base(char	*str);

int		main()
{
	printf("%d\n", ft_atoi_base("123"));
	return (0);
}
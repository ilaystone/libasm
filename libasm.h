/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/23 15:43:24 by ikhadem           #+#    #+#             */
/*   Updated: 2021/03/24 10:42:37 by ikhadem          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

#include <unistd.h>
#include <stdio.h>
#include <libc.h>
#include <string.h>
#include <errno.h>

typedef struct      s_list
{
    void            *data;
    struct s_list   *next;
}                   t_list;

size_t      ft_strlen(const char *str);
char        *ft_strcpy(char *buff, const char *str);
int         ft_strcmp(const char *s1, const char *s2);
ssize_t     ft_write(int fd, const void *buf, size_t count);
ssize_t     ft_read(int fd, const void *buf, size_t count);
char        *ft_strdup(const char *s1);
int         ft_atoi_base(const char *str, const char *base);
void        ft_list_push_front(t_list **begin_list, void *data);
size_t      ft_list_size(t_list *lst);
void        ft_list_sort(t_list **begin_list, int (*cmp)());
void		ft_list_remove_if(t_list **begin_list,
                                void *data_ref,
                                int (*cmp)(),
                                void (*free_fct)());

#endif
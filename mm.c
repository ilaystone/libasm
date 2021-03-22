/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   mm.c                                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/17 16:23:04 by ikhadem           #+#    #+#             */
/*   Updated: 2021/03/22 13:52:40 by ikhadem          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

typedef struct s_list
{
	void      *data;
	struct s_list *next;
} t_list;

void        ft_swap(void *a, void *b);
void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)());
void        ft_list_sort(t_list **begin_list, int (*cmp)());
// void ft_list_sort(t_list **begin_list, int (*cmp)())
// {
//     t_list      *ptr;
//     t_list      *ptr2;
//     void        *tmp;

//     ptr = *begin_list;
//     while (ptr)
//     {
//         ptr2 = *begin_list;
//         while (ptr2->next)
//         {
//             if ((cmp)(ptr2->next->data, ptr2->data) > 0)
//             {
//                 tmp = ptr2->data;
//                 ptr2->data = ptr2->next->data;
//                 ptr2->next->data = tmp;
//             }
//             ptr2 = ptr2->next;
//         }
//         ptr = ptr->next;
//     }
// }

int cmp(void* a, void* b)
{
	return *(int*)a - *(int*)b;
}

void        free_fct(void *a)
{
    free(a);
}

int     main()
{
    t_list  *a = (t_list *)malloc(sizeof(t_list));
    t_list  *b = (t_list *)malloc(sizeof(t_list));
    t_list  *c = (t_list *)malloc(sizeof(t_list));
    t_list  *d = (t_list *)malloc(sizeof(t_list));
    t_list  *e = (t_list *)malloc(sizeof(t_list));
    t_list  *f = (t_list *)malloc(sizeof(t_list));
    t_list  *g = (t_list *)malloc(sizeof(t_list));
    t_list  *h = (t_list *)malloc(sizeof(t_list));
    t_list  *i = (t_list *)malloc(sizeof(t_list));

    int     i1 = 98;
    int     i2 = 12;
    int     i4 = 45;
    int     i3 = 12;
    int     i5 = 1;
    int     i6 = -1;
    int     i7 = 232;
    int     i8 = 34;
    int     i9 = 32;

    a->data = &i1;
    b->data = &i2;
    c->data = &i3;
    d->data = &i4;
    e->data = &i5;
    f->data = &i6;
    g->data = &i7;
    h->data = &i8;
    i->data = &i9;
    a->next = b;
    b->next = c;
    c->next = d;
    d->next = e;
    e->next = f;
    f->next = g;
    g->next = h;
    h->next = i;
    i->next = NULL;
    ft_list_sort(&a, cmp);
    t_list  *tmp = a;
    while (tmp)
    {
        printf("%d\n", *(int*)tmp->data);
        free(tmp);
        tmp = tmp->next;
    }
    return 0;
}
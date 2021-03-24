/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/24 10:57:47 by ikhadem           #+#    #+#             */
/*   Updated: 2021/03/24 11:38:09 by ikhadem          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void        print_atoi(char *num, char *base)
{
    printf("num: \"%s\" in base: \"%s\" = %d\n",
                        num, base, ft_atoi_base(num, base));
}

void        test_atoi_base()
{
    print_atoi("", "");
    print_atoi("10", "");
    print_atoi("", "01");
    print_atoi("ffe0", "0123456789abcdef");
    print_atoi("-++++01++-+--ff", "01");
    print_atoi("10", "10");
    print_atoi("10", "+01");
    print_atoi("10", "01");
    print_atoi("     -10", "01");
}

void    print_lst(t_list *lst)
{
    t_list  *tmp;
    tmp = lst;
    while (tmp)
    {
        int     a = *((int*)tmp->data);
        printf("[%d]->", a);
        tmp = tmp->next;
    }
    printf("[null] || ");
    printf("size ==> %lu\n", ft_list_size(lst));
}

int     cmpar(void *a, void *b)
{
    return *(int*)a - *(int*)b;
}

void    free_fct(void *a)
{
    free(a);
}

void    test_push_front()
{
    t_list      *lst;
    lst = (t_list *)malloc(sizeof(t_list));
    lst = NULL;
    print_lst(lst);
    int     i0 = 0;
    ft_list_push_front(&lst, &i0);
    print_lst(lst);
    int     i1 = 1;
    ft_list_push_front(&lst, &i1);
    print_lst(lst);
    int     i2 = 2;
    ft_list_push_front(&lst, &i2);
    print_lst(lst);
    int     i3 = 3;
    ft_list_push_front(&lst, &i3);
    print_lst(lst);
    int     i9 = 9;
    ft_list_push_front(&lst, &i9);
    print_lst(lst);
    int     i5 = 5;
    ft_list_push_front(&lst, &i5);
    print_lst(lst);
    int     i4 = 4;
    ft_list_push_front(&lst, &i4);
    print_lst(lst);
    int     i10 = 10;
    ft_list_push_front(&lst, &i10);
    print_lst(lst);
    printf("\n\n");
    ft_list_sort(&lst, cmpar);
    printf("Sorted: ");
    print_lst(lst);
    printf("\n\n");
    ft_list_remove_if(&lst, &i9, cmpar, free_fct);
    printf("Removed %d: ", i9);
    print_lst(lst);
    ft_list_remove_if(&lst, &i10, cmpar, free_fct);
    printf("Removed %d: ", i10);
    print_lst(lst);
    ft_list_remove_if(&lst, &i0, cmpar, free_fct);
    printf("Removed %d: ", i0);
    print_lst(lst);
}


int     main(int argc, char **argv)
{
    if (argc == 2)
    {
        if (strcmp(argv[1], "atoi") == 0)
            test_atoi_base();
        if(strcmp(argv[1], "list") == 0)
            test_push_front();
    }
    else
        printf("ERROR: options are:\n\tatoi\n\tlist\n");
    return 0;
}
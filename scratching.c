/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   scratching.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/17 10:00:27 by ikhadem           #+#    #+#             */
/*   Updated: 2021/03/22 13:34:10 by ikhadem          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)())
{
	t_list		*current;
	t_list		*previous;

	previous = 0;
	current = *begin_list;
	while (current)
	{
		if ((cmp)(current->data, data_ref) == 0)
		{
			if (previous == 0)
            {
				*begin_list = current->next;
                free_fct(current);
                current = *begin_list;
            }
			else
            {
				previous->next = current->next;
                free_fct(current);
                current = previous->next;
            }
		}
        else
		{
            previous = current;
		    current = current->next;
        }
	}
}

t_list	*ft_list_sort(t_list *lst, int (*cmp)())
{
	void	*tempo;
	t_list	*overflow;

	overflow = lst;
	while (lst->next)
	{
		if (((*cmp)(lst->data, lst->next->data)) == 0)
		{
			tempo = lst->data;
			lst->data = lst->next->data;
			lst->next->data = tempo;
			lst = overflow;
		}
		else
			lst = lst->next;
	}
	lst = overflow;
	return (lst);
}

void	ft_list_sort(t_list **begin_list, int (*cmp)())
{
	t_list	*ptr;
	t_list	*ptr2;
	t_list	*next;

	ptr = *begin_list;
	while (ptr)
	{
		ptr2 = *begin_list;
		while (ptr2->next)
		{
			if ((*cmp)(ptr2->data, ptr2->next->data) > 0)
			{
				next = ptr2->data;
				ptr2->data = ptr2->next->data;
				ptr2->next->data = next;
			}
			ptr2 = ptr2->next;
		}
		ptr = ptr->next;
	}
}
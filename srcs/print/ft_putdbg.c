/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putdbg.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thdelmas <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/09/30 17:48:21 by thdelmas          #+#    #+#             */
/*   Updated: 2019/09/30 17:49:52 by thdelmas         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putdbg(char *key, char *value)
{
	ft_putchar_fd('[', 2);
	ft_putstr_fd(key, 2);
	ft_putstr_fd("]-[", 2);
	ft_putstr_fd(value, 2);
	ft_putchar_fd(']', 2);
	ft_putchar_fd('\n', 2);
}

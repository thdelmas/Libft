/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strnequ.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: thdelmas <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/09 14:02:31 by thdelmas          #+#    #+#             */
/*   Updated: 2019/01/27 17:03:13 by thdelmas         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int		ft_strnequ(const char *s1, const char *s2, size_t n)
{
	size_t i;

	i = 0;
	if (!n || (!s1 && !s2))
		return (1);
	if (!s1 || !s2)
		return (0);
	while (i < n - 1 && s1[i] == s2[i] && s1[i])
		i++;
	return (s1[i] == s2[i]);
}
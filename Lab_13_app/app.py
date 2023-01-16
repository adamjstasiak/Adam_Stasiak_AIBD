def bubble_sort(lst:list):
    if isinstance(lst,list):
        n = len(lst)
        for i in range(n):
            for j in range(n-i-1):
                if lst[j] > lst[j+1]:
                    bufor = lst[j]
                    lst[j] = lst[j+1]
                    lst[j+1] = bufor
        return lst 
    else:
        return None          

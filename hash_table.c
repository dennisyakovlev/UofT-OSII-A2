typedef int table_key;

typedef struct hash_table_node
{
    short     M_used;
    table_key M_k;
    void*     M_data;
}
table_node;

typedef struct hash_table
{
    int         M_sz;
    table_node* M_arr;
}
table;

int table_need(int sz)
{
    return sizeof(table_node) * sz + sizeof(int);
}

void table_init(table* tbl, int sz, void* mem)
{
    tbl->M_sz  = sz;
    tbl->M_arr = mem;
    for (int i=0;i!=sz;++i) tbl->M_arr[i].M_used = 0;
}

void* table_lookup(table* tbl, table_key k)
{
    for (int i=0;i!=tbl->M_sz;++i)
    {
        if (tbl->M_arr[i].M_k == k && tbl->M_arr[i].M_used == 1) return M_arr[i].M_data;
    }
    return NULL;
}

void table_insert(table* tbl, table_key k, void* data)
{
    for (int i=0;i!=tbl->M_sz;++i)
    {
        if (tbl->M_arr[k].M_used == 0)
        {
            tbl->M_arr[k].M_key  = k;
            tbl->M_arr[k].M_data = data;
            return;
        }
    }
}

void* table_remove(table* tbl, table_key k)
{
    for (int i=0;i!=tbl->M_sz;++i)
    {
        if (tbl->M_arr[k].M_k == k && tbl->M_arr[i].M_used == 1)
        {
            tbl->M_arr[k].M_used = 0;
            return tbl->M_arr[k].M_data;
        }
    }
    return NULL;
}

void table_free()
{
}

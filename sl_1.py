from itertools import combinations
def write_dict(variable,path):
    ''' input: variable to write
       inout: name, string file name
        output: a txt named name.txt
    '''
    import json
    js = json.dumps(variable)   
    file = open('{}.txt'.format(path), 'w')  
    file.write(js)  
    file.close()  
#write_dict(all_paths_0,'all_paths_0')
def read_dict(name):
    ''' input: a txt name, filename to read
    '''
    file = open('ASCII/{}.txt'.format(name), 'r') 
    js = file.read()
    dic = json.loads(js)   
    return (dic)
    file.close() 

def extrat_begin(name1, name2):
    content = ''
    with open('ASCII/{}.txt'.format(name1), 'r+') as f:
        for i in range(6):
            if i < 5:
                content += (f.readline().strip() + '\n')
            else:
                content += f.readline().strip()
        f.close()
    with open('data/{}.txt'.format(name2), 'w') as f2:
        f2.write(content)
        f2.close()
    print('Generate header named %s.txt from layer %s'% (name2, name1))
# extrat_begin('confi_built', 'begin')

def add_begin(name):
    with open('data/begin.txt', 'r+') as f:
        content = f.read() 
        with open('data/{}.txt'.format(name), 'r+') as f:
            content0 = f.read() 
            f.seek(0, 0)
            f.write(content + '\n' + content0)
            f.close()
        f.close()
def get_comb(input_list,n):
    '''input: input_list, a list.
       input: n，an integer; the number of combinations.
       output: a list, the combinations of input_list.
    '''
    l1 = [[list(i) for i in combinations(input_list, j)] for j in range(1,n)]
    return l1

# if __name__ == '__main__':

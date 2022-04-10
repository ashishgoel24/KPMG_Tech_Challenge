nestedobject1 = {'a':{'b':{'c':'d'}}}
key1 = 'a/b/c'

nestedobject2 = {'x':{'y':{'z':'a'}}}
key2 = 'x/y/z'

def get_value_nested_object(nestedobject,key):
    nestedobject_value = nestedobject
    key_value = key.split('/')

    for i in key_value:
        nestedobject_value = nestedobject_value.get(i)
    return nestedobject_value

value1=get_value_nested_object(nestedobject1,key1)
value2=get_value_nested_object(nestedobject2,key2)

print(value1)
print(value2)
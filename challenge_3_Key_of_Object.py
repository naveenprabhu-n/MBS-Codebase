
#Simple code to take an object, a key and return the value associated with the key in the object

def key_value(object, key):
    all_keys = key.split('/')
    for each in all_keys:
        if each in object:
            object = object[each]
        else:
            print("object not found for the given key")
            return None
    print(object)

sample_obj={'a':{'b':{'c':'d'}}}
key= 'a/b/d'

key_value(sample_obj,key)

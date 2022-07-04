def foo(a, b, *args, c, d):
    print(a, b, c, d)

foo(100, 200, 300, 400, 500, c=1, d=2)
mylist = [1,2,3,4]
print(type(*mylist))
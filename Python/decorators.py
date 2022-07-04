import functools

def start_end_decorator(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        print("Start")
        result = func(*args, **kwargs)
        print("End")
        return result
        
    return wrapper
    
    
@start_end_decorator
def add5(x):
    return x + 5
    

result = add5(10)
print(result)

print(help(add5))
print(add5.__name__)


# Another Example
print("EXAMPLE 2")
def repeat(num_times):
    def decorator_repeat(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for _ in range(num_times):
                result = func(*args, **kwargs)
            return result
        return wrapper

    return decorator_repeat
    
@repeat(num_times=4)
def greet(name):
    print(f"Hello {name}")

greet("Hien")

def func(name1, name2):
    return name1 + " " + name2

print(func("Bonjour", "Hien"))
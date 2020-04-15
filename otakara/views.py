from django.shortcuts import render

def top(request):
    return render(request, 'otakara/top.html', {})

def new(request):
    return render(request, 'otakara/new.html', {})

def sw(request):
    return render(request, 'sw.js')
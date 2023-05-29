from django.core.files.storage import FileSystemStorage
from django.conf import settings
import os
from django.db import connection
from django.http import JsonResponse
from django.shortcuts import render
from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import make_password
from django.contrib.auth import logout
from roadapp.models import *

# Create your views here.
def index(request):
    return render(request,'index.html')
def sign_in_process(request):
    u=request.POST.get("username")
    p=request.POST.get("password")
    obj=authenticate(username=u,password=p)
    if obj is not None:
        if obj.is_superuser == 1:
            request.session['suname'] = u
            request.session['slogid'] = obj.id
            return redirect('/admin_home/')
        else:
          messages.add_message(request, messages.INFO, 'Invalid User.')
          return redirect('/index/')
    else:
        newp=p
        try:
            obj1=login.objects.get(username=u,password=newp)

            if obj1.Usertype=="Workshop":
                if(obj1.status=="Approved"):
                    request.session['wuname'] = u
                    request.session['slogid'] = obj1.login_id
                    return redirect('/workshop_home/')
                elif(obj1.status=="Not Approved"):
                  messages.add_message(request, messages.INFO, 'Waiting For Approval.')
                  return redirect('/index/')
                else:
                  messages.add_message(request, messages.INFO, 'Invalid User.')
                  return redirect('/index/')
            elif obj1.Usertype=="Worker":
                if(obj1.status=="Approved"):
                    request.session['wkuname'] = u
                    request.session['slogid'] = obj1.login_id
                    return redirect('/Worker/')
                elif(obj1.status=="Not Approved"):
                  messages.add_message(request, messages.INFO, 'Waiting For Approval.')
                  return redirect('/index/')
                else:
                  messages.add_message(request, messages.INFO, 'Invalid User.')
                  return redirect('/index/')
            elif  obj1.Usertype=="User":
                if(obj1.status=="Approved"):
                    request.session['uname'] = u
                    request.session['slogid'] = obj1.login_id
                    return redirect('/user_home/')
                elif(obj1.status=="Not Approved"):
                  messages.add_message(request, messages.INFO, 'Waiting For Approval.')
                  return redirect('/index/')
                else:
                  messages.add_message(request, messages.INFO, 'Invalid User.')
                  return redirect('/index/')

            else:
                 messages.add_message(request, messages.INFO, 'Invalid User.')
                 return redirect('/index/')
        except login.DoesNotExist:
         messages.add_message(request, messages.INFO, 'Invalid User.')
         return redirect('/index/')
def work_shop_registration(request):
     data1 = state.objects.all()
     return render(request,'workshop_registration.html',{'data':data1})
def display_district(request):
    state_id = request.GET.get("state_id")
    try:

        dist = district.objects.filter(state_id = state_id)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(dist.values('district_id', 'district')), safe = False)
def display_workshop(request):
    district_id = request.GET.get("district_id")
    try:
        logQuerry = login.objects.filter(status='Approved').only('login_id').all()
        dist = workshop.objects.filter(district_id = district_id,login_id__in=logQuerry)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(dist.values('login_id', 'Name', 'place')), safe = False)
def admin_home(request):
    if 'suname' in request.session:
     return render(request,'Master/index.html')
    else:
      return redirect('/index/')
def workshop_home(request):
    if 'wuname' in request.session:
     return render(request,'Workshop/index.html')
    else:
      return redirect('/index/')

    workshop
#User
def user_action(request):

    username=request.POST.get("username")
    data = {
       'username_exists':      login.objects.filter(username=username).exists(),
        'error':"Username Already Exist"
    }
    tbl1=login()
    if(data["username_exists"]==False):
        tbl1.username=request.POST.get("username")
        password=request.POST.get("password1")
        tbl1.password=password
        tbl1.Usertype="User"
        tbl1.status="Approved"
        tbl1.save()
        obj=login.objects.get(username=username,password=password)

        u=user()
        u.login_id = obj.login_id
        u.name=request.POST.get("name")
        u.phone_number =request.POST.get("phone")
        u.Email=request.POST.get("Email")
        u.Address=request.POST.get("address")
        u.place=request.POST.get("place")

        u.save()
        messages.add_message(request, messages.INFO, 'Registered successfully.')
        return redirect('/index/')
    else:
        messages.add_message(request, messages.INFO, 'Username already exist.. Try Again.')
        return redirect('/index/')


def save_workshop(request):
    username=request.POST.get("username")
    password=request.POST.get("password")
    data = {
       'username_exists':      login.objects.filter(username=username).exists(),
        'error':"Username Already Exist"
    }
    if(data["username_exists"]==False):

        tbl1=login()

        tbl1.username=request.POST.get("username")

        tbl1.password=password
        tbl1.Usertype="Workshop"
        tbl1.status="Not Approved"
        tbl1.save()
        obj=login.objects.get(username=username,password=password)

        u=workshop()
        u.login_id = obj.login_id
        u.Name=request.POST.get("name")
        u.address =request.POST.get("address")
        u.ownername=request.POST.get("ownername")
        u.email=request.POST.get("email")
        u.phone_number=request.POST.get("phone_number")
        u.district_id=request.POST.get("district")
        u.place=request.POST.get("place")

        u.save()
        messages.add_message(request, messages.INFO, 'Registered successfully.')
        return redirect('/work_shop_registration/')
    else:
        messages.add_message(request, messages.INFO, 'Username already exist.. Try Again.')
        return redirect('/work_shop_registration/')

def user_home(request):

    if 'uname' in request.session:

        return render(request,'user/index.html')
    else:
         return redirect('/index/')
def Worker(request):
 if 'wkuname' in request.session:
    uname=request.session['wkuname']
    return render(request,'Worker/index.html',{'uname':uname})
 else:
      return redirect('/index/')

def admin_home(request):
    if 'suname' in request.session:

     return render(request,'Master/index.html')
    else:
      return redirect('/index/')
def admin_logout(request):
    logout(request)
    return redirect('/index/')
def user_logout(request):
    logout(request)
    request.session.delete()
    return redirect('/index/')
# Approval
def approve_workshop(request):
   if 'suname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select p.*,s.state,d.district from  tbl_workshop as p inner join   tbl_district as d on p.district_id =d.district_id inner join tbl_state as s on d.state_id=s.state_id  where p.login_id in (select login_id from tbl_login where Usertype='workshop' and status='Not Approved')")
        data=cursor.fetchall()
        return render(request,'Master/approve_workshop.html',{'data':data})
   else:
       return redirect('/index/')
def approve(request,id):
    if 'suname' in request.session:
        tbl=login.objects.get(login_id=id)
        tbl.status="Approved"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/approve_workshop/')
    else:
       return redirect('/index/')
def reject(request,id):
    if 'suname' in request.session:
        tbl=login.objects.get(login_id=id)
        tbl.status="Rejected"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Rejected successfully.')
        return redirect('/approve_workshop/')
    else:
        return redirect('/login')

def workshop_list(request):
   if 'suname' in request.session:
            cursor=connection.cursor()
            cursor.execute("select p.*,s.state,d.district from  tbl_workshop as p inner join   tbl_district as d on p.district_id =d.district_id inner join tbl_state as s on d.state_id=s.state_id  where p.login_id in (select login_id from tbl_login where Usertype='workshop' and status='Approved')")
            data=cursor.fetchall()
            return render(request,'Master/approved_workshop.html',{'data':data})
   else:
        return redirect('/login')

def user_list(request):
   if 'suname' in request.session:
            cursor=connection.cursor()
            cursor.execute("select * from  tbl_user  where login_id in (select login_id from tbl_login where Usertype='user' and status='Approved')")
            data=cursor.fetchall()
            return render(request,'Master/approved_user.html',{'data':data})
   else:
        return redirect('/index/')

def check_username(request):
    username = request.GET.get("username")
    data = {
       'username_exists':      login.objects.filter(username=username).exists(),
        'error':"Username Already Exist"
    }
    if(data["username_exists"]==False):
        data["success"]="Available"

    return JsonResponse(data)
# ................Category...................

def save_category(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        tbl=category()
        tbl.category=request.POST.get("category")

        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/add_category/')
    else:
        return redirect('/index/')
def add_category(request):
 if 'suname' in request.session:
    id=request.session['slogid']
    data=category.objects.all()
    return render(request,'Master/add_category.html',{'data':data})
 else:
      return redirect('/index/')
def edit_category(request,id):
 if 'suname' in request.session:
    data=category.objects.get(category_id=id)
    return render(request,'Master/edit_category.html',{'data':data})
 else:
      return redirect('/index/')
def update_category(request,id):
 if 'suname' in request.session:
    tbl=category.objects.get(category_id=id)
    tbl.category=request.POST.get("category")
    tbl.save()
    messages.add_message(request, messages.INFO, 'Updated successfully.')
    return redirect('/add_category/')
 else:
      return redirect('/index/')
def delete_category(request,id):
 if 'suname' in request.session:
    tbl=category.objects.get(category_id=id)
    tbl.delete()
    messages.add_message(request, messages.INFO, 'Deleted successfully.')
    return redirect('/add_category/')
 else:
      return redirect('/index/')
 #...........End......................................


 # ................Sub Category...................

def save_sub_category(request):
    if 'suname' in request.session:

        tbl=sub_category()
        tbl.category_id=request.POST.get("category")
        tbl.sub_category=request.POST.get("sub_category")
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/add_sub_category/')
    else:
        return redirect('/index/')
def add_sub_category(request):
 if 'suname' in request.session:

    data=category.objects.all()
    cursor=connection.cursor()
    cursor.execute("select * from  tbl_sub_category as sc inner join   tbl_category as c on sc.category_id =c.category_id")
    data1=cursor.fetchall()
    return render(request,'Master/add_sub_category.html',{'data':data,'data1':data1})
 else:
      return redirect('/index/')
def edit_sub_category(request,id):
 if 'suname' in request.session:
    data=category.objects.all()
    cursor=connection.cursor()
    cursor.execute("select * from  tbl_sub_category as sc inner join   tbl_category as c on sc.category_id =c.category_id where sc.sub_category_id="+str(id))
    data1=cursor.fetchall()
    return render(request,'Master/edit_sub_category.html',{'data':data,'data1':data1})
 else:
      return redirect('/index/')
def update_sub_category(request,id):
 if 'suname' in request.session:
    tbl=sub_category.objects.get(sub_category_id=id)
    tbl.category_id=request.POST.get("category")
    tbl.sub_category=request.POST.get("sub_category")
    tbl.save()
    messages.add_message(request, messages.INFO, 'Updated successfully.')
    return redirect('/add_sub_category/')
 else:
      return redirect('/index/')
def delete_sub_category(request,id):
 if 'suname' in request.session:
    tbl=sub_category.objects.get(sub_category_id=id)
    tbl.delete()
    messages.add_message(request, messages.INFO, 'Deleted successfully.')
    return redirect('/add_sub_category/')
 else:
      return redirect('/index/')
 #...........End......................................

# ....................Product....................
def save_product(request):
    if 'suname' in request.session:
        tbl=product()
        tbl.sub_category_id=request.POST.get("sub_category")
        tbl.name=request.POST.get("product_name")
        tbl.description=request.POST.get("description")
        tbl.features=request.POST.get("features")
        tbl.quantity=request.POST.get("quantity")
        tbl.price=request.POST.get("price")

        image=request.FILES['image']
        split_tup = os.path.splitext(image.name)
        file_extension = split_tup[1]
        # folder path
        dir_path = settings.MEDIA_ROOT
        count = 0
        # Iterate directory
        for path in os.listdir(dir_path):
        # check if current path is a file
            if os.path.isfile(os.path.join(dir_path, path)):
                count += 1
        filecount=count+1
        filename=str(filecount)+"."+file_extension
        obj=FileSystemStorage()
        file=obj.save(filename,image)
        url1=obj.url(file)
        tbl.image=url1

        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/add_product/')
    else:
        return redirect('/index/')
def product_list(request):
    if 'suname' in request.session:
        id=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select p.*,cs.*,c.* from  tbl_product as p inner join  tbl_sub_category as cs on p.sub_category_id =cs.sub_category_id inner join   tbl_category as c on cs.category_id =c.category_id")
        data=cursor.fetchall()

        return render(request,'Master/product_list.html',{'data':data})
    else:
       return redirect('/index/')
def add_product(request):
 if 'suname' in request.session:

    data=category.objects.all()
    return render(request,'Master/add_product.html',{'data':data})
 else:
      return redirect('/index/')
def edit_product(request,id):
 if 'suname' in request.session:

    data1=category.objects.all()
    cursor=connection.cursor()
    cursor.execute("select p.*,cs.*,c.* from  tbl_product as p inner join  tbl_sub_category as cs on p.sub_category_id =cs.sub_category_id inner join   tbl_category as c on cs.category_id =c.category_id where product_id="+str(id))
    data=cursor.fetchall()
    return render(request,'Master/edit_product.html',{'data':data,'data1':data1})
 else:
      return redirect('/index/')
def update_product(request,id):
 if 'suname' in request.session:
        tbl=product.objects.get(product_id=id)
        if len(request.FILES) != 0:

            image=request.FILES['image']
            split_tup = os.path.splitext(image.name)
            file_extension = split_tup[1]
            # folder path
            dir_path = settings.MEDIA_ROOT
            count = 0
            # Iterate directory
            for path in os.listdir(dir_path):
            # check if current path is a file
                if os.path.isfile(os.path.join(dir_path, path)):
                    count += 1
            filecount=count+1
            filename=str(filecount)+"."+file_extension
            obj=FileSystemStorage()
            file=obj.save(filename,image)
            url1=obj.url(file)
            tbl.image=url1
        tbl.sub_category_id=request.POST.get("sub_category")
        tbl.name=request.POST.get("product_name")
        tbl.description=request.POST.get("description")
        tbl.features=request.POST.get("features")
        tbl.quantity=request.POST.get("quantity")
        tbl.price=request.POST.get("price")
        tbl.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/product_list/')
 else:
      return redirect('/index/')
def delete_product(request,id):
 if 'suname' in request.session:
    tbl=product.objects.get(product_id=id)
    tbl.delete()
    messages.add_message(request, messages.INFO, 'Deleted successfully.')
    return redirect('/product_list/')
 else:
      return redirect('/index/')


#  -----------------------Ajax-----------------
def display_sub_category(request):
    category_id = request.GET.get("category_id")
    try:

        dist = sub_category.objects.filter(category_id = category_id)
    except Exception:
        data=[]
        data['error_message'] = 'error'
        return JsonResponse(data)
    return JsonResponse(list(dist.values('sub_category_id', 'sub_category')), safe = False)

#  -----------------------Ajax-----------------


#  -----------------------Employee-----------------
def save_employee(request):
    if 'wuname' in request.session:
        username=request.POST.get("username")
        data = {
       'username_exists':      login.objects.filter(username=username).exists(),
        'error':"Username Already Exist"
        }
        if(data["username_exists"]==False):
            log_id=request.session['slogid']
            tbl1=login()
            username=request.POST.get("username")
            tbl1.username=request.POST.get("username")
            password=request.POST.get("password1")
            tbl1.password=password
            tbl1.Usertype="Worker"
            tbl1.status="Approved"
            tbl1.save()
            obj=login.objects.get(username=username,password=password)

            tbl=employee()
            tbl.login_id = obj.login_id
            tbl.firstename=request.POST.get("firstname")
            tbl.lastname=request.POST.get("lastname")
            tbl.address=request.POST.get("address")
            tbl.email_id=request.POST.get("email")
            tbl.dob=request.POST.get("dob")
            tbl.gender=request.POST.get("gender")
            tbl.phone_number=request.POST.get("phone_number")
            tbl.joining_date=request.POST.get("joining_date")
            tbl.qualification=request.POST.get("qualification")
            tbl.desingnation=request.POST.get("designation")
            tbl.workshop_login_id=log_id
            photo=request.FILES['photo']

            split_tup = os.path.splitext(photo.name)
            file_extension = split_tup[1]
            # folder path
            dir_path = settings.MEDIA_ROOT
            count = 0
            # Iterate directory
            for path in os.listdir(dir_path):
            # check if current path is a file
                if os.path.isfile(os.path.join(dir_path, path)):
                    count += 1
            filecount=count+1
            filename=str(filecount)+"."+file_extension
            obj=FileSystemStorage()
            file=obj.save(filename,photo)
            url1=obj.url(file)
            tbl.photo=url1
            tbl.save()
            messages.add_message(request, messages.INFO, 'Added successfully.')
            return redirect('/add_employee/')
        else:
            messages.add_message(request, messages.INFO, 'Failed .. Username already exist.')
            return redirect('/add_employee/')
    else:
        return redirect('/index/')

def add_employee(request):
 if 'wuname' in request.session:

    # data=employee.objects.filter(p_login_id=id)
    return render(request,'Workshop/employee.html')
 else:
      return redirect('/index/')

def Employee_list(request):
 if 'wuname' in request.session:
    log_id=request.session['slogid']
    data=employee.objects.filter(workshop_login_id=log_id)
    return render(request,'Workshop/Employee_list.html',{'data':data})
 else:
      return redirect('/index/')

def delete_employee(request,id):
 if 'wuname' in request.session:
    tbl=employee.objects.get(employee_id=id)
    tbl.delete()
    messages.add_message(request, messages.INFO, 'Deleted successfully.')
    return redirect('/employee_list/')
 else:
      return redirect('/index/')

def edit_employee(request,id):
 if 'wuname' in request.session:


    data=employee.objects.get(employee_id=id)
    return render(request,'Workshop/edit_employee.html',{'data':data})
 else:
      return redirect('/index/')
def update_employee(request,id):
    if 'wuname' in request.session:
        tbl=employee.objects.get(employee_id=id)
        if len(request.FILES) != 0:

            photo=request.FILES['photo']
            split_tup = os.path.splitext(photo.name)
            file_extension = split_tup[1]
            # folder path
            dir_path = settings.MEDIA_ROOT
            count = 0
            # Iterate directory
            for path in os.listdir(dir_path):
            # check if current path is a file
                if os.path.isfile(os.path.join(dir_path, path)):
                    count += 1
            filecount=count+1
            filename=str(filecount)+"."+file_extension
            obj=FileSystemStorage()
            file=obj.save(filename,photo)
            url1=obj.url(file)
            tbl.photo=url1
        tbl.firstename=request.POST.get("firstname")
        tbl.lastname=request.POST.get("lastname")
        tbl.address=request.POST.get("address")
        tbl.email_id=request.POST.get("email")
        tbl.dob=request.POST.get("dob")
        tbl.gender=request.POST.get("gender")
        tbl.phone_number=request.POST.get("phone_number")
        tbl.joining_date=request.POST.get("joining_date")
        tbl.qualification=request.POST.get("qualification")
        tbl.desingnation=request.POST.get("designation")

        tbl.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/employee_list')
    else:
      return redirect('/index/')

# ..................Product View user--------------------



def product_list_cust(request):
    if 'uname' in request.session:

        cursor=connection.cursor()
        cursor.execute("select p.*,cs.*,c.* from  tbl_product as p inner join  tbl_sub_category as cs on p.sub_category_id =cs.sub_category_id inner join   tbl_category as c on cs.category_id =c.category_id")
        data=cursor.fetchall()

        return render(request,'user/product.html',{'data':data})
    else:
       return redirect('/index/')
def buy_now(request,id):
    if 'uname' in request.session:
        data=product.objects.get(product_id=id)
        return render(request,'user/buy_now.html',{'data':data})
    else:
      return redirect('/index/')
def payment(request,id):
    if 'uname' in request.session:

        quantity=request.POST.get("quantity")
        total=request.POST.get("tot_amount")
        product_id=id

        return render(request,'user/payment.html',{'id':product_id,'quantity':quantity,'total':total})
    else:
      return redirect('/index/')
def payment_action(request):
    if 'uname' in request.session:

        obj=order()
        obj.product_id=request.POST.get("product_id")
        obj.amount=request.POST.get("amount")
        obj.quantity=request.POST.get("quantity")
        obj.user_login_id=request.session['slogid']
        obj.status="Paid"
        obj.save()
        product_id=request.POST.get("product_id")
        tbl=product.objects.get(product_id=product_id)
        oldqty=tbl.quantity
        newqty=request.POST.get("quantity")
        qty=int(oldqty)-int(newqty)
        tbl.quantity=qty
        tbl.save()
        messages.add_message(request, messages.INFO, 'Paid successfully.')
        return redirect('/product/')
    else:
        return redirect('/index/')
def Order_List(request):
    if 'uname' in request.session:
        logid=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select o.*,p.name,p.price,p.image from tbl_order as o inner join  tbl_product as p on p.product_id=o.product_id  where o.user_login_id="+str(logid))
        data=cursor.fetchall()

        return render(request,'user/Order_List.html',{'data':data})
    else:
       return redirect('/index/')
def profile(request):
     if 'uname' in request.session:
        id=request.session['slogid']
        data1 = user.objects.filter(login_id=id)
        return render(request,'user/profile.html',{'data1':data1})
     else:
       return redirect('/index/')

def change_password(request):
    if 'uname' in request.session:

        return render(request,'user/change_password.html')
    else:
       return redirect('/index/')
def update_password(request):
    if 'uname' in request.session:
        id=request.session['slogid']
        opass=request.POST.get("opassword")
        npass=request.POST.get("password")
        obj1=login.objects.filter(login_id=id,password=opass)
        if(obj1):
            tbl1=login.objects.get(login_id=id)
            tbl1.password=npass
            tbl1.save()
            messages.add_message(request, messages.INFO, 'Updated Please Login Using new Password.')
            return redirect('/index/')
        else:
            messages.add_message(request, messages.INFO, 'Invalid Data')
            return redirect('/change_password/')
    else:
       return redirect('/index/')
def save_complaint(request):
    if 'uname' in request.session:
        id=request.session['slogid']
        tbl=complaints()
        tbl.complaint=request.POST.get("complaint")
        tbl.user_login_id=id
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/complaint/')
    else:
       return redirect('/index/')
def Complaint_list(request):
    if 'uname' in request.session:
        id=request.session['slogid']
        data=complaints.objects.filter(user_login_id=id)
        return render(request,'user/complaint_list.html',{'data':data})
    else:
       return redirect('/index/')
def view_complaints(request):
    if 'suname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from  tbl_complaint  as c inner join  tbl_user as u  on c.user_login_id =u.login_id where c.reply='Nil'  order by c.complaint_id desc")
        data=cursor.fetchall()

        return render(request,'Master/view_complaints.html',{'data':data})
    else:
       return redirect('/index/')
def adm_reply_complaint(request,id):
    if 'suname' in request.session:

        return render(request,'Master/reply_complaint.html',{'id':id})
    else:
       return redirect('/index/')
def add_reply(request,id):
    tbl=complaints.objects.get(complaint_id=id)
    tbl.reply=request.POST.get("reply")
    tbl.save()
    return redirect('/replied_list/')
def replied_list(request):
    if 'suname' in request.session:
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from  tbl_complaint  as c inner join  tbl_user as u  on c.user_login_id =u.login_id where c.reply!='Nil' order by c.complaint_id desc")
        data=cursor.fetchall()
        return render(request,'Master/replied_complaints.html',{'data':data})
    else:
       return redirect('/index/')
def complaint(request):
    if 'uname' in request.session:

      return render(request,'user/complaint.html')
    else:
       return redirect('/index/')
def view_order_details(request):
    if 'suname' in request.session:
        logid=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select o.*,p.name,p.price,p.image,u.name,u.phone_number,u.Email,u.address,u.place from  tbl_order as o inner join   tbl_product as p on p.product_id =o.product_id inner join tbl_user as u  on o.user_login_id=u.login_id where  status='Paid' order by  o.entry_date")
        data=cursor.fetchall()
        return render(request,'Master/order_details.html',{'data':data})
    else:
      return redirect('/index/')
def deliver(request,id):
    if 'suname' in request.session:
        tbl=order.objects.get(order_id=id)
        tbl.status="Delivered"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Delivered successfully.')
        return redirect('/view_order_details/')
    else:
       return redirect('/index/')
def deliverd_list(request):
    if 'suname' in request.session:
        logid=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select o.*,p.name,p.price,p.image,u.name,u.phone_number,u.Email,u.address,u.place from  tbl_order as o inner join   tbl_product as p on p.product_id =o.product_id inner join tbl_user as u  on o.user_login_id=u.login_id where  status='Delivered' order by  o.entry_date")
        data=cursor.fetchall()
        return render(request,'Master/deliverd_list.html',{'data':data})
    else:
      return redirect('/index/')

# -------------------------Add_service_details-------------

def Add_service_details(request):
    if 'uname' in request.session:
        data1 = state.objects.all()
        return render(request,'user/Add_service_details.html',{'data':data1})
    else:
       return redirect('/index/')
def service_details_list(request):
    if 'uname' in request.session:
        logid=request.session['slogid']

        cursor=connection.cursor()
        sql="select c.*,w.* from  tbl_service  as c inner join  tbl_user as u  on c.user_login_id =u.login_id inner join tbl_workshop as w on c.workshop_login_id=w.login_id  where c.user_login_id="+str(logid)+" and c.status='Submitted'"
        cursor.execute(sql)
        data=cursor.fetchall()


        cursor=connection.cursor()
        cursor.execute("select c.*,acc.service_details,w.* from  tbl_service  as c inner join  tbl_user as u  on c.user_login_id =u.login_id inner join tbl_assign_service as acc on acc.service_request_id=c.service_request_id inner join tbl_workshop as w on c.workshop_login_id=w.login_id  where user_login_id="+str(logid))
        data1=cursor.fetchall()
        return render(request,'user/service_details_list.html',{'data':data,'data1':data1})
    else:
       return redirect('/index/')
def save_service(request):
    if 'uname' in request.session:
        id=request.session['slogid']
        tbl=service_request()
        tbl.type_of_service=request.POST.get("type_of_service")
        tbl.vehicle_brand=request.POST.get("vehicle_brand")
        tbl.vehicle_no=request.POST.get("vehicle_no")
        tbl.description=request.POST.get("description")
        tbl.date_of_completion=request.POST.get("date_completion")
        tbl.workshop_login_id=request.POST.get("workshop")
        tbl.user_login_id=id
        tbl.status="Submitted"
        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/Add_service_details/')
    else:
       return redirect('/index/')
def view_request_details(request):
    if 'wuname' in request.session:
        logid=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select c.*,u.* from tbl_service as c inner join  tbl_user as u  on c.user_login_id =u.login_id  	where c.status='Submitted' and c.workshop_login_id="+str(logid))
        data=cursor.fetchall()
        return render(request,'Workshop/view_request_details.html',{'data':data})
    else:
       return redirect('/index/')
def adm_view_request_details(request):
    if 'suname' in request.session:
        logid=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select c.*,u.*,e.*,acc.service_details from tbl_service as c inner join  tbl_user as u  on c.user_login_id =u.login_id inner join tbl_assign_service as acc on acc.service_request_id=c.service_request_id  inner join tbl_employee as e on  e.login_id= acc.employee_login_id 	where c.status!='Submitted'")
        data=cursor.fetchall()
        return render(request,'Master/view_service_assigned_details.html',{'data':data})
    else:
       return redirect('/index/')
def allot_to_worker(request,id):
    if 'wuname' in request.session:
        logid=request.session['slogid']
        data=employee.objects.filter(workshop_login_id=logid)
        return render(request,'Workshop/allot_to_worker.html',{'id':id,'data':data})
    else:
       return redirect('/index/')
def save_allot_service(request,id):
    if 'wuname' in request.session:
        logid=request.session['slogid']
        tbl=assign_service()
        tbl.employee_login_id=request.POST.get("worker")
        tbl.service_request_id=id
        tbl.status="Assigned"
        tbl.save()
        obj=service_request.objects.get(service_request_id=id)
        obj.status="Assigned"
        obj.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/view_request_details/')
    else:
       return redirect('/index/')
def alloted_details(request):
    if 'wuname' in request.session:
        logid=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select c.*,u.*,e.*,acc.service_details from tbl_service as c inner join  tbl_user as u  on c.user_login_id =u.login_id inner join tbl_assign_service as acc on acc.service_request_id=c.service_request_id  inner join tbl_employee as e on  e.login_id= acc.employee_login_id 	where c.status!='Submitted' and  c.workshop_login_id="+str(logid))
        data=cursor.fetchall()
        return render(request,'Workshop/view_service_assigned_details.html',{'data':data})
    else:
       return redirect('/index/')
def alloted_service(request):
    if 'wkuname' in request.session:
        id=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select c.*,u.*,acc.service_details from  tbl_service  as c inner join  tbl_user as u  on c.user_login_id =u.login_id inner join tbl_assign_service as acc on acc.service_request_id=c.service_request_id  inner join tbl_employee as e on  e.login_id= acc.employee_login_id 	where c.status!='Submitted' and employee_login_id="+str(id))
        data=cursor.fetchall()
        return render(request,'Worker/view_service_assigned_details.html',{'data':data})
    else:
       return redirect('/index/')

def Feedback_frm(request):
    if 'wkuname' in request.session:

        return render(request,'Worker/feedback.html')
    else:
       return redirect('/index')
def save_feedback(request):
     if 'wkuname' in request.session:
        id=request.session['slogid']

        b=request.POST.get("feedback")

        d="Nil"
        obj = feedback(feedback=b,reply=d,employee_login_id=id)
        obj.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/Feedback/')
     else:
       return redirect('/index/')
def Feedback_list(request):
    if 'wkuname' in request.session:
        id=request.session['slogid']
        data=feedback.objects.filter(employee_login_id=id)

        return render(request,'Worker/feedback_list.html',{'data1':data})
    else:
       return redirect('/index')
def delete_feedback(request,id):
    if 'wkuname' in request.session:
        tbl=feedback.objects.get(feedback_id=id)
        tbl.delete()
        messages.add_message(request, messages.INFO, 'Deleted successfully.')
        return redirect('/Feedback_list')
    else:
       return redirect('/index')

# ............Admin Feedback ................

def ad_Feedback(request):
    if 'wuname' in request.session:
        id=request.session['slogid']

        cursor=connection.cursor()
        cursor.execute("select f.*,u.* from tbl_feedback as f inner join  tbl_employee as u  on f.employee_login_id =u.login_id where f.reply='Nil' and u.workshop_login_id="+str(id))
        data=cursor.fetchall()
        return render(request,'Workshop/feedback.html',{'data1':data})
    else:
       return redirect('/index/')
def reply_feedback(request,id):
    if 'wuname' in request.session:
        return render(request,'Workshop/reply_feedback.html',{'id':id})
    else:
       return redirect('/index')
def save_reply_feedback(request,id):
    if 'wuname' in request.session:
        tbl=feedback.objects.get(feedback_id=id)
        tbl.reply=request.POST.get("reply")
        tbl.save()
        messages.add_message(request, messages.INFO, 'updated successfully.')
        return redirect('/ad_Feedback')
    else:
       return redirect('/index')
def ad_replied_feedback(request):
    if 'wuname' in request.session:

        id=request.session['slogid']
        cursor=connection.cursor()
        cursor.execute("select f.*,u.* from tbl_feedback as f inner join  tbl_employee as u  on f.employee_login_id =u.login_id where f.reply!='Nil' and u.workshop_login_id="+str(id))
        data=cursor.fetchall()
        return render(request,'Workshop/ad_replied_feedback.html',{'data1':data})
    else:
       return redirect('/index')


# --------------Meeting---------


def save_meeting(request):
    if 'suname' in request.session:

        tbl=meeting()
        tbl.title=request.POST.get("title")
        tbl.Cocunselor_name=request.POST.get("councillor_name")
        tbl.venue=request.POST.get("venue")
        tbl.subject=request.POST.get("subject")
        tbl.date=request.POST.get("date")

        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/add_meeting/')
    else:
        return redirect('/index/')
def add_meeting(request):
 if 'wuname' in request.session:

    return render(request,'Workshop/add_meeting.html')
 else:
      return redirect('/index/')

def view_meeting(request):
 if 'wuname' in request.session:

    data=meeting.objects.all()
    return render(request,'Workshop/view_meeting.html',{'data':data})
 else:
      return redirect('/index/')

def delete_meeting(request,id):
 if 'wuname' in request.session:
    tbl=meeting.objects.get(meeting_id=id)
    tbl.delete()
    messages.add_message(request, messages.INFO, 'Deleted successfully.')
    return redirect('/view_meeting/')
 else:
      return redirect('/index/')

def edit_meeting(request,id):
 if 'suname' in request.session:


    data=meeting.objects.get(meeting_id=id)
    return render(request,'Master/edit_meeting.html',{'data':data})
 else:
      return redirect('/index/')
def update_meeting(request,id):
    if 'suname' in request.session:
        tbl=meeting.objects.get(meeting_id=id)

        tbl.title=request.POST.get("title")
        tbl.Cocunselor_name=request.POST.get("councillor_name")
        tbl.venue=request.POST.get("venue")
        tbl.subject=request.POST.get("subject")
        tbl.date=request.POST.get("date")


        tbl.save()
        messages.add_message(request, messages.INFO, 'Updated successfully.')
        return redirect('/view_meeting')
    else:
      return redirect('/index/')


def worker_meeting(request):
 if 'suname' in request.session:

    data=meeting.objects.all()
    return render(request,'Worker/worker_meeting.html',{'data':data})
 else:
      return redirect('/index/')

def pay_amount(request,id):
 if 'wkuname' in request.session:


    return render(request,'Worker/add_amount.html',{'id':id})
 else:
      return redirect('/index/')


def save_service_charge(request,id):
    if 'wkuname' in request.session:
        logid=request.session['slogid']

        obj=service_request.objects.get(service_request_id=id)
        obj.status="Added Payment"
        obj.fee=request.POST.get("charge")
        obj.save()
        tbl=assign_service.objects.get(service_request_id=id)
        tbl.status="Added Payment"
        tbl.service_details=request.POST.get("description")

        tbl.save()
        messages.add_message(request, messages.INFO, 'Added successfully.')
        return redirect('/alloted_service/')
    else:
       return redirect('/index/')
def make_payment_service(request,id):
    if 'uname' in request.session:
            obj=service_request.objects.get(service_request_id=id)
            amount= obj.fee


            return render(request,'user/make_payment_service.html',{'id':id,'amount':amount})
    else:
        return redirect('/index/')
def pay_action(request,id):
    if 'uname' in request.session:
        logid=request.session['slogid']

        obj=service_request.objects.get(service_request_id=id)
        obj.status="Paid"
        obj.save()

        messages.add_message(request, messages.INFO, 'Paid successfully.')
        return redirect('/service_details_list/')
    else:
       return redirect('/index/')

# ..................Product View user--------------------



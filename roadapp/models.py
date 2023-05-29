from datetime import datetime
from django.db import models

# Create your models here.
class login(models.Model):
    login_id=models.AutoField(primary_key=True)
    username=models.CharField(max_length=50)
    password=models.TextField(null=True)
    Usertype=models.CharField(max_length=50)
    status=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_login'
class user(models.Model):
    user_id=models.AutoField(primary_key=True)
    login_id=models.IntegerField()
    name=models.CharField(max_length=50, null=True)
    phone_number=models.BigIntegerField(null=True)
    Email=models.CharField(max_length=50)
    Address=models.TextField()
    place=models.CharField(max_length=50, null=True)
    class Meta:
        db_table='tbl_user'
class category(models.Model):
    category_id=models.AutoField(primary_key=True)
    category=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_category'
class sub_category(models.Model):
    sub_category_id=models.AutoField(primary_key=True)
    category_id=models.IntegerField()
    sub_category=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_sub_category'
class product(models.Model):
    product_id=models.AutoField(primary_key=True)
    sub_category_id=models.IntegerField()
    name=models.CharField(max_length=50)
    description=models.TextField()
    features=models.TextField()
    price=models.DecimalField(max_digits=7, decimal_places=2, blank=True, null=True)
    quantity=models.IntegerField()
    date=models.DateTimeField(default=datetime.now, blank=True)
    image=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_product'
class employee(models.Model):
    employee_id=models.AutoField(primary_key=True)
    firstename=models.CharField(max_length=50)
    lastname=models.CharField(max_length=50)
    address=models.TextField()
    email_id=models.CharField(max_length=50)
    joining_date=models.DateField()
    dob=models.DateField()
    gender=models.CharField(max_length=50)
    qualification=models.CharField(max_length=50)
    phone_number=models.BigIntegerField(null=True)
    photo=models.CharField(max_length=50)
    desingnation=models.CharField(max_length=50)
    login_id=models.IntegerField()
    workshop_login_id=models.IntegerField()

    class Meta:
        db_table='tbl_employee'
class order(models.Model):
    order_id=models.AutoField(primary_key=True)
    product_id=models.IntegerField()
    amount=models.DecimalField(max_digits=7, decimal_places=2, blank=True, null=True)
    quantity=models.IntegerField()
    status=models.CharField(max_length=50)
    entry_date=models.DateTimeField(default=datetime.now, blank=True)
    user_login_id=models.IntegerField()

    class Meta:
        db_table='tbl_order'
class complaints(models.Model):
    complaint_id=models.AutoField(primary_key=True)
    complaint=models.CharField(max_length=50)
    reply=models.CharField(max_length=50,default='Nil')
    user_login_id=models.IntegerField()


    class Meta:
        db_table='tbl_complaint'
class service_request(models.Model):
    service_request_id=models.AutoField(primary_key=True)
    type_of_service=models.CharField(max_length=50)
    description=models.TextField()
    vehicle_brand=models.CharField(max_length=50)
    vehicle_no=models.CharField(max_length=50)
    date_of_completion=models.DateField()
    status=models.CharField(max_length=50)
    user_login_id=models.IntegerField()
    entry_date=models.DateTimeField(default=datetime.now, blank=True)
    fee=models.DecimalField(max_digits=15, decimal_places=2, blank=True, null=True)
    workshop_login_id=models.IntegerField()
    class Meta:
        db_table='tbl_service'
class assign_service(models.Model):
    assign_service_id=models.AutoField(primary_key=True)
    service_request_id=models.IntegerField()
    employee_login_id=models.IntegerField()
    status=models.CharField(max_length=50)
    service_details=models.TextField(null=True, blank=True)


    class Meta:
        db_table='tbl_assign_service'
class feedback(models.Model):
    feedback_id=models.AutoField(primary_key=True)
    feedback=models.CharField(max_length=50)
    reply=models.CharField(max_length=50,default='Nil')
    employee_login_id=models.IntegerField()


    class Meta:
        db_table='tbl_feedback'



# class meeting(models.Model):
#     meeting_id=models.AutoField(primary_key=True)
#     title=models.CharField(max_length=50)
#     Cocunselor_name =models.CharField(max_length=50)
#     venue =models.CharField(max_length=50)
#     subject=models.CharField(max_length=50)
#     date=models.DateField()
#     workshop_login_id=models.IntegerField()
#     class Meta:
#         db_table='tbl_meeting'
class state(models.Model):
    state_id=models.AutoField(primary_key=True)
    country_id=models.IntegerField()
    state=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_state'

class district(models.Model):
    district_id=models.AutoField(primary_key=True)
    state_id=models.IntegerField()
    district=models.CharField(max_length=50)
    class Meta:
        db_table='tbl_district'

class workshop(models.Model):
    workshop_id=models.AutoField(primary_key=True)
    login_id=models.IntegerField()
    Name=models.CharField(max_length=50, null=True)
    address=models.CharField(max_length=50, null=True)
    ownername=models.CharField(max_length=50)
    email=models.CharField(max_length=50)
    phone_number=models.BigIntegerField(null=True)
    district_id=models.IntegerField()
    place=models.CharField(max_length=50)

    class Meta:
        db_table='tbl_workshop'

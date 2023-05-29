"""Safety_Equipment URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from roadapp import views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
path('admin/', admin.site.urls),
path('',views.index),
path('index/',views.index),
path('login_action/', views.sign_in_process),
path('user_action/', views.user_action),
path('user_home/', views.user_home),
path('admin_home/', views.admin_home),
path('workshop_home/', views.workshop_home),

path('admin_logout/', views.admin_logout),
path('check_username/', views.check_username, name='check_username'),
path('display_district/', views.display_district, name='display_district'),
path('display_workshop/', views.display_workshop, name='display_workshop'),
path('save_workshop/', views.save_workshop),

path('work_shop_registration/', views.work_shop_registration),
path('approve_workshop/', views.approve_workshop),
path('approve/<int:id>', views.approve),
path('reject/<int:id>', views.reject),
path('workshop_list/', views.workshop_list),

# ..............................................
path('add_category/', views.add_category),
path('save_category/', views.save_category),
path('edit_category/<int:id>', views.edit_category),
path('update_category/<int:id>', views.update_category),
path('delete_category/<int:id>', views.delete_category),

# ..............................................

path('add_sub_category/', views.add_sub_category),
path('save_sub_category/', views.save_sub_category),
path('edit_sub_category/<int:id>', views.edit_sub_category),
path('update_sub_category/<int:id>', views.update_sub_category),
path('delete_sub_category/<int:id>', views.delete_sub_category),

# ..............................................

# ..............................................

path('add_product/', views.add_product),
path('save_product/', views.save_product),
path('edit_product/<int:id>', views.edit_product),
path('update_product/<int:id>', views.update_product),
path('delete_product/<int:id>', views.delete_product),
path('display_sub_category/', views.display_sub_category, name='display_sub_category'),
path('product_list/', views.product_list),
# ..............................................

path('add_employee/', views.add_employee),
path('save_employee/', views.save_employee),
path('employee_list/', views.Employee_list),
path('delete_employee/<int:id>', views.delete_employee),
path('edit_employee/<int:id>', views.edit_employee),
path('update_employee/<int:id>', views.update_employee),

# ..............................................

path('user_list/', views.user_list),
#-------------------------
path('product/', views.product_list_cust),
path('buy_now/<int:id>', views.buy_now),
path('payment/<int:id>', views.payment),
path('payment_action/', views.payment_action),


#----------------Order----------------
path('Order_List/', views.Order_List),
path('view_order_details/', views.view_order_details),
path('deliver/<int:id>', views.deliver),
path('deliverd_list/', views.deliverd_list),

#----------------Accounts----------------
path('profile/', views.profile),
path('change_password/', views.change_password),
path('update_password/', views.update_password),

#.............Complaint--------------

path('view_complaints/',views.view_complaints),
path('adm_reply_complaint/<int:id>', views.adm_reply_complaint),
path('add_reply/<int:id>', views.add_reply),
path('replied_list/', views.replied_list),
path('complaint/',views.complaint),
path('save_complaint/',views.save_complaint),
path('Complaint_list/',views.Complaint_list),


# -----------------service Details--------------
path('Add_service_details/',views.Add_service_details),
path('service_details_list/',views.service_details_list),
path('save_service/',views.save_service),
path('view_request_details/',views.view_request_details),
path('allot_to_worker/<int:id>',views.allot_to_worker),
path('save_allot_service/<int:id>',views.save_allot_service),
path('alloted_details/',views.alloted_details),

path('adm_view_request_details/',views.adm_view_request_details),

# .............................................
path('Worker/', views.Worker),
path('alloted_service/', views.alloted_service),

# -------------Feedback------------
path('Feedback/', views.Feedback_frm),
path('save_feedback/', views.save_feedback),
path('Feedback_list/', views.Feedback_list),
path('delete_feedback/<int:id>', views.delete_feedback),

#Employee ad_Feedback
path('ad_Feedback/', views.ad_Feedback),
path('reply_feedback/<int:id>', views.reply_feedback),
path('save_reply_feedback/<int:id>', views.save_reply_feedback),
path('ad_replied_feedback/', views.ad_replied_feedback),






# path('add_meeting/', views.add_meeting),
# path('save_meeting/', views.save_meeting),
# path('view_meeting/', views.view_meeting),
# path('delete_meeting/<int:id>', views.delete_meeting),
# path('edit_meeting/<int:id>', views.edit_meeting),
# path('update_meeting/<int:id>', views.update_meeting),

path('pay_amount/<int:id>', views.pay_amount),
path('save_service_charge/<int:id>', views.save_service_charge),
path('make_payment_service/<int:id>', views.make_payment_service),
path('pay_action/<int:id>', views.pay_action),

path('worker_meeting/', views.worker_meeting),

# -------------Logout------------
path('user_logout/', views.user_logout),
]
if settings.DEBUG:
    urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
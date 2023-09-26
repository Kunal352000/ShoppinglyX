FROM python:3
RUN pip install django==3.1.5
RUN pip install Pillow==8.1.0
RUN pip install pytz==2020.5
RUN pip install asgiref==3.3.1
RUN pip install pytz==2020.5
RUN pip install sqlparse==0.4.1
COPY . .
RUN python manage.py migrate 
EXPOSE 8000
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
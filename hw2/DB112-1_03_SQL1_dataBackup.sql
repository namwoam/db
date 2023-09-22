PGDMP     ,    (                {            DB112-1    15.4    15.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16487    DB112-1    DATABASE     �   CREATE DATABASE "DB112-1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Traditional)_Taiwan.950';
    DROP DATABASE "DB112-1";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16492 
   department    TABLE     �   CREATE TABLE public.department (
    dname character varying(50),
    dnumber integer NOT NULL,
    mgr_ssn character(9),
    mgr_start_date date
);
    DROP TABLE public.department;
       public         heap    postgres    false    4            �            1259    16495 	   dependent    TABLE     �   CREATE TABLE public.dependent (
    essn character(9) NOT NULL,
    dependent_name character varying(100),
    sex character(1),
    bdate date,
    relationship character varying(100)
);
    DROP TABLE public.dependent;
       public         heap    postgres    false    4            �            1259    16498    dept_locations    TABLE     s   CREATE TABLE public.dept_locations (
    dnumber integer NOT NULL,
    dlocation character varying(50) NOT NULL
);
 "   DROP TABLE public.dept_locations;
       public         heap    postgres    false    4            �            1259    16501    employee    TABLE     +  CREATE TABLE public.employee (
    fname character varying(50),
    minit character(1),
    lname character varying(50),
    ssn character(9) NOT NULL,
    bdate date,
    address character varying(255),
    sex character(1),
    salary numeric(10,2),
    super_ssn character(9),
    dno integer
);
    DROP TABLE public.employee;
       public         heap    postgres    false    4            �            1259    16504    project    TABLE     �   CREATE TABLE public.project (
    pname character varying(50),
    pnumber integer NOT NULL,
    plocation character varying(50),
    dnum integer
);
    DROP TABLE public.project;
       public         heap    postgres    false    4            �            1259    16507    works_on    TABLE     s   CREATE TABLE public.works_on (
    essn character(9) NOT NULL,
    pno integer NOT NULL,
    hours numeric(5,1)
);
    DROP TABLE public.works_on;
       public         heap    postgres    false    4                      0    16492 
   department 
   TABLE DATA           M   COPY public.department (dname, dnumber, mgr_ssn, mgr_start_date) FROM stdin;
    public          postgres    false    214                    0    16495 	   dependent 
   TABLE DATA           S   COPY public.dependent (essn, dependent_name, sex, bdate, relationship) FROM stdin;
    public          postgres    false    215   �                 0    16498    dept_locations 
   TABLE DATA           <   COPY public.dept_locations (dnumber, dlocation) FROM stdin;
    public          postgres    false    216   =                 0    16501    employee 
   TABLE DATA           i   COPY public.employee (fname, minit, lname, ssn, bdate, address, sex, salary, super_ssn, dno) FROM stdin;
    public          postgres    false    217   �                 0    16504    project 
   TABLE DATA           B   COPY public.project (pname, pnumber, plocation, dnum) FROM stdin;
    public          postgres    false    218                    0    16507    works_on 
   TABLE DATA           4   COPY public.works_on (essn, pno, hours) FROM stdin;
    public          postgres    false    219   �       y           2606    16511    department department_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dnumber);
 D   ALTER TABLE ONLY public.department DROP CONSTRAINT department_pkey;
       public            postgres    false    214            {           2606    16513 "   dept_locations dept_locations_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.dept_locations
    ADD CONSTRAINT dept_locations_pkey PRIMARY KEY (dnumber, dlocation);
 L   ALTER TABLE ONLY public.dept_locations DROP CONSTRAINT dept_locations_pkey;
       public            postgres    false    216    216            }           2606    16515    employee employee_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (ssn);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    217                       2606    16517    project projects_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.project
    ADD CONSTRAINT projects_pkey PRIMARY KEY (pnumber);
 ?   ALTER TABLE ONLY public.project DROP CONSTRAINT projects_pkey;
       public            postgres    false    218            �           2606    16519    works_on works_on_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.works_on
    ADD CONSTRAINT works_on_pkey PRIMARY KEY (pno, essn);
 @   ALTER TABLE ONLY public.works_on DROP CONSTRAINT works_on_pkey;
       public            postgres    false    219    219               d   x�5�1�  ��/�����B�D5�_/7^nM5���`���;@^D����9��ʵ���}�/�ck4�ʳ��K
�yCi�T ��S�"�ۀ�J�         �   x�M���0E��y��kKM���	G�!!� ����;��{����kN�r�P��|o'��K��F��*��B�s��>JP��0?Y�>s֐V����h��_��X����i+�GѤbT:Z�M�G��䚼RǾ{W5Om"]���rx�	!>L�?L         9   x�3���/-.���2�.ILK�/J�2�tJ��I�,J2�K��r�@�0�1z\\\ ,��         y  x�m��n!F�g����¥��Ʀ6Q�M�*U��6�^���U�ZuBB��o�����2D����kBH���[�(�)3��!Ӫ�[�:��*����@2�6c`���tKe�2,��|��Xk�)���e�r���<�z_���'fruaZSh%��l�c_>�f�,��_��Vr�4�䖓�O���υ�/X)��l�v���+]¨���H�&+�n)W`E�H"�n��E�/��P���lP1_zq]�K%��B*8(-8�������kdg�s+���-.5��W�R&hn�##ύ��1=VZm"ta���������1&�Wq�|�%
����&��[���fnEA9N��	F�H�<��p>���Y�� �$��         y   x�U��
�0��s�0�n���I��8��tj#Y���;�]���S��fgp��(*���PC_&�D�����&y����X�,.�*�B���E'��XW��ᑟ#g�fhV�u��o��1�         t   x�]���0�3�,�'��s�(�R˗<�B�1r��9��F�#"�*��:�c�z�n `�9_��}dΙ9*�^=�]��K����p��퇬S�OfF�ǯ_��o0�     
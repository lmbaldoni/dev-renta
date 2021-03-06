PGDMP         ,                u           product    9.6.2    9.6.2 �    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           1262    16397    product    DATABASE     �   CREATE DATABASE product WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE product;
             user1    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16611    rev_dimensions_b    TABLE       CREATE TABLE rev_dimensions_b (
    dimension_id integer NOT NULL,
    member_data_type_code character varying(30) NOT NULL,
    member_b_table_name character varying(30) NOT NULL,
    member_tl_table_name character varying(30),
    member_col character varying(30) NOT NULL,
    member_display_code_col character varying(30) NOT NULL,
    member_name_col character varying(30) NOT NULL,
    member_description_col character varying(30) NOT NULL,
    hierarchy_table_name character varying(30),
    attribute_table_name character varying(30),
    last_modified_by character varying(20) NOT NULL,
    last_modified_date date NOT NULL,
    created_by character varying(20) NOT NULL,
    creation_date date NOT NULL,
    definition_language character varying(4) NOT NULL,
    dimension_active_flag character varying(1) NOT NULL,
    dimension_type_code character varying(30) NOT NULL,
    simple_dimension_flag character varying(1) NOT NULL,
    user_defined_flag character varying(1) NOT NULL,
    write_flag character varying(1),
    dimension_editable_flag character(1) NOT NULL,
    key_dimension_flag character(1) NOT NULL,
    start_range integer,
    member_code_column character varying(30),
    table_type character varying(1),
    flattened_table_name character varying(30)
);
 $   DROP TABLE public.rev_dimensions_b;
       public         postgres    false    3            �            1259    16614    rev_dimensions_tl    TABLE     M  CREATE TABLE rev_dimensions_tl (
    dimension_id integer NOT NULL,
    dimension_name character varying(100) NOT NULL,
    description character varying(255),
    last_modified_by character varying(20) NOT NULL,
    last_modified_date date NOT NULL,
    created_by character varying(20) NOT NULL,
    creation_date date NOT NULL
);
 %   DROP TABLE public.rev_dimensions_tl;
       public         postgres    false    3            �            1259    16619 
   DIMENSIONS    VIEW     �  CREATE VIEW "DIMENSIONS" AS
 SELECT tl.dimension_id AS id,
    tl.dimension_name,
    b.member_b_table_name,
    b.member_tl_table_name,
    b.member_col,
    b.member_display_code_col,
    b.member_name_col,
    b.member_description_col,
    b.hierarchy_table_name,
    b.attribute_table_name,
    b.member_code_column
   FROM (rev_dimensions_b b
     JOIN rev_dimensions_tl tl ON ((b.dimension_id = tl.dimension_id)))
  WHERE ((b.simple_dimension_flag)::text = 'N'::text);
    DROP VIEW public."DIMENSIONS";
       public       postgres    false    213    212    212    212    212    212    212    212    212    212    212    212    213    3            �            1259    16596    members_attribute    TABLE     �   CREATE TABLE members_attribute (
    id integer NOT NULL,
    id_code integer NOT NULL,
    id_alfa character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(50) NOT NULL
);
 %   DROP TABLE public.members_attribute;
       public         postgres    false    3            �            1259    16594    DIM_ORG_UNIT_ATTR_id_seq    SEQUENCE     |   CREATE SEQUENCE "DIM_ORG_UNIT_ATTR_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."DIM_ORG_UNIT_ATTR_id_seq";
       public       postgres    false    3    209            �	           0    0    DIM_ORG_UNIT_ATTR_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE "DIM_ORG_UNIT_ATTR_id_seq" OWNED BY members_attribute.id;
            public       postgres    false    208            �            1259    16604    members_member    TABLE     �  CREATE TABLE members_member (
    id integer NOT NULL,
    id_code integer NOT NULL,
    id_alfa character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL,
    enabled boolean NOT NULL,
    if_lead boolean NOT NULL,
    create_date timestamp with time zone NOT NULL,
    create_by character varying(20) NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    modified_by character varying(20) NOT NULL
);
 "   DROP TABLE public.members_member;
       public         postgres    false    3            �            1259    16602    DIM_ORG_UNIT_B_id_seq    SEQUENCE     y   CREATE SEQUENCE "DIM_ORG_UNIT_B_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."DIM_ORG_UNIT_B_id_seq";
       public       postgres    false    3    211            �	           0    0    DIM_ORG_UNIT_B_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "DIM_ORG_UNIT_B_id_seq" OWNED BY members_member.id;
            public       postgres    false    210            �            1259    24598    DIM_PRODUCT_ATTR_id_seq    SEQUENCE     {   CREATE SEQUENCE "DIM_PRODUCT_ATTR_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."DIM_PRODUCT_ATTR_id_seq";
       public       postgres    false    3            �            1259    24606    DIM_PRODUCT_ATTR    TABLE       CREATE TABLE "DIM_PRODUCT_ATTR" (
    id integer DEFAULT nextval('"DIM_PRODUCT_ATTR_id_seq"'::regclass) NOT NULL,
    id_code integer NOT NULL,
    id_alfa character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(50) NOT NULL
);
 &   DROP TABLE public."DIM_PRODUCT_ATTR";
       public         postgres    false    215    3            �            1259    24612    DIM_product_B_id_seq    SEQUENCE     x   CREATE SEQUENCE "DIM_product_B_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."DIM_product_B_id_seq";
       public       postgres    false    3            �            1259    24617    DIM_PRODUCT_B    TABLE       CREATE TABLE "DIM_PRODUCT_B" (
    id integer DEFAULT nextval('"DIM_product_B_id_seq"'::regclass) NOT NULL,
    id_code integer NOT NULL,
    id_alfa character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL,
    enabled boolean NOT NULL,
    if_lead boolean NOT NULL,
    create_date timestamp with time zone NOT NULL,
    create_by character varying(20) NOT NULL,
    modified_date timestamp with time zone NOT NULL,
    modified_by character varying(20) NOT NULL
);
 #   DROP TABLE public."DIM_PRODUCT_B";
       public         postgres    false    217    3            �            1259    32792 
   SEG_FOLDER    TABLE     �   CREATE TABLE "SEG_FOLDER" (
    id numeric NOT NULL,
    "V_DSNID" character(25) NOT NULL,
    "V_SEGMENT_CODE" character(10),
    "V_SEGMENT_NAME" character(30),
    "V_SEGMENT_DESC" character(100)
);
     DROP TABLE public."SEG_FOLDER";
       public         postgres    false    3            �            1259    16432 
   auth_group    TABLE     ^   CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    16430    auth_group_id_seq    SEQUENCE     s   CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    193    3            �	           0    0    auth_group_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;
            public       postgres    false    192            �            1259    16442    auth_group_permissions    TABLE     �   CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    16440    auth_group_permissions_id_seq    SEQUENCE        CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    3    195            �	           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;
            public       postgres    false    194            �            1259    16424    auth_permission    TABLE     �   CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    16422    auth_permission_id_seq    SEQUENCE     x   CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    3    191            �	           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;
            public       postgres    false    190            �            1259    16450 	   auth_user    TABLE     �  CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false    3            �            1259    16460    auth_user_groups    TABLE     x   CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    3            �            1259    16458    auth_user_groups_id_seq    SEQUENCE     y   CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    3    199            �	           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;
            public       postgres    false    198            �            1259    16448    auth_user_id_seq    SEQUENCE     r   CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    3    197            �	           0    0    auth_user_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;
            public       postgres    false    196            �            1259    16468    auth_user_user_permissions    TABLE     �   CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    3            �            1259    16466 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    201    3            �	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;
            public       postgres    false    200            �            1259    16558    batchs_batch    TABLE     �  CREATE TABLE batchs_batch (
    id integer NOT NULL,
    "V_BATCH_ID" integer NOT NULL,
    "V_BATCH_DESCRIPTION" character varying(100) NOT NULL,
    "V_CREATED_BY" character varying(20) NOT NULL,
    "V_CREATED_DATE" timestamp with time zone NOT NULL,
    "V_LAST_MODIFIED_DATE" timestamp with time zone NOT NULL,
    "V_LAST_MODIFIED_BY" character varying(20) NOT NULL,
    "V_BATCH_TYPE" character varying(5) NOT NULL,
    "V_SRC_FRAMEWORK" character varying(5) NOT NULL,
    "V_DSN_NAME" character varying(50) NOT NULL,
    "V_IS_SEQUENTIAL" character varying(5) NOT NULL,
    highlighted text NOT NULL,
    owner_id integer NOT NULL
);
     DROP TABLE public.batchs_batch;
       public         postgres    false    3            �            1259    16556    batchs_batch_id_seq    SEQUENCE     u   CREATE SEQUENCE batchs_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.batchs_batch_id_seq;
       public       postgres    false    3    205            �	           0    0    batchs_batch_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE batchs_batch_id_seq OWNED BY batchs_batch.id;
            public       postgres    false    204            �            1259    16569    batchs_parameter    TABLE     )  CREATE TABLE batchs_parameter (
    id integer NOT NULL,
    "V_BATCH_ID" integer NOT NULL,
    "V_TASK_ID" character varying(20) NOT NULL,
    "I_PARAMETER_ORDER" integer NOT NULL,
    "V_PARAMETER_NAME" character varying(400) NOT NULL,
    "V_PARAMETER_VALUE" character varying(400) NOT NULL
);
 $   DROP TABLE public.batchs_parameter;
       public         postgres    false    3            �            1259    16567    batchs_parameter_id_seq    SEQUENCE     y   CREATE SEQUENCE batchs_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.batchs_parameter_id_seq;
       public       postgres    false    3    207            �	           0    0    batchs_parameter_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE batchs_parameter_id_seq OWNED BY batchs_parameter.id;
            public       postgres    false    206            �            1259    16528    django_admin_log    TABLE     �  CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    3            �            1259    16526    django_admin_log_id_seq    SEQUENCE     y   CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    3    203            �	           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;
            public       postgres    false    202            �            1259    16414    django_content_type    TABLE     �   CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    16412    django_content_type_id_seq    SEQUENCE     |   CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    189    3            �	           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;
            public       postgres    false    188            �            1259    16403    django_migrations    TABLE     �   CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    16401    django_migrations_id_seq    SEQUENCE     z   CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    3    187            �	           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;
            public       postgres    false    186            �            1259    32782    django_session    TABLE     �   CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    16398    prueba    TABLE     +   CREATE TABLE prueba (
    prueba "char"
);
    DROP TABLE public.prueba;
       public         postgres    false    3            �            1259    32800    rev_column_properties    TABLE     )  CREATE TABLE rev_column_properties (
    column_property_cd integer NOT NULL,
    property_column character varying(30),
    protected_flg smallint NOT NULL,
    table_name character varying(30) NOT NULL,
    column_name character varying(30) NOT NULL,
    owner character varying(30) NOT NULL
);
 )   DROP TABLE public.rev_column_properties;
       public         postgres    false    3            �            1259    32804    rev_column_property_cd    TABLE     �   CREATE TABLE rev_column_property_cd (
    column_property_cd integer NOT NULL,
    currency_basis_flg smallint NOT NULL,
    fe_ui_setup_flg smallint NOT NULL
);
 *   DROP TABLE public.rev_column_property_cd;
       public         postgres    false    3            �            1259    32808    rev_column_property_mls    TABLE     �   CREATE TABLE rev_column_property_mls (
    mls_cd character varying(10) NOT NULL,
    column_property_cd integer NOT NULL,
    column_property character varying(30) NOT NULL,
    description character varying(255)
);
 +   DROP TABLE public.rev_column_property_mls;
       public         postgres    false    3            �            1259    32812    rev_dim_attributes_tl    TABLE     �  CREATE TABLE rev_dim_attributes_tl (
    dimension_id bigint NOT NULL,
    attribute_id bigint NOT NULL,
    attribute_name character varying(80) NOT NULL,
    description character varying(255),
    last_modified_by character varying(20) NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    creation_date timestamp without time zone NOT NULL,
    language character varying(4) NOT NULL,
    source_lang character varying(10)
);
 )   DROP TABLE public.rev_dim_attributes_tl;
       public         postgres    false    3            �            1259    32828    rev_hier_definitions    TABLE     7  CREATE TABLE rev_hier_definitions (
    hierarchy_id bigint NOT NULL,
    flattened_rows_completion_code character varying(30),
    created_by character varying(30),
    creation_date timestamp without time zone,
    last_modified_by character varying(30),
    last_modified_date timestamp without time zone
);
 (   DROP TABLE public.rev_hier_definitions;
       public         postgres    false    3            �            1259    32815    rev_hierarchies    TABLE     �  CREATE TABLE rev_hierarchies (
    hierarchy_id bigint NOT NULL,
    dimension_id bigint NOT NULL,
    hierarchy_type_code character varying(30) NOT NULL,
    multi_top_flag character varying(1) NOT NULL,
    hierarchy_usage_code character varying(30) NOT NULL,
    automatic_inheritance character varying(1) NOT NULL,
    show_member_code character varying(1) NOT NULL,
    init_display_level smallint,
    orphan_branch character varying(1) NOT NULL,
    display_signage character varying(1) NOT NULL,
    maxlevels smallint,
    last_modified_by character varying(20) NOT NULL,
    last_modified_date timestamp without time zone NOT NULL,
    created_by character varying(20) NOT NULL,
    creation_date timestamp without time zone NOT NULL
);
 #   DROP TABLE public.rev_hierarchies;
       public         postgres    false    3            �            1259    32819    rev_hierarchy_filter    TABLE     �   CREATE TABLE rev_hierarchy_filter (
    sys_id_num bigint NOT NULL,
    hierarchy_sys_id bigint NOT NULL,
    hierarchy_level integer NOT NULL,
    leaf_node bigint NOT NULL
);
 (   DROP TABLE public.rev_hierarchy_filter;
       public         postgres    false    3            �            1259    32823    rev_hierarchy_levels    TABLE     �   CREATE TABLE rev_hierarchy_levels (
    hierarchy_id bigint NOT NULL,
    level_num numeric(22,0) NOT NULL,
    level_name character varying(150) NOT NULL,
    level_description character varying(255) NOT NULL
);
 (   DROP TABLE public.rev_hierarchy_levels;
       public         postgres    false    3            �            1259    32863    rev_tab_columns    TABLE     �  CREATE TABLE rev_tab_columns (
    table_name character varying(30) NOT NULL,
    column_name character varying(30) NOT NULL,
    owner character varying(30) NOT NULL,
    display_flg smallint NOT NULL,
    rev_data_type_cd integer NOT NULL,
    dbf_name character varying(10),
    data_type character varying(20),
    logical_data_type character varying(20),
    data_type_size character varying(20),
    data_precision character varying(10),
    data_scale character varying(10)
);
 #   DROP TABLE public.rev_tab_columns;
       public         postgres    false    3            �            1259    32867    rev_tab_columns_mls    TABLE     5  CREATE TABLE rev_tab_columns_mls (
    mls_cd character varying(10) NOT NULL,
    display_name character varying(1024) NOT NULL,
    description character varying(4000),
    table_name character varying(30) NOT NULL,
    column_name character varying(30) NOT NULL,
    owner character varying(30) NOT NULL
);
 '   DROP TABLE public.rev_tab_columns_mls;
       public         postgres    false    3            �            1259    32851    rev_table_class_assignment    TABLE       CREATE TABLE rev_table_class_assignment (
    table_name character varying(30) NOT NULL,
    owner character varying(30) NOT NULL,
    table_classification_cd integer NOT NULL,
    protected_flg smallint NOT NULL,
    validated_flag character(1) NOT NULL
);
 .   DROP TABLE public.rev_table_class_assignment;
       public         postgres    false    3            �            1259    32855    rev_table_class_properties    TABLE     �   CREATE TABLE rev_table_class_properties (
    table_classification_cd integer NOT NULL,
    table_property_cd integer NOT NULL
);
 .   DROP TABLE public.rev_table_class_properties;
       public         postgres    false    3            �            1259    32843    rev_table_classification_b    TABLE     �   CREATE TABLE rev_table_classification_b (
    table_classification_cd integer NOT NULL,
    user_assign_flg smallint NOT NULL,
    dynamic_priv_flg smallint NOT NULL,
    classification_flg smallint
);
 .   DROP TABLE public.rev_table_classification_b;
       public         postgres    false    3            �            1259    32847    rev_table_classification_tl    TABLE     �   CREATE TABLE rev_table_classification_tl (
    language character varying(10) NOT NULL,
    table_classification_cd integer NOT NULL,
    table_classification character varying(100) NOT NULL,
    description character varying(255)
);
 /   DROP TABLE public.rev_table_classification_tl;
       public         postgres    false    3            �            1259    32859    rev_table_properties    TABLE     �   CREATE TABLE rev_table_properties (
    table_property_cd integer NOT NULL,
    table_property character varying(30) NOT NULL,
    description character varying(255)
);
 (   DROP TABLE public.rev_table_properties;
       public         postgres    false    3            �            1259    32832    rev_tables_b    TABLE     �   CREATE TABLE rev_tables_b (
    table_name character varying(30) NOT NULL,
    owner character varying(30) NOT NULL,
    display_flg smallint NOT NULL,
    dbf_name character varying(10),
    tablespace_name character varying(30)
);
     DROP TABLE public.rev_tables_b;
       public         postgres    false    3            �            1259    32836    rev_tables_tl    TABLE     �   CREATE TABLE rev_tables_tl (
    mls_cd character varying(10) NOT NULL,
    table_name character varying(30) NOT NULL,
    owner character varying(30) NOT NULL,
    display_name character varying(1024) NOT NULL,
    description character varying(4000)
);
 !   DROP TABLE public.rev_tables_tl;
       public         postgres    false    3            �           2604    16435    auth_group id    DEFAULT     `   ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    193    193            �           2604    16445    auth_group_permissions id    DEFAULT     x   ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    195    195            �           2604    16427    auth_permission id    DEFAULT     j   ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190    191            �           2604    16453    auth_user id    DEFAULT     ^   ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �           2604    16463    auth_user_groups id    DEFAULT     l   ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �           2604    16471    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    201    201            �           2604    16561    batchs_batch id    DEFAULT     d   ALTER TABLE ONLY batchs_batch ALTER COLUMN id SET DEFAULT nextval('batchs_batch_id_seq'::regclass);
 >   ALTER TABLE public.batchs_batch ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    205    205            �           2604    16572    batchs_parameter id    DEFAULT     l   ALTER TABLE ONLY batchs_parameter ALTER COLUMN id SET DEFAULT nextval('batchs_parameter_id_seq'::regclass);
 B   ALTER TABLE public.batchs_parameter ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206    207            �           2604    16531    django_admin_log id    DEFAULT     l   ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �           2604    16417    django_content_type id    DEFAULT     r   ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    188    189    189            �           2604    16406    django_migrations id    DEFAULT     n   ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186    187            �           2604    16599    members_attribute id    DEFAULT     p   ALTER TABLE ONLY members_attribute ALTER COLUMN id SET DEFAULT nextval('"DIM_ORG_UNIT_ATTR_id_seq"'::regclass);
 C   ALTER TABLE public.members_attribute ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            �           2604    16607    members_member id    DEFAULT     j   ALTER TABLE ONLY members_member ALTER COLUMN id SET DEFAULT nextval('"DIM_ORG_UNIT_B_id_seq"'::regclass);
 @   ALTER TABLE public.members_member ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210    211            �	           0    0    DIM_ORG_UNIT_ATTR_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"DIM_ORG_UNIT_ATTR_id_seq"', 1, false);
            public       postgres    false    208            �	           0    0    DIM_ORG_UNIT_B_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"DIM_ORG_UNIT_B_id_seq"', 1, true);
            public       postgres    false    210            �	          0    24606    DIM_PRODUCT_ATTR 
   TABLE DATA               H   COPY "DIM_PRODUCT_ATTR" (id, id_code, id_alfa, name, value) FROM stdin;
    public       postgres    false    216   �      �	           0    0    DIM_PRODUCT_ATTR_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('"DIM_PRODUCT_ATTR_id_seq"', 1, false);
            public       postgres    false    215            �	          0    24617    DIM_PRODUCT_B 
   TABLE DATA               �   COPY "DIM_PRODUCT_B" (id, id_code, id_alfa, name, description, enabled, if_lead, create_date, create_by, modified_date, modified_by) FROM stdin;
    public       postgres    false    218   �      �	           0    0    DIM_product_B_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"DIM_product_B_id_seq"', 1, false);
            public       postgres    false    217            �	          0    32792 
   SEG_FOLDER 
   TABLE DATA               d   COPY "SEG_FOLDER" (id, "V_DSNID", "V_SEGMENT_CODE", "V_SEGMENT_NAME", "V_SEGMENT_DESC") FROM stdin;
    public       postgres    false    220         |	          0    16432 
   auth_group 
   TABLE DATA               '   COPY auth_group (id, name) FROM stdin;
    public       postgres    false    193         �	           0    0    auth_group_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auth_group_id_seq', 1, false);
            public       postgres    false    192            ~	          0    16442    auth_group_permissions 
   TABLE DATA               F   COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    195   �      �	           0    0    auth_group_permissions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);
            public       postgres    false    194            z	          0    16424    auth_permission 
   TABLE DATA               G   COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    191   �      �	           0    0    auth_permission_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('auth_permission_id_seq', 36, true);
            public       postgres    false    190            �	          0    16450 	   auth_user 
   TABLE DATA               �   COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    197   K!      �	          0    16460    auth_user_groups 
   TABLE DATA               :   COPY auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    199   h!      �	           0    0    auth_user_groups_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);
            public       postgres    false    198            �	           0    0    auth_user_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('auth_user_id_seq', 1, false);
            public       postgres    false    196            �	          0    16468    auth_user_user_permissions 
   TABLE DATA               I   COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    201   �!      �	           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    200            �	          0    16558    batchs_batch 
   TABLE DATA               �   COPY batchs_batch (id, "V_BATCH_ID", "V_BATCH_DESCRIPTION", "V_CREATED_BY", "V_CREATED_DATE", "V_LAST_MODIFIED_DATE", "V_LAST_MODIFIED_BY", "V_BATCH_TYPE", "V_SRC_FRAMEWORK", "V_DSN_NAME", "V_IS_SEQUENTIAL", highlighted, owner_id) FROM stdin;
    public       postgres    false    205   �!      �	           0    0    batchs_batch_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('batchs_batch_id_seq', 1, false);
            public       postgres    false    204            �	          0    16569    batchs_parameter 
   TABLE DATA               �   COPY batchs_parameter (id, "V_BATCH_ID", "V_TASK_ID", "I_PARAMETER_ORDER", "V_PARAMETER_NAME", "V_PARAMETER_VALUE") FROM stdin;
    public       postgres    false    207   �!      �	           0    0    batchs_parameter_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('batchs_parameter_id_seq', 1, false);
            public       postgres    false    206            �	          0    16528    django_admin_log 
   TABLE DATA               �   COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    203   �!      �	           0    0    django_admin_log_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);
            public       postgres    false    202            x	          0    16414    django_content_type 
   TABLE DATA               <   COPY django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    189   �!      �	           0    0    django_content_type_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);
            public       postgres    false    188            v	          0    16403    django_migrations 
   TABLE DATA               <   COPY django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    187   �"      �	           0    0    django_migrations_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('django_migrations_id_seq', 24, true);
            public       postgres    false    186            �	          0    32782    django_session 
   TABLE DATA               I   COPY django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    219   ~$      �	          0    16596    members_attribute 
   TABLE DATA               G   COPY members_attribute (id, id_code, id_alfa, name, value) FROM stdin;
    public       postgres    false    209   �$      �	          0    16604    members_member 
   TABLE DATA               �   COPY members_member (id, id_code, id_alfa, name, description, enabled, if_lead, create_date, create_by, modified_date, modified_by) FROM stdin;
    public       postgres    false    211   �$      t	          0    16398    prueba 
   TABLE DATA               !   COPY prueba (prueba) FROM stdin;
    public       postgres    false    185   %      �	          0    32800    rev_column_properties 
   TABLE DATA               |   COPY rev_column_properties (column_property_cd, property_column, protected_flg, table_name, column_name, owner) FROM stdin;
    public       postgres    false    221   $%      �	          0    32804    rev_column_property_cd 
   TABLE DATA               b   COPY rev_column_property_cd (column_property_cd, currency_basis_flg, fe_ui_setup_flg) FROM stdin;
    public       postgres    false    222   A%      �	          0    32808    rev_column_property_mls 
   TABLE DATA               d   COPY rev_column_property_mls (mls_cd, column_property_cd, column_property, description) FROM stdin;
    public       postgres    false    223   ^%      �	          0    32812    rev_dim_attributes_tl 
   TABLE DATA               �   COPY rev_dim_attributes_tl (dimension_id, attribute_id, attribute_name, description, last_modified_by, last_modified_date, created_by, creation_date, language, source_lang) FROM stdin;
    public       postgres    false    224   {%      �	          0    16611    rev_dimensions_b 
   TABLE DATA                 COPY rev_dimensions_b (dimension_id, member_data_type_code, member_b_table_name, member_tl_table_name, member_col, member_display_code_col, member_name_col, member_description_col, hierarchy_table_name, attribute_table_name, last_modified_by, last_modified_date, created_by, creation_date, definition_language, dimension_active_flag, dimension_type_code, simple_dimension_flag, user_defined_flag, write_flag, dimension_editable_flag, key_dimension_flag, start_range, member_code_column, table_type, flattened_table_name) FROM stdin;
    public       postgres    false    212   �%      �	          0    16614    rev_dimensions_tl 
   TABLE DATA               �   COPY rev_dimensions_tl (dimension_id, dimension_name, description, last_modified_by, last_modified_date, created_by, creation_date) FROM stdin;
    public       postgres    false    213   ?      �	          0    32828    rev_hier_definitions 
   TABLE DATA               �   COPY rev_hier_definitions (hierarchy_id, flattened_rows_completion_code, created_by, creation_date, last_modified_by, last_modified_date) FROM stdin;
    public       postgres    false    228   �?      �	          0    32815    rev_hierarchies 
   TABLE DATA               "  COPY rev_hierarchies (hierarchy_id, dimension_id, hierarchy_type_code, multi_top_flag, hierarchy_usage_code, automatic_inheritance, show_member_code, init_display_level, orphan_branch, display_signage, maxlevels, last_modified_by, last_modified_date, created_by, creation_date) FROM stdin;
    public       postgres    false    225   �?      �	          0    32819    rev_hierarchy_filter 
   TABLE DATA               a   COPY rev_hierarchy_filter (sys_id_num, hierarchy_sys_id, hierarchy_level, leaf_node) FROM stdin;
    public       postgres    false    226   �?      �	          0    32823    rev_hierarchy_levels 
   TABLE DATA               _   COPY rev_hierarchy_levels (hierarchy_id, level_num, level_name, level_description) FROM stdin;
    public       postgres    false    227   @      �	          0    32863    rev_tab_columns 
   TABLE DATA               �   COPY rev_tab_columns (table_name, column_name, owner, display_flg, rev_data_type_cd, dbf_name, data_type, logical_data_type, data_type_size, data_precision, data_scale) FROM stdin;
    public       postgres    false    236   @      �	          0    32867    rev_tab_columns_mls 
   TABLE DATA               i   COPY rev_tab_columns_mls (mls_cd, display_name, description, table_name, column_name, owner) FROM stdin;
    public       postgres    false    237   ;@      �	          0    32851    rev_table_class_assignment 
   TABLE DATA               x   COPY rev_table_class_assignment (table_name, owner, table_classification_cd, protected_flg, validated_flag) FROM stdin;
    public       postgres    false    233   X@      �	          0    32855    rev_table_class_properties 
   TABLE DATA               Y   COPY rev_table_class_properties (table_classification_cd, table_property_cd) FROM stdin;
    public       postgres    false    234   u@      �	          0    32843    rev_table_classification_b 
   TABLE DATA               }   COPY rev_table_classification_b (table_classification_cd, user_assign_flg, dynamic_priv_flg, classification_flg) FROM stdin;
    public       postgres    false    231   �@      �	          0    32847    rev_table_classification_tl 
   TABLE DATA               t   COPY rev_table_classification_tl (language, table_classification_cd, table_classification, description) FROM stdin;
    public       postgres    false    232   �@      �	          0    32859    rev_table_properties 
   TABLE DATA               W   COPY rev_table_properties (table_property_cd, table_property, description) FROM stdin;
    public       postgres    false    235   �@      �	          0    32832    rev_tables_b 
   TABLE DATA               Z   COPY rev_tables_b (table_name, owner, display_flg, dbf_name, tablespace_name) FROM stdin;
    public       postgres    false    229   �@      �	          0    32836    rev_tables_tl 
   TABLE DATA               V   COPY rev_tables_tl (mls_cd, table_name, owner, display_name, description) FROM stdin;
    public       postgres    false    230   A      �           2606    16601 (   members_attribute DIM_ORG_UNIT_ATTR_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY members_attribute
    ADD CONSTRAINT "DIM_ORG_UNIT_ATTR_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.members_attribute DROP CONSTRAINT "DIM_ORG_UNIT_ATTR_pkey";
       public         postgres    false    209    209            �           2606    16609 "   members_member DIM_ORG_UNIT_B_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY members_member
    ADD CONSTRAINT "DIM_ORG_UNIT_B_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.members_member DROP CONSTRAINT "DIM_ORG_UNIT_B_pkey";
       public         postgres    false    211    211            �           2606    24611 &   DIM_PRODUCT_ATTR DIM_PRODUCT_ATTR_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "DIM_PRODUCT_ATTR"
    ADD CONSTRAINT "DIM_PRODUCT_ATTR_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."DIM_PRODUCT_ATTR" DROP CONSTRAINT "DIM_PRODUCT_ATTR_pkey";
       public         postgres    false    216    216            �           2606    24622     DIM_PRODUCT_B DIM_PRODUCT_B_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "DIM_PRODUCT_B"
    ADD CONSTRAINT "DIM_PRODUCT_B_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."DIM_PRODUCT_B" DROP CONSTRAINT "DIM_PRODUCT_B_pkey";
       public         postgres    false    218    218            �           2606    32799    SEG_FOLDER SEG_FOLDER_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "SEG_FOLDER"
    ADD CONSTRAINT "SEG_FOLDER_pkey" PRIMARY KEY (id, "V_DSNID");
 H   ALTER TABLE ONLY public."SEG_FOLDER" DROP CONSTRAINT "SEG_FOLDER_pkey";
       public         postgres    false    220    220    220            �           2606    16439    auth_group auth_group_name_key 
   CONSTRAINT     R   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    193    193            �           2606    16494 D   auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 n   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq;
       public         postgres    false    195    195    195            �           2606    16447 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    195    195            �           2606    16437    auth_group auth_group_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    193    193            �           2606    16480 =   auth_permission auth_permission_content_type_id_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);
 g   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_01ab375a_uniq;
       public         postgres    false    191    191    191            �           2606    16429 $   auth_permission auth_permission_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    191    191            �           2606    16465 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    199    199            �           2606    16509 7   auth_user_groups auth_user_groups_user_id_94350c0c_uniq 
   CONSTRAINT     x   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);
 a   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_94350c0c_uniq;
       public         postgres    false    199    199    199            �           2606    16455    auth_user auth_user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    197    197            �           2606    16473 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    201    201            �           2606    16523 K   auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 u   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq;
       public         postgres    false    201    201    201            �           2606    16551     auth_user auth_user_username_key 
   CONSTRAINT     X   ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    197    197            �           2606    16566    batchs_batch batchs_batch_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY batchs_batch
    ADD CONSTRAINT batchs_batch_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.batchs_batch DROP CONSTRAINT batchs_batch_pkey;
       public         postgres    false    205    205            �           2606    16577 &   batchs_parameter batchs_parameter_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY batchs_parameter
    ADD CONSTRAINT batchs_parameter_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.batchs_parameter DROP CONSTRAINT batchs_parameter_pkey;
       public         postgres    false    207    207            �           2606    16537 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    203    203            �           2606    16421 ?   django_content_type django_content_type_app_label_76bd3d3b_uniq 
   CONSTRAINT        ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);
 i   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_76bd3d3b_uniq;
       public         postgres    false    189    189    189            �           2606    16419 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    189    189            �           2606    16411 (   django_migrations django_migrations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    187    187            �           2606    32789 "   django_session django_session_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    219    219            �           2606    16618    rev_dimensions_tl firstkey 
   CONSTRAINT     [   ALTER TABLE ONLY rev_dimensions_tl
    ADD CONSTRAINT firstkey PRIMARY KEY (dimension_id);
 D   ALTER TABLE ONLY public.rev_dimensions_tl DROP CONSTRAINT firstkey;
       public         postgres    false    213    213            �           1259    16482    auth_group_name_a6ea08ec_like    INDEX     a   CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    193            �           1259    16495    auth_group_permissions_0e939a4f    INDEX     _   CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);
 3   DROP INDEX public.auth_group_permissions_0e939a4f;
       public         postgres    false    195            �           1259    16496    auth_group_permissions_8373b171    INDEX     d   CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);
 3   DROP INDEX public.auth_group_permissions_8373b171;
       public         postgres    false    195            �           1259    16481    auth_permission_417f1b1c    INDEX     X   CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);
 ,   DROP INDEX public.auth_permission_417f1b1c;
       public         postgres    false    191            �           1259    16511    auth_user_groups_0e939a4f    INDEX     S   CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);
 -   DROP INDEX public.auth_user_groups_0e939a4f;
       public         postgres    false    199            �           1259    16510    auth_user_groups_e8701ad4    INDEX     R   CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);
 -   DROP INDEX public.auth_user_groups_e8701ad4;
       public         postgres    false    199            �           1259    16525 #   auth_user_user_permissions_8373b171    INDEX     l   CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);
 7   DROP INDEX public.auth_user_user_permissions_8373b171;
       public         postgres    false    201            �           1259    16524 #   auth_user_user_permissions_e8701ad4    INDEX     f   CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);
 7   DROP INDEX public.auth_user_user_permissions_e8701ad4;
       public         postgres    false    201            �           1259    16552     auth_user_username_6821ab7c_like    INDEX     g   CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    197            �           1259    16583    batchs_batch_5e7b1936    INDEX     K   CREATE INDEX batchs_batch_5e7b1936 ON batchs_batch USING btree (owner_id);
 )   DROP INDEX public.batchs_batch_5e7b1936;
       public         postgres    false    205            �           1259    16548    django_admin_log_417f1b1c    INDEX     Z   CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);
 -   DROP INDEX public.django_admin_log_417f1b1c;
       public         postgres    false    203            �           1259    16549    django_admin_log_e8701ad4    INDEX     R   CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);
 -   DROP INDEX public.django_admin_log_e8701ad4;
       public         postgres    false    203            �           1259    32790    django_session_de54fa62    INDEX     R   CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);
 +   DROP INDEX public.django_session_de54fa62;
       public         postgres    false    219            �           1259    32791 (   django_session_session_key_c0390e0f_like    INDEX     w   CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    219            �           1259    32803    pk_rev_column_properties    INDEX     �   CREATE UNIQUE INDEX pk_rev_column_properties ON rev_column_properties USING btree (column_property_cd, table_name, column_name, owner);
 ,   DROP INDEX public.pk_rev_column_properties;
       public         postgres    false    221    221    221    221            �           1259    32807    pk_rev_column_property_cd    INDEX     j   CREATE UNIQUE INDEX pk_rev_column_property_cd ON rev_column_property_cd USING btree (column_property_cd);
 -   DROP INDEX public.pk_rev_column_property_cd;
       public         postgres    false    222            �           1259    32811    pk_rev_column_property_mls    INDEX     t   CREATE UNIQUE INDEX pk_rev_column_property_mls ON rev_column_property_mls USING btree (mls_cd, column_property_cd);
 .   DROP INDEX public.pk_rev_column_property_mls;
       public         postgres    false    223    223            �           1259    32831    pk_rev_hier_definitions    INDEX     `   CREATE UNIQUE INDEX pk_rev_hier_definitions ON rev_hier_definitions USING btree (hierarchy_id);
 +   DROP INDEX public.pk_rev_hier_definitions;
       public         postgres    false    228            �           1259    32818    pk_rev_hierarchies    INDEX     V   CREATE UNIQUE INDEX pk_rev_hierarchies ON rev_hierarchies USING btree (hierarchy_id);
 &   DROP INDEX public.pk_rev_hierarchies;
       public         postgres    false    225            �           1259    32822    pk_rev_hierarchy_filter    INDEX     �   CREATE UNIQUE INDEX pk_rev_hierarchy_filter ON rev_hierarchy_filter USING btree (sys_id_num, hierarchy_sys_id, hierarchy_level, leaf_node);
 +   DROP INDEX public.pk_rev_hierarchy_filter;
       public         postgres    false    226    226    226    226            �           1259    32826    pk_rev_hierarchy_levels    INDEX     k   CREATE UNIQUE INDEX pk_rev_hierarchy_levels ON rev_hierarchy_levels USING btree (hierarchy_id, level_num);
 +   DROP INDEX public.pk_rev_hierarchy_levels;
       public         postgres    false    227    227            �           1259    32866    pk_rev_tab_columns    INDEX     h   CREATE UNIQUE INDEX pk_rev_tab_columns ON rev_tab_columns USING btree (table_name, owner, column_name);
 &   DROP INDEX public.pk_rev_tab_columns;
       public         postgres    false    236    236    236            �           1259    32873    pk_rev_tab_columns_mls    INDEX     x   CREATE UNIQUE INDEX pk_rev_tab_columns_mls ON rev_tab_columns_mls USING btree (mls_cd, table_name, owner, column_name);
 *   DROP INDEX public.pk_rev_tab_columns_mls;
       public         postgres    false    237    237    237    237            �           1259    32854    pk_rev_table_class_assignment    INDEX     �   CREATE UNIQUE INDEX pk_rev_table_class_assignment ON rev_table_class_assignment USING btree (table_name, owner, table_classification_cd);
 1   DROP INDEX public.pk_rev_table_class_assignment;
       public         postgres    false    233    233    233            �           1259    32858    pk_rev_table_class_properties    INDEX     �   CREATE UNIQUE INDEX pk_rev_table_class_properties ON rev_table_class_properties USING btree (table_classification_cd, table_property_cd);
 1   DROP INDEX public.pk_rev_table_class_properties;
       public         postgres    false    234    234            �           1259    32846    pk_rev_table_classification_b    INDEX     w   CREATE UNIQUE INDEX pk_rev_table_classification_b ON rev_table_classification_b USING btree (table_classification_cd);
 1   DROP INDEX public.pk_rev_table_classification_b;
       public         postgres    false    231            �           1259    32850    pk_rev_table_classification_tl    INDEX     �   CREATE UNIQUE INDEX pk_rev_table_classification_tl ON rev_table_classification_tl USING btree (language, table_classification_cd);
 2   DROP INDEX public.pk_rev_table_classification_tl;
       public         postgres    false    232    232            �           1259    32862    pk_rev_table_properties    INDEX     e   CREATE UNIQUE INDEX pk_rev_table_properties ON rev_table_properties USING btree (table_property_cd);
 +   DROP INDEX public.pk_rev_table_properties;
       public         postgres    false    235            �           1259    32835    pk_rev_tables_b    INDEX     U   CREATE UNIQUE INDEX pk_rev_tables_b ON rev_tables_b USING btree (table_name, owner);
 #   DROP INDEX public.pk_rev_tables_b;
       public         postgres    false    229    229            �           1259    32842    pk_rev_tables_tl    INDEX     _   CREATE UNIQUE INDEX pk_rev_tables_tl ON rev_tables_tl USING btree (mls_cd, table_name, owner);
 $   DROP INDEX public.pk_rev_tables_tl;
       public         postgres    false    230    230    230            �           1259    32827    xak1rev_hierarchy_levels    INDEX     m   CREATE UNIQUE INDEX xak1rev_hierarchy_levels ON rev_hierarchy_levels USING btree (hierarchy_id, level_name);
 ,   DROP INDEX public.xak1rev_hierarchy_levels;
       public         postgres    false    227    227            �           2606    16488 V   auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id;
       public       postgres    false    191    195    2212            �           2606    16483 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    195    193    2217            �           2606    16474 O   auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id;
       public       postgres    false    191    189    2207            �           2606    16503 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    199    193    2217            �           2606    16498 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    199    2225    197            �           2606    16517 Z   auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id;
       public       postgres    false    201    191    2212            �           2606    16512 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    2225    197    201            �           2606    16578 ;   batchs_batch batchs_batch_owner_id_c8399036_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY batchs_batch
    ADD CONSTRAINT batchs_batch_owner_id_c8399036_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.batchs_batch DROP CONSTRAINT batchs_batch_owner_id_c8399036_fk_auth_user_id;
       public       postgres    false    205    197    2225            �           2606    16538 P   django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id;
       public       postgres    false    2207    189    203            �           2606    16543 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    2225    203    197            �           2606    32914 9   rev_table_classification_tl fk__table_classification_tl_1    FK CONSTRAINT     �   ALTER TABLE ONLY rev_table_classification_tl
    ADD CONSTRAINT fk__table_classification_tl_1 FOREIGN KEY (table_classification_cd) REFERENCES rev_table_classification_b(table_classification_cd);
 c   ALTER TABLE ONLY public.rev_table_classification_tl DROP CONSTRAINT fk__table_classification_tl_1;
       public       postgres    false    2276    231    232            �           2606    32874 0   rev_column_properties fk_rev_column_properties_1    FK CONSTRAINT     �   ALTER TABLE ONLY rev_column_properties
    ADD CONSTRAINT fk_rev_column_properties_1 FOREIGN KEY (column_property_cd) REFERENCES rev_column_property_cd(column_property_cd);
 Z   ALTER TABLE ONLY public.rev_column_properties DROP CONSTRAINT fk_rev_column_properties_1;
       public       postgres    false    2267    222    221            �           2606    32879 4   rev_column_property_mls fk_rev_column_property_mls_1    FK CONSTRAINT     �   ALTER TABLE ONLY rev_column_property_mls
    ADD CONSTRAINT fk_rev_column_property_mls_1 FOREIGN KEY (column_property_cd) REFERENCES rev_column_property_cd(column_property_cd);
 ^   ALTER TABLE ONLY public.rev_column_property_mls DROP CONSTRAINT fk_rev_column_property_mls_1;
       public       postgres    false    223    2267    222            �           2606    32889 $   rev_tab_columns fk_rev_tab_columns_1    FK CONSTRAINT     �   ALTER TABLE ONLY rev_tab_columns
    ADD CONSTRAINT fk_rev_tab_columns_1 FOREIGN KEY (table_name, owner) REFERENCES rev_tables_b(table_name, owner);
 N   ALTER TABLE ONLY public.rev_tab_columns DROP CONSTRAINT fk_rev_tab_columns_1;
       public       postgres    false    229    236    236    229    2274            �           2606    32884     rev_tables_tl fk_rev_tables_tl_1    FK CONSTRAINT     �   ALTER TABLE ONLY rev_tables_tl
    ADD CONSTRAINT fk_rev_tables_tl_1 FOREIGN KEY (table_name, owner) REFERENCES rev_tables_b(table_name, owner);
 J   ALTER TABLE ONLY public.rev_tables_tl DROP CONSTRAINT fk_rev_tables_tl_1;
       public       postgres    false    230    230    2274    229    229            �           2606    32894 8   rev_table_class_assignment fk_v_table_class_assignment_1    FK CONSTRAINT     �   ALTER TABLE ONLY rev_table_class_assignment
    ADD CONSTRAINT fk_v_table_class_assignment_1 FOREIGN KEY (table_classification_cd) REFERENCES rev_table_classification_b(table_classification_cd);
 b   ALTER TABLE ONLY public.rev_table_class_assignment DROP CONSTRAINT fk_v_table_class_assignment_1;
       public       postgres    false    231    233    2276            �           2606    32899 8   rev_table_class_assignment fk_v_table_class_assignment_2    FK CONSTRAINT     �   ALTER TABLE ONLY rev_table_class_assignment
    ADD CONSTRAINT fk_v_table_class_assignment_2 FOREIGN KEY (table_name, owner) REFERENCES rev_tables_b(table_name, owner);
 b   ALTER TABLE ONLY public.rev_table_class_assignment DROP CONSTRAINT fk_v_table_class_assignment_2;
       public       postgres    false    233    2274    229    229    233            �           2606    32904 8   rev_table_class_properties fk_v_table_class_properties_1    FK CONSTRAINT     �   ALTER TABLE ONLY rev_table_class_properties
    ADD CONSTRAINT fk_v_table_class_properties_1 FOREIGN KEY (table_classification_cd) REFERENCES rev_table_classification_b(table_classification_cd);
 b   ALTER TABLE ONLY public.rev_table_class_properties DROP CONSTRAINT fk_v_table_class_properties_1;
       public       postgres    false    2276    234    231            �           2606    32909 8   rev_table_class_properties fk_v_table_class_properties_2    FK CONSTRAINT     �   ALTER TABLE ONLY rev_table_class_properties
    ADD CONSTRAINT fk_v_table_class_properties_2 FOREIGN KEY (table_property_cd) REFERENCES rev_table_properties(table_property_cd);
 b   ALTER TABLE ONLY public.rev_table_class_properties DROP CONSTRAINT fk_v_table_class_properties_2;
       public       postgres    false    234    2280    235            �	      x������ � �      �	      x������ � �      �	   ^   x�3�(�ON-N��L�+�W@0$&�"�8���9�<��=}0 ��%3/9� 1�)���!�
��
>�
ΎA�@Nc�vj� $�A:      |	      x������ � �      ~	      x������ � �      z	   �  x�]�M�� F�p��`T��z�1�(m�6R�T	]���c>�����"����b��^�����:��#�P[B.�a���
�����|�T+�>�6O�>���dM	]�7Yl��e7��د��|���t�:�5�ѣ),	�9�๻MUT�}��`}����X���R�_���Y��é�$�zg�����3�kT��B�7��8�n��n���i�	�@;�#�r@{Q�o���jI-��'T#�j@�e5�VԳ������mK�
��U��]�Et��z��Y�5�-��(�;���07�:�^�Øж���8��l��s�X#���>���xB��l�$���ʖN�X��qv6�	��C]f� �	�m�X��/��?����      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      x	   �   x�M�I�0E��a���w�&��p�΂�7%u���<9�#�K�(��؁/6C&�R�K3����ڠ(	�`H�꘭���Lܓ(��)n{��f�b��õ��ކY[�;x&�-��S�)�'-�Ot����{��"~��J�      v	   �  x���]n� F��Ut���_{-#!ڠԒ�S�T��N�2.���8�܏04���i]?�vi!��iX36H@>�L�`�g�rA����	s[ߎlA�H�Ɯ�0#�va��q����S{�����Y���,:��%b2�z{�'�lU�@E��kFm��z}���2�ӝ���գ�.�_UMeȬ�Qu[��:3��ƣEe+-��g��K]����
^*F��[�CX�m��I$[D(��6���v�u�@����|�q8�u�˶��z?{�처�}�0)�����j9-sLGh�b�׷����Ty<+ �:�A(
��uU^QH<o�u/��b��9�(�r,c	#�*�x�-K�	@B};�s�pߜ��s�O z�{m`��������_��)�kAA䑔��>�
�v����H@)�?�Z��X
�/��%@L�,��%y��%&djY�ݏU@��U�g�U(#��=�N� t"�Q      �	      x������ � �      �	      x������ � �      �	   ?   x�3�4�L,�42��LB#Cs]S]CCS+#3+cS=S3csc�(gNi2H-a5\1z\\\ Y      t	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x��]Y�䶮�.������OM�%�R��P�����.����I��(� J�����Cٌwu{8�ھ諶�NM��~�N�`��=�5G�v:v�����������T��qn�~+��v۸b�ǻ?�����P���/�X��o����W��Ϳ�tϭ2�f6��TM��}Lø?-};��'�#���a�kx��z������'T��C�ƈ2��G�p��ͨ�I���f\y2P��w�����7|I
\��~�3g�-���'&��	��}�p8��S��	����bNR���"s"��	vcť@��V�q��)��8�K�_z�T|�kM�]S�4�y�����	)�\W~.�ȽPre��h���ͥ5w���K��@��zf0Ħ難m��yU�4�ؾ���%�Ѱt?��tI��Tuz>��{gCZ1	�5$�m�E�A�(!��+� �&���ϢW�{Yה~S�K�������������v�@B��'�K�&=Mp=s{N�_���'Q���k��Q���z�I�v�~**��i�>6������45{�򇕷O*��Z����ۣ"o/��=����͕�O{��~��ql&�{\J�u������:�gꀄD�O�<]������.�TW:�Tt��`� 9bT�"�DB*��V�һ6~�zQ�ǻ�Ԟ�eD6��+�ip�"S_J��|�0V����~�ŷ�]��ῲ�7%�Hբ��
��bj'mH��.R;@�S�1+_!jO��ƦV�X��[��	Ej�4��-!�J �%T��L�n&N�f�j_J�����~x��'�_[bq�{ޠc[�����z�E�HLS�W~���Mژ��.C����w��c9�ʄ�&��R�!��o���Q�5�inƃ�0m8h�	r�����z.��X��C*W�����畗�����2��dҦ?�|m��M�{�E!m0S�Nf���f���NEx��㍨XNd��<U4�o��t�h��j�\�����Ұ��%�`c~�z�E���T�X��G�����"�M;'(_����!�à�M�~&�5I�,p��<T�����Aw
B�"���n�nu�L���ԥMCJ��u��=T��a��r��N6��y ׻� E�5Έ�_������W@i�Yqv+�Gp��a��?���"�JN��J0-E)KG�p8K_cǘ�ƙD���L/�#x�W�m����=�!n�h�2�e�[�� �+?B`���s��& �����u`�B������$xV
�v�ȵ.!����w�|�<����N��[ǰ'��	s����w��H�)^B2O�h�z��m�cT�"��!�p-��L��U���8M�2V�@(�Y0��dR�i6���ݳ��}R-�rҦ��/�(3���M������9��U�p4 �a��T.[���k?���AW�%���W��?�F��vQ.�ЕSNb8��P4�����Esq�N]�uC��1�s����e+�zU���j�Z���\�\:����~��.�8�6|fj�L��Ӈ8��zC���PRP�E�te�.��1�I�D���аօ\����*��L����ꃴ[%� �j�(��n�����um׶��r�:��]��rQ���X�vè��C	�R�l���Eo�����St�I�H�2���FG�Lb�6���J�ҹ�~E����i��ըt.��aAF��Εf�8N)�p=���^��:�C�L�i�vs3"1Ad�ɷ\�X�����4�W����@�\:���(����h���p?ǔ�����}qO�M��V3�~C�dW���z���+���U\O�Rb#��~�x�?D5�LQ�ݸ��d�2s�u��j$1�-��+�e�9����* ���́9����$7�y�i��O+��G�-%�T�>�����o�C��	H"6HLo��pj�8�������U��'N�	"CT��é���;��鹭)M�\j|�"�Y,�>5?2qY�	l%�nܘP��:�|*N�S[�1#h��\�<��)�}ĳ]���8f+@�J(�w�&��M�o��4�͑G�TD�uv�mp��.�D��8�t�3P^�~=���zЇ)�PFq9�H�m#!�'6�8F+�)�.�ҹt�W2����gT��]'
���Ae;��a�ơ��>����a�_��46n�U���md�ˍ�+��L�Kh�~g�m��2l�U^����O���D/^ȯrه>|uz����]8żԩ����������Ut�p������d��J������:�s_���㍛n�s��s�R2q%�٠��u&�MV�s�3��?h��u�Z4��⌦y\�y�$n:&��Z4'p�%{K�9��V*W�z��i��O�*@��V��y��>�W���Z�ts{��Ə[�
[)z��P�}��{1��Wo�w�F���\՚-�7e��ՌU;����d�U�%��<�8���v���B�T�8���AD�}[���K���r�u��،�:�a��&R��������0X���[�N�a�;�D&�cx-!�����+��ߏ��l�N(�MGTP�K�)2t�p��zV�ۡ�zT .�9�N}N@�Hx�^��`��;�X�4^�\:����.å�-�8��*_��h�B�B����ܬ��f���fH9�[�k�VW�B@r�Y
x�q�ĚU��qK���cq�l��^ݺ2b��mp�K�~՜�"�7�u�E��z���-���F������N(F�:��V9�a�i͋���I�%f%�bԓ��II����D�����Xf-���Z���)G���T,'�Z��ฌ������4�A_�]����`����a�3OҐū��R��Bo�a�k��#�0%ET/CY���rxd�2z�شyd�CQ��
4m��'0ŕ+E��q3�v��ߤ�a~86ww��j>�q6e��~��H�゙���U�-������v�n���3��W������U�s�wC���x�(�4�[���RQn��C�#9TA�y����ze�lh1���K"k@)h��2��@ҧ�Y	/����s�8��P�&D����mf&�©��`���>�|:�LU����	��?t��(��d�#
[���ʐ����á�����z�W�%��	�p�V;6�(�̝{�:����T���̮�3�r��Wjgs��%$�����Zo�:ME�B�::�vHj:fW���N�
bM���*���f�F����֭���sq�(D�����
��@�6�[��y:6EW՛���D0���5�d��G����]u�L�>Z/�:튪��ُ� hb)�v��J�����̱�{2T�asG�z�E|����_}iO1P�����B� _���Wz(�B2Ԙ)^B�r��bZ�=�j�z,v�����GQfF7n�O;tX��������|KD�~@<���i����z��a<K!����d��);���S� �w�w]�zDQ��3�_�@⿕�*"\6�N׀N�pt��]�X*����>�Q'h;`&�eJg�f�= i�ݼ>�<4Ӥ�U���v=�I����rn��}"����g�����=MZg�������#���. BŋH�-�����aہ��ZK��oʂu#V�L�+�"O�n��ܙ�np @3>�������������ؙM�/��K�3{ɾqf�t�|�8�/��.:?0��v"2��仑�/��O���)��S���G^�H���-7��KE�D`��{�[Cg�b��Q��Tz2��<�ߕI!�YP9�������}����k��16��f*���?y<��8;}��n����ç*$�a%�r������z�bv�����x�|��2�w�!���O���	T�L�)�B(�g6K��q��a;� Z��[n���2��^�a<�X�Ǧ���$��o��Y�_�\�r�`�']�0ŋH���Jg��Ѯ�5,B$d�+��j4�k�!p~g�$͑�H`	�Dκ�K��}g1�
����q7��P{4���pA��������	7N���Q^^�\: `	  ��f��;�fe.z*�ٮ+*�M�f|�����M_O�f������n�	ONQ̅�Ó~Zs��HA��7\�f�����r�j&����L�� 5��+-ڱ�h1��*-�p5��n���B�?]�Q��a��:R���A ���GT"|ݲ)_�%�� ����q]m�gVP0��sŋH��z��I��-EN�"��D ï�������53Ǒ�E$'	<z�u��+��D��t\�"�����>�MQ������DN[q��+e��.� �Mn��ո}�������D;�9wA�J0�3�/IV�����0�YG�yG*�H$�5��P"�������E$g�K$�J"D)	�n���.�j湳nڌ�i;Af	�7݄g��gQM�R묿Gл��Q�d���M7���0)֗�`c
� ���U�mVAr؎,Ī��|����,����9��p���6�N%?���;��dص�R���������-���ǈ�L�xP�2Om��Xw+YIdBP����U�7�f�â��*�wk!\R/�p�z5�����̅�2 r���J�[��c�(Cz��u(�x����8b� �I��Tҥ$����F�@'��!�x	I{�f&Ђ�P96�� ��B�n�ej �T��C���'|��*��I��o�Q	JIS�C��,y�i)qB a깩�E()?��@�E"'1�hqR:�-*��OuS��������$�.�����8aI�ޱ�N�2s��0�Gc� ���l�7Lp������T�T����'�,�7rw�?��_�v��xS	�7h̛H����}��Y����,t��D�4�IR$��&?q<�����'*�y8���)Gɑ��.�=���
;LO*y��̎�Z���a��k��|��2]^�..������`$g���c��������췠�>Ab*�x����I�Vϳ�;�)ݶ_��9[/�3�����b��i��l�4~+Ӝ��t?�d��(V�0h�P�����Q���|@��� ���T�W=�����#�.:���X Ǡ�0�0������[8�C����>�H/A���gJ	��;��5G`X��R��n���E���2~i���Gv� �_�5F�F#&KϜ��R}�CRf(�,�N�q�̊�kN��t��@�Qn��Tԇ�_��*v����C���dB7(�x��f;�G��w�օ{���J����A������LD��KD�,���
��yA��A ̜��߶ D��+T����=�}��1՞(���X����o�_R	a�l��U�~z��c�D�n4 ہy)oYPR�� ���5q����0��q:�S�NE�6 S*�J|ӂD���6cӈ?C���� !y奿mEɄ�<�G��X�`�Y��2�OBf�Jw#���GFsl�b",mz%���Ip��M/ι�0�'�c�Gt�+�C�����U�?.�,(ADHCX���@c�e������I�4�YIo�^!�U[��}��(ICf��u+��J[D����\�4���H^>Q���*Ty/�Q��{T�?�Aț�R?kI�����,�m/~�#�R��Cѿemx[�G������6��\U��A0��>������<?�By��N�Bڸ-/4�ɥ�a94���.N�=E�Y[�4���9��EE�;� ��7찣AHD��JﺢOa��#p*��
��WA~�%�i�R����c�z��x��� ���K�8f�kBq�
�V���8ϧ٢=��m�7�/����P�X��o7A�'A��`Hc�<+ۭ�K*!l1�9�V�\��|���?����JL̹�0�a�4TmS�w�.m�/uB�a]
��C�:\1�2���r�_�d�B�0��=��H@8�����V�LH��HE=��/���,!l�&�j"Y+���M�K�HL��a�k�r�Z|0+�V<lE�7.e�ڄ�jfa3h.q��@YI��+H���о�XLh�
>��8�x�HHȿ��Gk��`���:�[@#K̨�����q�����ȿ��^���w�}#1ѪD��Hq�����`C�2���ux�as3��}H�P�E����r�ڽE�w~Q���{Ɩ2�����/�1d���FOF�0��oŖ�m)c9y.��A��T�7� &�&
&zi���7��ȿ�����-��xE��â��� %㿓y��-e$&��!r�e�}Հ�t�w�^ɻD����I�z�<��O��g�%X�\��	4g��zյ����$��
QпK����ו����BY;x��V��o��l��i��q*:(b�2j�(=��]G�i]6��-fي�	]%���~����5�Ě      �	   �   x���A
�0EדS�*���A7�܄t��f�t���F7���=�w(I8�x�TY��Z��Z���:b�Y8S?��>F����z�/9�-(���Z��\U�)�߯;�#e�"xJ8&RYd��}c�� G�e      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �      �	      x������ � �     
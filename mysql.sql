/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/1/2022 15:20:46                           */
/*==============================================================*/


alter table DESCRIPCION_TUTORIA 
   drop foreign key FK_DESCRIPC_RELATIONS_TUTORIA;

alter table EMPRESA 
   drop foreign key FK_EMPRESA_RELATIONS_PROVINCI;

alter table ESTUDIANTE 
   drop foreign key FK_ESTUDIAN_RELATIONS_TIPO_EST;

alter table ESTUDIANTE 
   drop foreign key FK_ESTUDIAN_RELATIONS_EMPRESA;

alter table MEDIO 
   drop foreign key FK_MEDIO_RELATIONS_EMPRESA;

alter table PROVINCIA 
   drop foreign key FK_PROVINCI_RELATIONS_PAIS;

alter table RELACION 
   drop foreign key FK_RELACION_RELACION_DESCRIPC;

alter table RELACION 
   drop foreign key FK_RELACION_RELACION2_ESTUDIAN;

alter table RELATIONSHIP_13 
   drop foreign key FK_RELATION_RELATIONS_ESTUDIAN;

alter table RELATIONSHIP_13 
   drop foreign key FK_RELATION_RELATIONS_TUTORIA;

alter table TUTOR 
   drop foreign key FK_TUTOR_RELATIONS_TIPO_TUT;

alter table TUTOR 
   drop foreign key FK_TUTOR_RELATIONS_EMPRESA;

alter table TUTORIA 
   drop foreign key FK_TUTORIA_RELATIONS_TUTOR;

alter table TUTORIA 
   drop foreign key FK_TUTORIA_RELATIONS_MEDIO;


alter table DESCRIPCION_TUTORIA 
   drop foreign key FK_DESCRIPC_RELATIONS_TUTORIA;

drop table if exists DESCRIPCION_TUTORIA;


alter table EMPRESA 
   drop foreign key FK_EMPRESA_RELATIONS_PROVINCI;

drop table if exists EMPRESA;


alter table ESTUDIANTE 
   drop foreign key FK_ESTUDIAN_RELATIONS_TIPO_EST;

alter table ESTUDIANTE 
   drop foreign key FK_ESTUDIAN_RELATIONS_EMPRESA;

drop table if exists ESTUDIANTE;


alter table MEDIO 
   drop foreign key FK_MEDIO_RELATIONS_EMPRESA;

drop table if exists MEDIO;

drop table if exists PAIS;


alter table PROVINCIA 
   drop foreign key FK_PROVINCI_RELATIONS_PAIS;

drop table if exists PROVINCIA;


alter table RELACION 
   drop foreign key FK_RELACION_RELACION2_ESTUDIAN;

alter table RELACION 
   drop foreign key FK_RELACION_RELACION_DESCRIPC;

drop table if exists RELACION;


alter table RELATIONSHIP_13 
   drop foreign key FK_RELATION_RELATIONS_ESTUDIAN;

alter table RELATIONSHIP_13 
   drop foreign key FK_RELATION_RELATIONS_TUTORIA;

drop table if exists RELATIONSHIP_13;

drop table if exists TIPO_ESTUDIANTE;

drop table if exists TIPO_TUTOR;


alter table TUTOR 
   drop foreign key FK_TUTOR_RELATIONS_TIPO_TUT;

alter table TUTOR 
   drop foreign key FK_TUTOR_RELATIONS_EMPRESA;

drop table if exists TUTOR;


alter table TUTORIA 
   drop foreign key FK_TUTORIA_RELATIONS_MEDIO;

alter table TUTORIA 
   drop foreign key FK_TUTORIA_RELATIONS_TUTOR;

drop table if exists TUTORIA;

/*==============================================================*/
/* Table: DESCRIPCION_TUTORIA                                   */
/*==============================================================*/
create table DESCRIPCION_TUTORIA
(
   ID_DESCRIPCIONTUTORIA int not null auto_increment  comment '',
   ID_TUTORIAS          int not null  comment '',
   ESTADO_TUTORIA       text not null  comment '',
   NIVEL_SATISFACCION_TUTORIA text not null  comment '',
   FIN_TUTORIA          text not null  comment '',
   primary key (ID_DESCRIPCIONTUTORIA)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA
(
   ID_EMPRESA           int not null auto_increment  comment '',
   ID_PROVINCIA         int not null  comment '',
   NOMBRE_EMPRESA       text not null  comment '',
   primary key (ID_EMPRESA)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE
(
   ID_ESTUDIANTE        int not null auto_increment  comment '',
   ID_TIPOESTUDIANTE    int not null  comment '',
   ID_EMPRESA           int not null  comment '',
   CEDULA_ESTUDIANTE    char(11) not null  comment '',
   NOMBRE_ESTUDIANTE    text not null  comment '',
   APELLIDO_ESTUDIANTE  text not null  comment '',
   PROFESION_ESTUDIANTE text not null  comment '',
   TELEFONO_ESTUDIANTE  char(10) not null  comment '',
   CORREO_ESTUDIANTE    text not null  comment '',
   primary key (ID_ESTUDIANTE)
);

/*==============================================================*/
/* Table: MEDIO                                                 */
/*==============================================================*/
create table MEDIO
(
   ID_MEDIOS            int not null auto_increment  comment '',
   ID_EMPRESA           int not null  comment '',
   TIPOS_MEDIOS         text not null  comment '',
   COSTO_MEDIO          decimal not null  comment '',
   primary key (ID_MEDIOS)
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS
(
   ID_PAIS              int not null auto_increment  comment '',
   NOMBRE_PAIS          text not null  comment '',
   primary key (ID_PAIS)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA
(
   ID_PROVINCIA         int not null auto_increment  comment '',
   ID_PAIS              int not null  comment '',
   NOMBRE_PROVINCIA     text not null  comment '',
   primary key (ID_PROVINCIA)
);

/*==============================================================*/
/* Table: RELACION                                              */
/*==============================================================*/
create table RELACION
(
   ID_DESCRIPCIONTUTORIA int not null  comment '',
   ID_ESTUDIANTE        int not null  comment '',
   primary key (ID_DESCRIPCIONTUTORIA, ID_ESTUDIANTE)
);

/*==============================================================*/
/* Table: RELATIONSHIP_13                                       */
/*==============================================================*/
create table RELATIONSHIP_13
(
   ID_TUTORIAS          int not null  comment '',
   ID_ESTUDIANTE        int not null  comment '',
   primary key (ID_TUTORIAS, ID_ESTUDIANTE)
);

/*==============================================================*/
/* Table: TIPO_ESTUDIANTE                                       */
/*==============================================================*/
create table TIPO_ESTUDIANTE
(
   ID_TIPOESTUDIANTE    int not null auto_increment  comment '',
   DETALLE_TIPOESTUDIANTE text not null  comment '',
   primary key (ID_TIPOESTUDIANTE)
);

/*==============================================================*/
/* Table: TIPO_TUTOR                                            */
/*==============================================================*/
create table TIPO_TUTOR
(
   ID_TIPOTUTORES       int not null auto_increment  comment '',
   DETALLE_TIPOTUTOR    text not null  comment '',
   ENLACES_TIPOTUTOR    text not null  comment '',
   primary key (ID_TIPOTUTORES)
);

/*==============================================================*/
/* Table: TUTOR                                                 */
/*==============================================================*/
create table TUTOR
(
   ID_TUTOR             int not null auto_increment  comment '',
   ID_TIPOTUTORES       int not null  comment '',
   ID_EMPRESA           int not null  comment '',
   CEDULA_TUTOR         char(11) not null  comment '',
   NOMBRE_TUTOR         text not null  comment '',
   APELLIDO_TUTOR       text not null  comment '',
   PROFESION_TUTOR      text not null  comment '',
   TELEFONO_TUTOR       char(10) not null  comment '',
   CORREO_TUTOR         text not null  comment '',
   TIPO_CONTRATO_TUTOR  text not null  comment '',
   NUMERO_TUTORIAS      int not null  comment '',
   primary key (ID_TUTOR)
);

/*==============================================================*/
/* Table: TUTORIA                                               */
/*==============================================================*/
create table TUTORIA
(
   ID_TUTORIAS          int not null auto_increment  comment '',
   ID_MEDIOS            int not null  comment '',
   ID_TUTOR             int not null  comment '',
   TITULO_TUTORIA       text not null  comment '',
   DURACION_TUTORIA     time not null  comment '',
   FECHAHORA_TUTORIA    timestamp not null  comment '',
   HORA_FIN_TUTORIA     time not null  comment '',
   SALA_TUTORIA         text not null  comment '',
   ENLACE_TUTORIA       text not null  comment '',
   COSTO_TUTORIA        decimal not null  comment '',
   primary key (ID_TUTORIAS)
);

alter table DESCRIPCION_TUTORIA add constraint FK_DESCRIPC_RELATIONS_TUTORIA foreign key (ID_TUTORIAS)
      references TUTORIA (ID_TUTORIAS) on delete restrict on update restrict;

alter table EMPRESA add constraint FK_EMPRESA_RELATIONS_PROVINCI foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_ESTUDIAN_RELATIONS_TIPO_EST foreign key (ID_TIPOESTUDIANTE)
      references TIPO_ESTUDIANTE (ID_TIPOESTUDIANTE) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_ESTUDIAN_RELATIONS_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA) on delete restrict on update restrict;

alter table MEDIO add constraint FK_MEDIO_RELATIONS_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA) on delete restrict on update restrict;

alter table PROVINCIA add constraint FK_PROVINCI_RELATIONS_PAIS foreign key (ID_PAIS)
      references PAIS (ID_PAIS) on delete restrict on update restrict;

alter table RELACION add constraint FK_RELACION_RELACION_DESCRIPC foreign key (ID_DESCRIPCIONTUTORIA)
      references DESCRIPCION_TUTORIA (ID_DESCRIPCIONTUTORIA) on delete restrict on update restrict;

alter table RELACION add constraint FK_RELACION_RELACION2_ESTUDIAN foreign key (ID_ESTUDIANTE)
      references ESTUDIANTE (ID_ESTUDIANTE) on delete restrict on update restrict;

alter table RELATIONSHIP_13 add constraint FK_RELATION_RELATIONS_ESTUDIAN foreign key (ID_ESTUDIANTE)
      references ESTUDIANTE (ID_ESTUDIANTE) on delete restrict on update restrict;

alter table RELATIONSHIP_13 add constraint FK_RELATION_RELATIONS_TUTORIA foreign key (ID_TUTORIAS)
      references TUTORIA (ID_TUTORIAS) on delete restrict on update restrict;

alter table TUTOR add constraint FK_TUTOR_RELATIONS_TIPO_TUT foreign key (ID_TIPOTUTORES)
      references TIPO_TUTOR (ID_TIPOTUTORES) on delete restrict on update restrict;

alter table TUTOR add constraint FK_TUTOR_RELATIONS_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA) on delete restrict on update restrict;

alter table TUTORIA add constraint FK_TUTORIA_RELATIONS_TUTOR foreign key (ID_TUTOR)
      references TUTOR (ID_TUTOR) on delete restrict on update restrict;

alter table TUTORIA add constraint FK_TUTORIA_RELATIONS_MEDIO foreign key (ID_MEDIOS)
      references MEDIO (ID_MEDIOS) on delete restrict on update restrict;

